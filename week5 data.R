library(tidyverse)

# Ensure correct data types
reshaped_travel_data <- reshaped_travel_data %>%
  mutate(
    首站抵達地 = factor(首站抵達地),
    細分 = factor(細分),
    Year = as.numeric(Year),
    Number_of_Travelers = as.numeric(Number_of_Travelers) # Ensure missing values stay as NA
  )

# Check structure
glimpse(reshaped_travel_data)


library(tidyverse)

# Function to summarize individual variables
summarize_variable <- function(x) {
  if (is.numeric(x)) {
    return(list(
      Mean = mean(x, na.rm = TRUE),
      Median = median(x, na.rm = TRUE),
      SD = sd(x, na.rm = TRUE),
      Max = max(x, na.rm = TRUE),
      Min = min(x, na.rm = TRUE),
      Range = diff(range(x, na.rm = TRUE)),
      NA_Count = sum(is.na(x))
    ))
  } else if (is.factor(x) || is.ordered(x)) {
    return(list(
      Frequency_Table = table(x, useNA = "ifany"),
      NA_Count = sum(is.na(x))
    ))
  } else if (is.character(x)) {
    return(list(
      Unique_Values = unique(x),
      Count = length(unique(x)),
      NA_Count = sum(is.na(x))
    ))
  } else if (inherits(x, "Date")) {
    return(list(
      Min = min(x, na.rm = TRUE),
      Max = max(x, na.rm = TRUE),
      Range = as.numeric(difftime(max(x, na.rm = TRUE), min(x, na.rm = TRUE), units = "days")),
      NA_Count = sum(is.na(x))
    ))
  } else if (inherits(x, "POSIXct") || inherits(x, "POSIXt")) {
    return(list(
      Min = min(x, na.rm = TRUE),
      Max = max(x, na.rm = TRUE),
      Range = as.numeric(difftime(max(x, na.rm = TRUE), min(x, na.rm = TRUE), units = "days")),
      Time_Interval = diff(range(x, na.rm = TRUE)),
      NA_Count = sum(is.na(x))
    ))
  } else if (is.logical(x)) {
    return(list(
      Frequency_Table = table(x, useNA = "ifany"),
      NA_Count = sum(is.na(x))
    ))
  } else {
    return(list(Unknown_Type = "Variable type not recognized"))
  }
}

# Apply function to all variables
summary_list <- map(reshaped_travel_data, summarize_variable)

# View summary
summary_list
