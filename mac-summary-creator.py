# Number of files
num_files = 400

# Iterate through each file
for n in range(1, num_files):
    input_filename = f"irishtest_vars_{n}.txt"
    output_filename = f"maxima-summaries-files/irishtest_vars_{n}.mac"

    with open(input_filename, "r") as file:
        # Read the first 13 lines
        file_lines = [next(file).strip() for _ in range(13)]

        # Modify the lines as needed
        modified_lines = [line.replace('[', '').replace(']=', ':') for line in file_lines]

    # Write the modified lines to the corresponding output file
    with open(output_filename, "w") as output_file:
        output_file.write("\n".join(modified_lines))

print("Files have been processed and saved in the 'maxima-summaries-files' folder with the .mac extension.")