module Enumerable
	def my_each
		len = self.length
		for i in 0...len
			yield(self[i])
		end
		self
	end

	def my_each_with_index
		len = self.length
		for i in 0...len
			yield(self[i],i)
		end
		self
	end

	def my_select
		select_arr = []
		self.my_each do |elem|
			if yield(elem)
				select_arr.push(elem)
			end
		end
		select_arr
	end

	def my_all?
		my_all = true
		self.my_each do |elem|
			unless yield(elem)
				my_all = false
				break
			end
		end
		my_all
	end

	def my_any?
		my_any = false
		self.my_each do |elem|
			if yield(elem)
				my_any = true
				break
			end
		end
		my_any
	end

	def my_none?
		my_none = true
		self.my_each do |elem|
			if yield(elem)
				my_none = false
				break
			end
		end
		my_none
	end

	def my_count
		count = 0
		self.my_each do |elem|
			if yield(elem)
				count += 1
			end
		end
		count
	end

	def my_map(&map_proc)
		if map_proc == nil
			map_proc = yield
		end
		map_arr = []
		self.my_each_with_index do |elem, i|
			map_arr.push(map_proc.call(elem))
		end
		map_arr
	end

	def my_inject(start = self[0])
		total = start
		self.my_each_with_index do |elem, i|
			unless i == 0 && total == self[0]
				total = yield(total, elem)
			end
		end
		total
	end



end