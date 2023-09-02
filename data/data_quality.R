library(assertr)


# Gereinigter Datensatz laden ---------------------------------------------
erasmus <- read_csv("data/clean/erasmus_cleaned.csv")


# Daten einsehen ----------------------------------------------------------
glimpse(erasmus)
view(erasmus)


# Data Quality Checks ausführen -------------------------------------------
erasmus |> 
  verify(has_only_names("id", "mobility_start_month",
                        "mobility_end_month", "mobility_duration",
                        "gender", "gender_transformed", 
                        "age", "sending_city")) |>
  assert(in_set("Female", "Male"), gender_transformed) |>
  assert(within_bounds(10, 25), age) |> 
  assert(is_uniq, id) |> 
  assert(in_set("Wien", inverse = TRUE), sending_city)


