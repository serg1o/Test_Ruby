class Cesar
  
  def cesar(text, shift)
    result = ""
    number_of_letters = "z".ord - "a".ord + 1
    shift %= number_of_letters #make shift a number between 0 and 25
    if (shift < 0)
      shift += number_of_letters
    end
    text.split("").each do |letter|
      if letter.match /[A-Za-z]/
        upcase = letter.upcase == letter ? true : false
        letter.upcase!
        if (((letter.ord + shift) > "Z".ord) && (letter <= "Z"))
          new_letter = ("A".ord + shift - ("Z".ord - letter.ord) -1).chr
        else
          new_letter = (letter.ord + shift).chr
        end
        upcase ? result << new_letter : result << new_letter.downcase
      else
        result << letter 
      end
    end
    result
  end

end
