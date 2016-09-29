def substrings(str, dict)
	hash_count = {}
	str = str.downcase()
	str_array = str.split(/\W/)
	str_array.each do |word|
		dict.each do |substr|
			if word.include?(substr)
				#instantiates and/or adds 1 to substr key's value
				hash_count[substr] = hash_count[substr].to_i + 1
			end
		end
	end
	return hash_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)