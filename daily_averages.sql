WITH DailyAverages AS (
    SELECT 
        year, month, day, latitude, longitude,
        AVG(wind_direction_true) AS avg_wind_direction_true,
        AVG(wind_speed) AS avg_wind_speed,
        AVG(visibility) AS avg_visibility,
        AVG(present_weather) AS avg_present_weather,
        AVG(past_weather) AS avg_past_weather,
        AVG(sea_level_pressure) AS avg_sea_level_pressure,
        AVG(air_temperature) AS avg_air_temperature,
        AVG(wetbulb_temperature) AS avg_wetbulb_temperature,
        AVG(dewpoint_temperature) AS avg_dewpoint_temperature,
        AVG(total_cloud_amount) AS avg_total_cloud_amount,
        AVG(sea_surface_temp) AS avg_sea_surface_temp
    FROM 
        `bigquery-public-data.noaa_icoads.icoads_core_*`
    WHERE
        _TABLE_SUFFIX BETWEEN '2005' AND '2015'
    GROUP BY 
        year, month, day, latitude, longitude
)
SELECT 
    year, month, day, latitude, longitude,
    avg_wind_direction_true,
    avg_wind_speed,
    avg_visibility,
    avg_present_weather,
    avg_past_weather,
    avg_sea_level_pressure,
    avg_air_temperature,
    avg_wetbulb_temperature,
    avg_dewpoint_temperature,
    avg_total_cloud_amount,
    avg_sea_surface_temp
FROM 
    DailyAverages
WHERE
    avg_wind_direction_true IS NOT NULL
    AND avg_wind_speed IS NOT NULL
    AND avg_visibility IS NOT NULL
    AND avg_present_weather IS NOT NULL
    AND avg_past_weather IS NOT NULL
    AND avg_sea_level_pressure IS NOT NULL
    AND avg_air_temperature IS NOT NULL
    AND avg_wetbulb_temperature IS NOT NULL
    AND avg_dewpoint_temperature IS NOT NULL
    AND avg_total_cloud_amount IS NOT NULL
    AND avg_sea_surface_temp IS NOT NULL

ORDER BY year, month, day DESC