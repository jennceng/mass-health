-- WRITE YOUR QUERIES HERE
-- What 3 towns have the highest population of citizens that are 65 years and older?
SELECT town_health_records.name AS town, town_health_records.age_65_plus_2005
FROM town_health_records
WHERE town_health_records.name != 'Massachusetts Total'
ORDER BY town_health_records.age_65_plus_2005 DESC
LIMIT 3;

-- What 3 towns have the highest population of citizens that are 19 years and younger?
SELECT town_health_records.name AS town, town_health_records.age_0_to_19_2005
FROM town_health_records
WHERE town_health_records.name != 'Massachusetts Total'
ORDER BY town_health_records.age_0_to_19_2005 DESC
LIMIT 3;

-- What 5 towns have the lowest per capita income?
SELECT town_health_records.name AS town, town_health_records.per_capita_income_2000
FROM town_health_records
WHERE town_health_records.name != 'Massachusetts Total'
ORDER BY town_health_records.per_capita_income_2000
LIMIT 5;

-- Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
SELECT town_health_records.name AS town, town_health_records.p_teen_births AS percent_teen_births
FROM town_health_records
WHERE town_health_records.name != 'Massachusetts Total'
AND town_health_records.name != 'Boston'
AND town_health_records.name != 'Becket'
AND town_health_records.name != 'Beverly'
ORDER BY town_health_records.p_teen_births DESC
LIMIT 1;

-- Omitting Boston, what town has the highest number of infant mortalities?
SELECT town_health_records.name AS town, town_health_records.infant_mortality_per_thousand
FROM town_health_records
WHERE town_health_records.name != 'Massachusetts Total'
AND town_health_records.name != 'Boston'
ORDER BY town_health_records.infant_mortality_per_thousand DESC
LIMIT 1;
