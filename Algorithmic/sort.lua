array = {69, 42, 8, 666, 1, 1000, 1997}

-- Selection sort
for i = 1, #array do
	min = i
	for j = i, #array do
		if array[j] < array[min] then
			min = j
		end
	end
	array[i], array[min] = array[min], array[i]
end

print("Selection sort:", table.concat(array, ", "))

-- Insertion sort
for i = 2, #array do
	for j = i, 2, -1 do
		if array[j] < array[j - 1] then
			array[j], array[j - 1] = array[j - 1], array[j]
		end
	end
end

print("Insertion sort:", table.concat(array, ", "))