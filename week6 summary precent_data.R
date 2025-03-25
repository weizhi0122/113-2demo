summary_df <- reshaped_travel_data %>%
  group_by(首站抵達地) %>%
  summarise(
    Total_Travelers = sum(Number_of_Travelers, na.rm = TRUE)
  ) %>%
  mutate(
    Percent_of_Total = Total_Travelers / sum(Total_Travelers) * 100
  ) %>%
  arrange(desc(Total_Travelers)) # Sort by the total number of travelers, descending

# View the result
summary_df
