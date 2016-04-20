
VERSION = 1


class Fixnum
  
 
  def to_roman

    out_string = ''
    remainder = self

    #Tackle the Ms
    if remainder > 1000 then
      thousands = remainder / 1000    
      remainder = remainder - ( thousands * 1000 )
      thousands.times{ out_string = "M" + out_string }
    end

    #Check for  'CM'
    if remainder > 899 then 
      remainder -= 900
      out_string += "CM"
    end

    #Deal with the 'D' 500+
    if remainder > 500 then
      extra_cs = (remainder - 500) / 100
      out_string += "D"
      extra_cs.times do
        out_string += "C"
        remainder -= 100
      end
      remainder -= 500
    end

    #The CD
    if remainder > 399 then
      remainder -= 400
      out_string += "CD"
    end

    #The C
    if remainder > 99 then
      hundreds = remainder / 100
      remainder = remainder - (hundreds * 100)
      hundreds.times { out_string = out_string + 'C'} 
    end

    #The XC
    if remainder > 89 then
      out_string = out_string + 'XC'
      remainder -= 90
    end

    #The L
    if remainder > 49 then
      out_string += "L"
      extra_Xs = (remainder - 50) / 10
      extra_Xs.times { out_string += "X" ; remainder -= 10 }
      remainder -= 50
    end

    #The XL
    if remainder > 39 then
      out_string += "XL"
      remainder -= 40
    end

    #The Xs
    if remainder > 9 then
      tens = remainder / 10
      remainder = remainder - (tens * 10)
      tens.times { out_string += "X" }
    end

    #The IX
    if remainder > 8 then
      out_string += "IX"
      remainder -= 9
    end

    #The Vs
    if remainder > 4 then
      out_string += "V"
      remainder -= 5
    end

    #The IV
    if remainder > 3 then
      out_string += "IV"
      remainder -= 4
    end

    remainder.times { out_string += "I"}

    out_string
    
  end
  
end
