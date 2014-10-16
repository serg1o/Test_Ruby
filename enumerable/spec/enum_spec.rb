require_relative '../module'
 
describe Enumerable do
 
  hashes = [{"1"=>"Janeiro", "2"=>"Fevereiro", "3"=>"Março"}, {"a"=>12, "b"=>4, "c"=>3}, {}]
  arrays = [[2,4,3,5,67,9], [3,4,5], ["we","erg","fg"], []]
 
  
  hashes.each_with_index do |h, i|
    it "my_each enumerates elements of hash #{i}" do
      expect(h.my_each{|k,v| v}).to eq(h.each{|k,v| v})
    end

    it "my_select selects elements of hash #{i} with key = '2'" do
      expect(h.my_select{|k,v| k == "2"}).to eq(h.select{|k,v| k == "2" })
    end

    it "my_select selects elements of hash #{i} with value = 'Fevereiro'" do
      expect(h.my_select{|k,v| v == "Fevereiro"}).to eq(h.select{|k,v| v == "Fevereiro" })
    end

    it "my_map maps elements of hash #{i}" do
      b = Proc.new {|k, v| k + v.to_s}
      expect(h.my_map_proc(&b).values.to_a).to eq(h.map(&b))
    end

    it "my_all checks if all elements of hash #{i} satisfy v != '3'" do
      expect(h.my_all? {|k,v| v.to_s != "3"}).to eq(h.all? {|k,v| v.to_s != "3" })
    end

    it "my_any checks if all elements of hash #{i} satisfy v == 'Março'" do
      expect(h.my_any? {|k,v| v.to_s == 'Março'}).to eq(h.any? {|k,v| v.to_s == 'Março' })
    end

    it "my_count counts elements of hash #{i} with value > 1 " do
      expect(h.my_count{|k,v| v > 1}).to eq(h.count{|k,v| v > 1 }) unless i == 0
    end

  end

  arrays.each_with_index do |a, i|
    it "my_each enumerates elements of array #{i}" do
      expect(a.my_each{|k,v| v}).to eq(a.each{|k,v| v})
    end

    it "my_map maps elements of array #{i}" do
      b = Proc.new {|arg| arg}
      expect(a.my_map_proc(&b)).to eq(a.map(&b))
    end

    it "my_any checks if any element of array #{i} satisfy v % 2 == 0" do
      expect(a.my_any? {|v| v % 2 == 0}).to eq(a.any? {|v| v % 2 == 0 }) unless i == 2
    end

    it "my_all checks if all elements of array #{i} satisfy v == 'Fevereiro'" do
      expect(a.my_all? {|v| v == 'Fevereiro'}).to eq(a.all? {|v| v == 'Fevereiro' })
    end

    it "my_select selects elements of array #{i} with value = 2" do
      expect(a.my_select{|v| v == 2}).to eq(a.select{|v| v == 2 })
    end

    it "my_select selects elements of array #{i} with value = 'Fevereiro'" do
      expect(a.my_select{|v| v == "Fevereiro"}).to eq(a.select{|v| v == "Fevereiro" })
    end

    it "my_count counts elements of array #{i} with value > 1 " do
      expect(a.my_count{|v| v > 1}).to eq(a.count{|v| v > 1 }) unless i == 2
    end

    it "my_inject sums all elements of array #{i} with initial value of 10 " do
      expect(a.my_inject(10){|sum, n| sum + n}).to eq(a.inject(10){|sum, n| sum + n}) unless i == 2
    end

  end
 

end



