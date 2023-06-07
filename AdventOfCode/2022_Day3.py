# Part 1:
# Find the sum of the priorities of those item types that appear in both halves of the rucksack.

with open('2022_Day3_Input.txt') as f:
	lines = f.readlines()
	rucksacks = [entry.strip() for entry in lines]

rucksack_sum = 0
for rucksack in rucksacks:
    first_half = set(rucksack[:len(rucksack)//2])
    second_half = set(rucksack[len(rucksack)//2:])
    overlap_char = (first_half.intersection(second_half)).pop()

    if overlap_char.isupper():
        rucksack_sum += ord(overlap_char) - ord('A') + 27
    else:
        rucksack_sum += ord(overlap_char) - ord('a') + 1
        
print(rucksack_sum)

# Part 2:
# Find the sum of the priorities of those item types.

rucksack_sum = 0
while len(rucksacks) > 0:
    first_rucksack = set(rucksacks.pop())
    second_rucksack = set(rucksacks.pop())
    third_rucksack = set(rucksacks.pop())
    overlap_char = ((first_rucksack.intersection(second_rucksack)).intersection(third_rucksack)).pop()

    if overlap_char.isupper():
        rucksack_sum += ord(overlap_char) - ord('A') + 27
    else:
        rucksack_sum += ord(overlap_char) - ord('a') + 1
        
print(rucksack_sum)