def stock_picker(arr)

	max_sell = arr.max
	min_price = arr.min
	if arr.index(max_sell) > arr.index(min_price)
		return [arr.index(min_price), arr.index(max_sell)]
	end

	len = arr.length
	max = 0
	buy_index = 0
	#loop through array, check difference between current index value and all subsequent values in array
	while buy_index <= len-2
		sell_index = buy_index+1
		while sell_index <= len-1
			diff = arr[sell_index]-arr[buy_index]
			#max positive difference between sell_index and buy_index is best stock pick
			if diff > max
				max = diff
				stock_pick = [buy_index, sell_index]
			end
			sell_index += 1
		end
		buy_index += 1
	end
	return stock_pick
end

puts stock_picker([17,3,6,9,15,8,6,1,10])