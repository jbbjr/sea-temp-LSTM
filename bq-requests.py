import os
from google.cloud import bigquery
import pandas as pd
import time

# set credentials (json key file that gives access to BigQuery)
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r'key.json'
client = bigquery.Client()

# query tabularized data
request = client.query(
    """
    SELECT 
        year, month, day, hour, latitude, longitude, wind_direction_true, 
        wind_speed, visibility, present_weather, past_weather, sea_level_pressure, 
        air_temperature, wetbulb_temperature, dewpoint_temperature, total_cloud_amount,
        timestamp, sea_surface_temp
    FROM 
        `bigquery-public-data.noaa_icoads.icoads_core_*`
    WHERE
        _TABLE_SUFFIX BETWEEN '2005' AND '2015'
    """
)

print('Starting query...')

# keep track of query status
while not request.done():
    print(f"Job status: {request.state}")
    time.sleep(5)

print('Query complete.')

# fetch the results and save to csv
results = request.result()
df = results.to_dataframe()
print(df.head())
df.to_pickle('./sample.pkl')
print('done')