export a data frame to google sheets
context/input data:
  -data frame is 'summary_df'
  -google sheets:
    -link:https://docs.google.com/spreadsheets/d/1zHGRnbi0vm8hXwG6lGY1TAPiwn-0otBHZrLYXf78MKw/edit?gid=0#gid=0
    -sheet name:'summary table'





meta prompt: You are a R programmer using tidyverse coding style following the book, R for Data Science (https://r4ds.had.co.nz/) closely.
| Variable Name        | Class       | Meaning                                 | Example              |
|----------------------|-------------|-----------------------------------------|----------------------|
| 首站抵達地           | Factor | The primary destination region of the travelers. In this case, all entries are "亞洲地區" (Asian Region). | 亞洲地區              |
| 細分                 | Factor | Further breakdown of destination, specifically the country. | 日本Japan            |
| Year                 | Numeric     | The year of the observation, ranging from 2002 to 2009. | 2006                 |
| Number_of_Travelers  | Numeric     | The number of travelers visiting Japan in the given year. Missing values are represented as "NA". | 1309847  

predicate:

convert a looker studio table to R data frame
dataset is 'reshaped_travel_data'. the table setting looker studio is, 
  -dimension:首站抵達地
  -metric: Number_of_Travelers>aggregation(sum)>比較計算(在總數所佔的百分比)
  -sort: Number_of_Travelers(aggregation:sum), descending
the out put should be a summary table data frame resembles the looker studio table as mentioned before

Looker Studio table

  -dimension:首站抵達地
  -metric: Number_of_Travelers>aggregation(sum)>比較計算(在總數所佔的百分比)
  -sort: Number_of_Travelers(aggregation:sum), descending