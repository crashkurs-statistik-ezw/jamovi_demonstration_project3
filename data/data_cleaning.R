library(tidyverse)
library(assertr)

raw_data <- read_csv("data/raw/erasmus_2014-2015.csv")

raw_data_cleaned <- raw_data |> 
  rename(
    id = `...1`,
    gender = participant_gender,
    age = participant_age
  ) |> 
  select(
    id, mobility_start_month, mobility_end_month,
    mobility_duration, gender, age, sending_city
  ) |> 
  dplyr::filter(
    gender != "Undefined",
    age >= 10 & age <= 25,
    sending_city != "Wien") 

write_csv(raw_data_cleaned, "data/clean/erasmus_cleaned_r.csv")