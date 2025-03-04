library(readr)
raw_travel_data <- readr::read_csv("歷年中華民國國民出國目的地人數統計2002-2024.csv", show_col_types = FALSE)
raw_travel_data <- raw_travel_data |>
  dplyr::mutate(dplyr::across(-c('首站抵達地', '細分'), as.character))



tidy_travel_data <- raw_travel_data |>
  tidyr::pivot_longer(
    cols = -c('首站抵達地', '細分'),
    names_to = "year",
    values_to = "count"
  ) |>
  dplyr::mutate(
    year = as.integer(year), 
    count = readr::parse_number(count)
  )

