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


# Load necessary libraries
library(tidyverse)

# Assuming the data is stored in a dataframe called reshaped_travel_data
# Example data for reshaped_travel_data:
# reshaped_travel_data <- read.csv("your_data.csv")

# Aggregate the Number_of_Travelers by 首站抵達地
summary_data <- reshaped_travel_data %>%
  group_by(首站抵達地) %>%
  summarise(total_travelers = sum(Number_of_Travelers, na.rm = TRUE)) %>%
  mutate(percentage = total_travelers / sum(total_travelers) * 100) %>%
  arrange(desc(total_travelers))

# Plot the bar chart resembling the Looker Studio graph
ggplot(summary_data, aes(x = reorder(首站抵達地, total_travelers), y = percentage, fill = 首站抵達地)) +
  geom_bar(stat = "identity") +
  coord_flip() +  # Flip coordinates for a horizontal bar chart
  labs(title = "Percentage of Total Travelers by Region",
       x = "Destination Region (首站抵達地)",
       y = "Percentage of Total Travelers",
       fill = "Region") +
  theme_minimal()

# Step 3: Sort the data in descending order based on 'Total_Travelers'
aggregated_data <- aggregated_data %>%
  arrange(desc(Percentage))

library(googlesheets4)
gs4_auth()
# 定義 Google Sheets 的 URL 和工作表名稱
sheet_url <- "https://docs.google.com/spreadsheets/d/1zHGRnbi0vm8hXwG6lGY1TAPiwn-0otBHZrLYXf78MKw/edit?gid=0#gid=0"
sheet_name <- "summary table"
sheet_write(summary_df, ss = sheet_url, sheet = sheet_name)
sheet_write(reshaped_travel_data, ss = sheet_url, sheet = "reshaped data")
