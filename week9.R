# import reshaped_travel_data
reshaped_travel_data <- 
  read_csv("reshaped_travel_data.csv")

#tidy data: remove some obervations
reshaped_travel_data <- reshaped_travel_data %>%
  filter(
    首站抵達地 != "全區",
    !str_detect(細分, "Total")
  )

# upload to gsheets
library(googlesheets4)
gslink <- "https://docs.google.com/spreadsheets/d/1PsEJb_hmO2Cfjgdbnw-4wpB2VTa-4lE42BkQhIg9QdA/edit?gid=0#gid=0"

write_sheet(
  reshaped_travel_data,
  ss=gslink,
  sheet="reshaped travel data"
)
