require_relative '../cesar'
 
describe Cesar do
 
  before :each do
    @cesar = Cesar.new
  end

 
  describe "#cesar" do
    it "encrypts a with a shift of 1" do
      expect(@cesar.cesar("a", 1)).to eq("b")
    end

    it "encrypts Hello with a shift of 3" do
      expect(@cesar.cesar("Hello", 3)).to eq("Khoor")
    end

    it "encrypts ABCD wxyz with a shift of 2" do
      expect(@cesar.cesar("ABCD wxyz", 2)).to eq("CDEF yzab")
    end

    it "encrypts Asterix & Obelix with a shift of -2" do
      expect(@cesar.cesar("Asterix & Obelix", -2)).to eq("Yqrcpgv & Mzcjgv")
    end

    it "encrypts Abcdef with a shift of -4" do
      expect(@cesar.cesar("Abcdef end", -4)).to eq("Wxyzab ajz")
    end
    
    it "encrypts XYZ with a shift of 4" do
      expect(@cesar.cesar("XYZ", 4)).to eq("BCD")
    end

    it "encrypts Asterix & Obelix with a shift of -52" do
      expect(@cesar.cesar("Asterix & Obelix", -52)).to eq("Asterix & Obelix")
    end

  end
 
end
