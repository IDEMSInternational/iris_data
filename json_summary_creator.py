import json

data = []

# Loop through text files
for n in range(400):
    # Process irishtest_data files
    data_path = f'irishtest_data_{n}.txt'
    try:
        with open(data_path, 'r') as data_file:
            data_lines = data_file.readlines()
            header = data_lines[0].strip().split()  # Extract header
            data_content = [list(map(float, line.strip().split())) for line in data_lines[1:]]
            data.append({
                "n": n,
                "header": header,  # Include header information
                "data": data_content
            })
    except FileNotFoundError:
        print(f"Data file {data_path} not found.")

with open('simplified_data.json', 'w') as json_file:
    json.dump(data, json_file, indent=2)

print("Simplified JSON data created as simplified_data.json.")
