module Enumerable

	def my_each
		raise SyntaxError unless block_given?
		array = self.to_a # makes the current default object an array
		i = 0 # iterator assignment
		p array # print inspection of array
		while i < self.length do #loop through array
			yield(array[i]) # yield to a block per iteration of the item
			i += 1 # 
		end
	end

	def my_each_with_index
		raise SyntaxError unless block_given?
		a = (0...self.length).to_a.zip(self)
		a.my_each { |i,x| yield(i,x) }
	end

	def my_select
		raise SyntaxError unless block_given?
		new_array = []
		self.my_each { |x| new_array << x if yield(x) }
		new_array
	end

	def my_all?
		raise SyntaxError unless block_given?
		isAll = true
		self.my_each { |x| isAll &&= yield(x) }
		isAll
	end

	def my_any?
		raise SyntaxError unless block_given?
		isAny = false
		self.my_each { |x| isAny ||= yield(x) }
		isAny
	end

	def my_none?
		raise SyntaxError unless block_given?
		isNone = false
		self.my_each { |x| isNone ||= yield(x) }
		isNone == false #instead of returning, just compare from default
	end

	def my_count
		count = 0
		if block_given?
			self.my_each { |x| count += 1 if yield(x) }
		else
			self.my_each { |x| count += 1 }
		end
		count
	end

	def my_map(array = nil)
		new_array = []
		if array.is_a? Proc
			self.my_each { |x| new_array << array.call(x) }
		else
			raise SyntaxError unless block_given?
			self.my_each { |x| new_array << yield(x) }
		end
		new_array
	end

	def my_inject(init = 0)
		raise SyntaxError unless block_given?
		a = init
		self.my_each { |x| a = yield(a, x) }
		a
	end

	test_array = [1, 2, 5, 7, 4]
	puts "Test Array: #{test_array}"

	puts "my_each test(puts each item): " 
		+ "#{test_array.my_each { |x| puts "#{x}" }}"

	puts "my_each_with_index test(print each with index): " 
		+ "#{test_array.my_each_with_index { |x, i| print "#{i}: #{x}" }}"

	puts "my_select test(return greater than 3 items): " 
		+ "#{test_array.my_select { |x| x > 3 }}"

	puts "my_all? test(should be false): " 
		+ "#{test_array.my_all? { |x| x > 3 }}"

	puts "my_any? test(should be false): " 
		+ "#{test_array.my_any? { |x| x > 3 }}"

	puts "my_none? test(should be true): " 
		+ "#{test_array.my_none? { |x| x == 3 }}"

	puts "my_count test(should be false): " 
		+ "#{test_array.my_count { |x| x > 3 }}"

	puts "my_map test(should be false): " 
		+ "#{test_array.my_map { |x| x > 3 }}"

	puts "my_inject test(should be false): " 
		+ "#{test_array.my_inject { |x, i| x + i }}"
end