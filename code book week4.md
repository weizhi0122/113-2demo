# Codebook for Export Data

## Dataset Description

This dataset contains information on Taiwan's export amounts to various markets for different industries. Each row represents a specific industry and market combination for a given reference year. The dataset includes variables that capture the export amount, rankings, growth rates, and market shares.

## Variable Description

| Variable Name               | Class   | Description                                            |
|-----------------------------|---------|--------------------------------------------------------|
| 資料基準年度                | Integer | Reference year of the data (ROC calendar)              |
| 產業別                      | String  | Industry category                                      |
| 市場                        | String  | Export market/country                                  |
| 臺灣對該市場出口額USD千美元 | Integer | Taiwan's export value to the market in USD (thousands) |
| 臺灣對該市場出口額排名      | Integer | Rank of export value among all markets                 |
| 市場成長率%                 | Numeric | Growth rate of the market (%)                          |
| 市場占比%                   | Numeric | Market share percentage (%)                            |

The dataset allows for analysis of Taiwan’s export trends, market performance, and industry-specific insights.
