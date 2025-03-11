Below is an example codebook in Markdown syntax for your CSV dataset.

------------------------------------------------------------------------

# Codebook

## Dataset Description

This dataset contains travel information for arrivals in Asia, with a focus on Japan. Each record represents travel data for a specific year, including details about the region of initial arrival, a more detailed categorization of the destination (presented in both local and English forms), and the number of travelers recorded. Note that some records have missing data for the number of travelers (denoted as "NA").

## Variables

| Variable Name       | Data Type       | Description                                                                                                                             |
|------------|------------|------------------------------------------------|
| 首站抵達地          | String          | Indicates the first arrival region. In this dataset, it consistently shows "亞洲地區" (Asia region).                                    |
| 細分                | String          | Provides a detailed categorization of the destination, combining local and English names (e.g., "日本Japan").                           |
| Year                | Integer         | The year when the travel data was recorded.                                                                                             |
| Number_of_Travelers | Integer (or NA) | The number of travelers for the given year. Missing values ("NA") indicate that data was not available or not recorded for those years. |

------------------------------------------------------------------------
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
