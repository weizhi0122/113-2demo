#import
library(googlesheets4)
reshaped_travel_data <- read_sheet("https://docs.google.com/spreadsheets/d/1tbwc7zuVcg3V72DzjFU8F19E7nZ_dsfjYP1ICiqcRcY/edit?gid=2027436314#gid=2027436314",
                                   sheet = "reshaped_travel_data")
#parsing
library(tidyverse)

# 假設你已經有 reshaped_travel_data，我們從資料清理開始
reshaped_travel_data <- reshaped_travel_data %>%
  # 確保變數名稱正確
  rename(
    region = `首站抵達地`,
    country = `細分`,
    year = Year,
    number_of_travelers = Number_of_Travelers
  ) %>%
  # 處理變數類型
  mutate(
    region = as.factor(region),
    country = as.factor(country),
    year = as.numeric(year),
    number_of_travelers = as.numeric(number_of_travelers)
  )

# single variable summary
summarise_variable <- function(x) {
  variable_class <- class(x)[1]
  
  if (variable_class %in% c("factor", "ordered")) {
    tibble(
      class = variable_class,
      levels = list(as.list(table(x))),  # Convert table to named list
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  } else if (variable_class %in% c("character")) {
    tibble(
      class = variable_class,
      unique_values = list(unique(na.omit(x))),
      n_unique = n_distinct(x, na.rm = TRUE),
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  } else if (variable_class %in% c("numeric", "integer")) {
    tibble(
      class = variable_class,
      mean = mean(x, na.rm = TRUE),
      median = median(x, na.rm = TRUE),
      sd = sd(x, na.rm = TRUE),
      min = min(x, na.rm = TRUE),
      max = max(x, na.rm = TRUE),
      range = max(x, na.rm = TRUE) - min(x, na.rm = TRUE),
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  } else {
    tibble(
      class = variable_class,
      note = "Unsupported class type",
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  }
}

# Apply to all columns
tidy_variable_summary <- reshaped_travel_data |>
  summarise(across(everything(), summarise_variable, .names = "summary_{.col}")) |>
  pivot_longer(everything(), names_to = "variable", values_to = "summary") |>
  unnest_wider(summary)

library(jsonlite)

# Save the summary to JSON file
write_json(
  x = list(
    description = "Summarises each variable in `reshaped_travel_data` based on their class, including missing values.",
    operations = "summarise(across()), class(), mean(), median(), sd(), min(), max(), table(), is.na(), n_distinct()",
    summary = tidy_variable_summary
  ),
  path = "variable-summary.json",
  pretty = TRUE,
  auto_unbox = TRUE
)
