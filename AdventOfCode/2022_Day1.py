# Part 1:
#  Objective: Find the biggest sum of calories for an elf in the file

with open("2022_Day1_Input.txt") as f:
	lines = f.readlines()
    
	calories = [entry.strip() for entry in lines]

elf_sums = []
current_sum = 0
for entry in calories:
    if entry != '':
        current_sum += int(entry)
    elif entry == '':
        elf_sums.append(current_sum)
        current_sum = 0
elf_sums.append(current_sum)

print(max(elf_sums))

# Part 2:
# How many Calories are the top 3 Elves carrying in total?

elf_sums.sort(reverse=True)

print(elf_sums[0] + elf_sums[1] + elf_sums[2])