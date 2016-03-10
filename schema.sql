-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE IF EXISTS town_health_records;

CREATE TABLE town_health_records(
  id SERIAL PRIMARY KEY,
  name VARCHAR(225) UNIQUE,
  total_pop_2005 INTEGER,
  age_0_to_19_2005 INTEGER,
  age_65_plus_2005 INTEGER,
  per_capita_income_2000 VARCHAR(100),
  persons_below_200p_poverty_2000 INTEGER,
  p_below_200p_poverty_2000 REAL,
  p_adequacy_prenatal_care REAL,
  pc_section_deliveries REAL,
  number_of_infant_deaths REAL,
  infant_mortality_per_thousand REAL,
  low_birthweight_2005_2008 REAL,
  multiple_births REAL,
  publicly_financed_prenatal_care REAL,
  p_teen_births real
);
