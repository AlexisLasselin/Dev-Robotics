selectArray = {69, 42, 8, 666, 1, 1000, 1997}

-- Selection sort
for i = 1, #selectArray do
	min = i
	for j = i, #selectArray do
		if selectArray[j] < selectArray[min] then
			min = j
		end
	end
	selectArray[i], selectArray[min] = selectArray[min], selectArray[i]
end

print("Selection sort:", table.concat(selectArray, ", "))

-- Insertion sort
insertArray = {69, 42, 8, 666, 1, 1000, 1997, 28398}

for i = 2, #insertArray do
	for j = i, 2, -1 do
		if insertArray[j] < insertArray[j - 1] then
			insertArray[j], insertArray[j - 1] = insertArray[j - 1], insertArray[j]
		end
	end
end

print("Insertion sort:", table.concat(insertArray, ", "))

-- Bogo sort
bogoArray = {69, 42, 8, 666, 1, 1000, 1997, 28398, 67789297}

function isSorted(bogoArray)
	for i = 2, #bogoArray do
		if bogoArray[i] < bogoArray[i - 1] then
			return false
		end
	end
	return true
end

function shuffle(bogoArray)
	for i = 1, #bogoArray do
		local j = math.random(1, #bogoArray)
		bogoArray[i], bogoArray[j] = bogoArray[j], bogoArray[i]
	end
end

while not isSorted(bogoArray) do
	shuffle(bogoArray)
end

print("Bogo sort:", table.concat(bogoArray, ", "))