require 'csv'
require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "mass_health")
    yield(connection)
  ensure
    connection.close
  end
end


db_connection do |conn|
  CSV.foreach('mass-chip-data.csv', headers: true, header_converters: :symbol) do |row|
    hash = row.to_h
    query = "INSERT INTO town_health_records (
    name,
    total_pop_2005,
    age_0_to_19_2005,
    age_65_plus_2005,
    per_capita_income_2000,
    persons_below_200p_poverty_2000,
    p_below_200p_poverty_2000,
    p_adequacy_prenatal_care,
    pc_section_deliveries,
    number_of_infant_deaths,
    infant_mortality_per_thousand,
    low_birthweight_2005_2008,
    multiple_births,
    publicly_financed_prenatal_care,
    p_teen_births
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)"
    #  binding.pry
    data =[
      hash[:geography],
     hash[:total_pop_year_2005].gsub(",","").to_i,
     hash[:age_019_year_2005].gsub(",","").to_i,
     hash[:age_65_year_2005].gsub(",","").to_i,
     hash[:per_capita_income_year_2000],
     hash[:persons_living_below_200_poverty_year_2000].gsub(",","").to_i,
     hash[:_all_persons_living_below_200_poverty_level_year_2000].to_f,
     hash[:_adequacy_prenatal_care_kotelchuck].to_f,
     hash[:_csection_deliveries_20052008].to_f,
     hash[:number_of_infant_deaths_20052008].to_f,
     hash[:infant_mortality_rate_deaths_per_1000_live_births_20052008].to_f,
     hash[:_low_birthweight_20052008].to_f,
     hash[:_multiple_births_20052008].to_f,
     hash[:_publicly_financed_prenatal_care_20052008].to_f,
     hash[:_teen_births_20052008].to_f
    ]
    conn.exec_params(query, data)
  end
end
