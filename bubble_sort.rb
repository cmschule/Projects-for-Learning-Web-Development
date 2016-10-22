def bubble_sort(arr)
	arr_len = arr.length
	arr_sorted = arr
	while arr_len > 1
		for i in 0..arr_len-2
			if arr_sorted[i] > arr_sorted[i+1]
				temp = arr_sorted[i+1]
				arr_sorted[i+1] = arr_sorted[i]
				arr_sorted[i] = temp
			end
		end
		arr_len -= 1
	end
	return arr_sorted
end