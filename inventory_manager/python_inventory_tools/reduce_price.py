from cmath import nan
from datetime import datetime
import pandas as pd


def bad_wholesale(shirt_data: pd.DataFrame, 
                    percent_threshold = 0.6, group_vars = ['color','style_fit'],
                    sold_date_col = 'sold_date') -> list:

    sixty_day_value = 20220325 #TODO: genarlize based on data instead

    delinquent_count = shirt_data.groupby(group_vars).agg(NotSoldCount = ('sold_date','is.nan')).reset_index()

    delinquent_match_perc = delinquent_count[delinquent_count['NotSoldCount'] < (1-percent_threshold),]

    return delinquent_match_perc

def reduce_wholesale(shirt_data: pd.DataFrame, delinquent_data: pd.DataFrame, reduce_amount = 0.2):

    ##TODO: generalize the unique id combination to not be hardcoded

    shirt_data['UniqueID'] = shirt_data['Color'] + shirt_data['style_fit']
    delinquent_data['UniqueID'] = delinquent_data['Color'] + delinquent_data['style_fit']

    shirt_data[shirt_data['UniqueID']]

    pass