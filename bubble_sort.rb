def bubble_sort array
	n = array.length
	loop do
		swapped = false

		(n-1).times do |i|
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end
		end

		break if not swapped
	end
	array
end

def bubble_sort_by array
	n = array.length
	loop do
		swapped = false

		(n-1).times do |i|
			# yields to the block on both (array[i], array[i+1]) specified by |left, right|
			if yield(array[i], array[i+1]) > 0 
				array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end
		end

		break if not swapped
	end
	array
end

unsorted_array = [4,3,78,2,0,2] #Should be [0,2,2,3,4,78]
puts "bubble_sort(): #{bubble_sort(unsorted_array)}"
puts "bubble_sort_by(): " + bubble_sort_by(unsorted_array) do |left, right|
  left.length - right.length
end


