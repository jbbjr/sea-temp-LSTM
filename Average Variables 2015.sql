SELECT
  month,
  day,
  t.timestamp,
  AVG(sea_surface_temp) AS avg_sea_surface_temp,
  AVG(wind_direction_true) AS avg_wind_direction_true,
  AVG(wind_speed) AS avg_wind_speed,
  AVG(visibility) AS avg_visibility,
  --AVG(present_weather past_weather) AS avg_sea_surface_temp,
  AVG(sea_level_pressure) AS avg_sea_level_pressure,
  AVG(air_temperature) AS avg_air_temperature,
  AVG(wetbulb_temperature) AS avg_wetbulb_temperature,
  AVG(dewpoint_temperature) AS avg_dewpoint_temperature,
  AVG(total_cloud_amount) AS avg_total_cloud_amount
FROM
  `bigquery-public-data.noaa_icoads.icoads_core_2015` AS t
WHERE
  sea_surface_temp IS NOT NULL
GROUP BY
  month,
  day,
  t.timestamp
ORDER BY
  month,
  day,
  t.timestamp