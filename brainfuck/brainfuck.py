def brainfuck(program: str):
	# Run the code
	memory = [0] * 11
	pointer = 0

	for c in program:
		match c:
			case '+': # Increment the memory cell under the pointer
				if memory[pointer] == 255:
					memory[pointer] = 0
				memory[pointer] += 1
			case '-': # Decrement the memory cell under the pointer
				if memory[pointer] == 0:
					memory[pointer] = 255
				memory[pointer] -= 1
			case '>': # Increment the pointer
				pointer += 1
			case '<': # Decrement the pointer
				pointer -= 1
			case '.': # Output the character signified by the cell at the pointer
				print(chr(memory[pointer]))
			case ',': # Input a character and store it in the cell at the pointer
				memory[pointer] = ord(input("Enter a character: "))
			case '[': # Jump past the matching ] if the cell under the pointer is 0
				if memory[pointer] == 0:
					pass
				else:
					pass
			case ']': # Jump back to the matching [ if the cell under the pointer is nonzero
				pass


program = "+[,>++++++++[-<---->]<.]"

brainfuck(program)