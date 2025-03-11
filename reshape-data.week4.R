library(tidyverse)

parsed_travel_data <- reshaped_travel_data %>%
  mutate(
    首站抵達地 = as.character(首站抵達地),         # Convert to character (String)
    細分 = as.character(細分),                       # Convert to character (String)
    Year = as.integer(Year),                        # Convert to integer
    Number_of_Travelers = as.integer(Number_of_Travelers)  # Convert to integer (NA remains NA)
  )
summary_travel_data <- parsed_travel_data %>%
  summarize(
    首站抵達地_levels = n_distinct(首站抵達地), # Count unique values
    細分_levels = n_distinct(細分),           # Count unique values
    Year_range = paste0(min(Year, na.rm = TRUE), " - ", max(Year, na.rm = TRUE)), # Range of years
    Number_of_Travelers_mean = mean(Number_of_Travelers, na.rm = TRUE), # Mean of travelers
    Number_of_Travelers_median = median(Number_of_Travelers, na.rm = TRUE), # Median of travelers
    Number_of_Travelers_min = min(Number_of_Travelers, na.rm = TRUE), # Minimum travelers
    Number_of_Travelers_max = max(Number_of_Travelers, na.rm = TRUE), # Maximum travelers
    Number_of_Travelers_NA_count = sum(is.na(Number_of_Travelers)) # Count missing values
  )

print(summary_travel_data)
