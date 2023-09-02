library(assertr)


# Gereinigter Datensatz laden ---------------------------------------------
erasmus <- read_csv("data/clean/erasmus_cleaned.csv")


# Daten einsehen ----------------------------------------------------------
glimpse(erasmus)
view(erasmus)


# Data Quality Checks ausführen -------------------------------------------
erasmus |> 
  verify(has_only_names("id", "")) |>
  verify(SuS >= 0) |> 
  assert(in_set("1", "2", "3", "4", "GST"), Klasse) |> 
  assert(in_set("GS", "SBBZ"), Schultyp) |> 
  assert(in_set("oe", "p"), ST) |> 
  assert(in_set(schulen_abk_alle), Schule) |>
  verify(has_class("Jahr", class = "integer"))

