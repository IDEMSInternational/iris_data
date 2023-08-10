# Number of files
num_files = 400

# Initialize lists for each variable
mean_sl_values = []
size_values = []
var_sl_values = []
mean_sl_se_values = []
mean_sl_vi_values = []
mean_sl_ve_values = []
var_sl_se_values = []
var_sl_vi_values = []
var_sl_ve_values = []
length_se_values = []
length_vi_values = []
length_ve_values = []
df_ws_values = []

# Iterate through each file
for n in range(num_files):
    file_name = f"irishtest_vars_{n}.txt"
    with open(file_name, "r") as file:
        # Read the first 13 lines
        file_lines = [next(file).strip() for _ in range(13)]

        # Extract variable values using regular expression
        variable_values = [line.split('=')[1][:-1] for line in file_lines]

        # Convert the variable values to floats
        variable_values = [float(value) for value in variable_values]

        # Append values to their respective lists
        mean_sl_values.append(variable_values[0])
        size_values.append(variable_values[1])
        var_sl_values.append(variable_values[2])
        mean_sl_se_values.append(variable_values[3])
        mean_sl_vi_values.append(variable_values[4])
        mean_sl_ve_values.append(variable_values[5])
        var_sl_se_values.append(variable_values[6])
        var_sl_vi_values.append(variable_values[7])
        var_sl_ve_values.append(variable_values[8])
        length_se_values.append(variable_values[9])
        length_vi_values.append(variable_values[10])
        length_ve_values.append(variable_values[11])
        df_ws_values.append(variable_values[12])

# Store all lists in a dictionary for easier access
data_lists = {
    "MeanSL_list": mean_sl_values,
    "size_list": size_values,
    "VarSL_list": var_sl_values,
    "MeanSL_Se_list": mean_sl_se_values,
    "MeanSL_Vi_list": mean_sl_vi_values,
    "MeanSL_Ve_list": mean_sl_ve_values,
    "VarSL_Se_list": var_sl_se_values,
    "VarSL_Vi_list": var_sl_vi_values,
    "VarSL_Ve_list": var_sl_ve_values,
    "Length_Se_list": length_se_values,
    "Length_Vi_list": length_vi_values,
    "Length_Ve_list": length_ve_values,
    "DF_WS_list": df_ws_values
}

# Write the 13 lists into all_data.txt
with open("all_data_variables.txt", "w") as output_file:
    for variable, values in data_lists.items():
        formatted_data = f"{variable}: {values};"
        output_file.write(formatted_data + '\n')

print("Merged data written to all_data.txt")
