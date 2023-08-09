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

    # Process irishtest_vars files
    var_path = f'irishtest_vars_{n}.txt'
    try:
        with open(var_path, 'r') as var_file:
            var_lines = var_file.readlines()
            variables = {}
            for line in var_lines[:13]:
                parts = line.strip().split('=')
                if len(parts) == 2:
                    variable_name = parts[0].strip('[]')  # Remove [] from variable name
                    variable_value = float(parts[1].rstrip(';'))
                    variables[variable_name] = variable_value
            data[-1]["variables"] = variables
    except FileNotFoundError:
        print(f"Variables file {var_path} not found.")

with open('all_data.json', 'w') as json_file:
    json.dump(data, json_file, indent=2)

print("JSON summary created as all_data.json.")
