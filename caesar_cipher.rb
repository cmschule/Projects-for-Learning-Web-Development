def caesar_cipher(str, num)
	str = str.split('')
	encrypt = ''
	lowcase = ('a'..'z').to_a
	uppercase = ('A'..'Z').to_a
	str.each do |letter|
		if lowcase.include?(letter)
			i = lowcase.find_index(letter)
			encrypt += lowcase[i+num-26]

		elsif uppercase.include?(letter)
			i = uppercase.find_index(letter)
			encrypt += uppercase[i+num-26]
		else
			encrypt += letter
		end
	end
	return encrypt
end
puts caesar_cipher("What a string!", 5)