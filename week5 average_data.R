library(tidyverse)

# Summarize the data by grouping and calculating the average number of travelers
summary_number_average_data <- reshaped_travel_data %>%
  group_by(首站抵達地, Year) %>%
  summarize(Average_Travelers = mean(Number_of_Travelers, na.rm = TRUE))

# View the result
print(summary_number_average_data)
