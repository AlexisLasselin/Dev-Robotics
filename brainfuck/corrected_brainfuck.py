def brainfuck(program):
    # Initialize the variables
    instruction_pointer = 0
    loop_stack = []
    memory = [0]
    memory_pointer = 0

    # Loop until the end of the code
    while instruction_pointer < len(program):
        # Get the instruction
        instr = program[instruction_pointer]
        instruction_pointer += 1

        # Find the instruction correspondance
        match instr:
            # Increment the memory (and overflow)
            case '+':
                memory[memory_pointer] = (memory[memory_pointer]+1) % 256

            # Decrement the memory (and underflow)
            case '-':
                memory[memory_pointer] = (memory[memory_pointer]-1) % 256

            # Move the memory pointer to the left
            case '<':
                memory_pointer -= 1
                # If we are out of bounds, add more space
                while memory_pointer < 0:
                    memory.insert(0, 0)
                    memory_pointer += 1

            # Move the memory pointer to the right
            case '>':
                memory_pointer += 1
                # If we are out of bounds, add more space
                while memory_pointer >= len(memory):
                    memory.append(0)

            # Read an input
            case ',':
                c = input()[0]
                memory[memory_pointer] = ord(c)

            # Write a character
            case '.':
                c = chr(memory[memory_pointer])
                print(c, end='') # `end=''` allows to keep writting on the same line

            # Start a loop
            case '[':
                # If the memory is not 0, enter the loop
                if memory[memory_pointer] != 0:
                    # Keep track of where we entered the loop to come back there again
                    # -1 because we already moved the pointer
                    loop_stack.append(instruction_pointer-1)
                    continue  # We're done here, keep going

                # Keep track of how many inner loops we skipped
                count = 0
                while count >= 0:  # Stop once we skipped all of them
                    # Read the next instruction
                    instr = program[instruction_pointer]
                    instruction_pointer += 1
                    if instr == '[':
                        count += 1
                    elif instr == ']':
                        count -= 1
                # We reached the destination

            # End a loop
            case ']':
                # Go back to the start
                instruction_pointer = loop_stack.pop()

            # Unkown instruction
            case _:
                pass  # Ignore

program = "+[,>++++++++[-<---->]<.]"

brainfuck(program)