import pandas as pd

file_location = 'C:/Users/jlomb/Documents/Personal Coding/blueLabs/inventory_manager/inventory.csv'


#QAQC 
shirt_stock = pd.read_csv(file_location)

def style_check(shirt_data: pd.DataFrame, check_col: str) -> str:

    default_pass = 'Style ID is valid!'
    default_failure = 'Style ID is not valid!'
    if (check_col not in shirt_data.columns) or (shirt_data[check_col].dtype) != 'int64':

        return default_failure

    return default_pass

def column_count_check(shirt_data: pd.DataFrame, check_col: str, style_value: int) -> str:

    count_of_style = shirt_data[shirt_data[check_col] == style_value]

    if len(count_of_style) == 0:
        check_output = f'There are no units of Style {style_value} currently in stock'
    else: 
        style_count = len(count_of_style)
        check_output = f'There are {style_count}'

    return check_output

#Summaries of the data