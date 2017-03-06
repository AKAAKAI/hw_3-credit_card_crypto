module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i).reverse!
    # TODO: use the integers in nums_a to validate its last check digit
    total_num = 0
    nums_a.length.times do |x| 
    	if x.even? 
    		
    		total_num += nums_a[x]
    	else 

    		if (nums_a[x]*2) >= 10
				tem = (nums_a[x]*2).to_s.chars.map(&:to_i) 
    			tem.length.times { |q| total_num += tem[q] }
    		else
    			total_num += nums_a[x]*2 
    		end
    	end
    end

    return total_num % 10 == 0 ? true : false
  end
end
