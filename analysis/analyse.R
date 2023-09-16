library(tidyverse)

data <- read_csv("data/clean/erasmus_cleaned_r.csv")


# Deskriptive Statistik ---------------------------------------------------
jmv::descriptives(
  data = data,
  vars = age,
  n = FALSE,
  missing = FALSE,
  median = FALSE,
  sd = FALSE,
  min = FALSE,
  max = FALSE)


# ChatGPT Prompts ---------------------------------------------------------
# Du bist mein ggplot2 Tutor. Ich gebe dir gleich die Rohdaten meiner CSV-Datei 
# und möchte, dass du mir für bestimmte Diagramme Code für ggplot2 
# Datenvisualisierungen erzeugst. Wenn ich /start schreibe, gebe ich die 
# Instruktion welche Art von Datenvisualisierung mit welchen Variablen erzeugt 
# werden soll. Der Datensatz hat immer den Namen `data`. Hast du alles verstanden?


# Histogram ---------------------------------------------------------------
jmv::descriptives(
  data = data,
  vars = age,
  hist = TRUE,
  n = FALSE,
  missing = FALSE,
  mean = FALSE,
  median = FALSE,
  sd = FALSE,
  min = FALSE,
  max = FALSE)

ggplot(data, aes(x = age)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Histogramm des Alters",
       x = "Alter",
       y = "Anzahl") +
  theme_minimal()


# Balkendiagram -----------------------------------------------------------
jmv::descriptives(
  data = data,
  vars = mobility_duration,
  bar = TRUE,
  n = FALSE,
  missing = FALSE,
  mean = FALSE,
  median = FALSE,
  sd = FALSE,
  min = FALSE,
  max = FALSE)

ggplot(data, aes(x = factor(mobility_duration))) +
  geom_bar(fill = "blue", color = "black") +
  labs(title = "Balkendiagramm der Mobility Duration",
       x = "Mobility Duration",
       y = "Anzahl") +
  theme_minimal()



# Boxplot -----------------------------------------------------------------
jmv::descriptives(
  formula = age ~ mobility_duration,
  data = data,
  box = TRUE,
  n = FALSE,
  missing = FALSE,
  mean = FALSE,
  median = FALSE,
  sd = FALSE,
  min = FALSE,
  max = FALSE)

ggplot(data, aes(x = factor(mobility_duration), y = age)) +
  geom_boxplot(fill = "#666666", color = "black") +
  labs(title = "Boxplot von Mobility Duration nach Alter",
       x = "Mobility Duration",
       y = "Alter") +
  tukey_theme_with_axes()



# Themes ------------------------------------------------------------------
tukey_theme_with_axes <- function() {
  theme_minimal() +
    theme(
      text = element_text(size = 14),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      legend.title = element_text(size = 14),
      legend.text = element_text(size = 12),
      plot.title = element_text(size = 16, hjust = 0.5),
      panel.grid = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),
      axis.line = element_line(color = "black"),  # Achsenlinien hinzufügen
      axis.ticks = element_line(color = "black"),  # Achsenticks hinzufügen
      axis.text.x = element_text(margin = margin(t = 10)),  # Achsentexte unten
      axis.text.y = element_text(margin = margin(r = 10))  # Achsentexte rechts
    )
}

