SELECT
  month,
  day,
  t.timestamp,
  latitude,
  longitude,
  wind_direction_true,
  wind_speed,
  visibility,
  present_weather past_weather,
  sea_level_pressure,
  air_temperature,
  wetbulb_temperature,
  dewpoint_temperature,
  total_cloud_amount,
  sea_surface_temp
FROM
  bigquery-public-data.noaa_icoads.icoads_core_2015 AS t
WHERE
  sea_surface_temp IS NOT NULL
ORDER BY
  month,
  day,
  t.timestamp