社會經濟因素與收入資料集 Codebook

資料集簡介

本資料集記錄了個人的社會經濟特徵與收入情況，包括性別、婚姻狀態、年齡、教育程度、職業類別、收入金額及子女人數等。
適合用於探討不同社會背景因素對收入水平的影響，例如分析婚姻狀態、教育程度是否影響個人收入。

資料規格：

筆數：數千筆

檔案格式：CSV

資料型態：結構化數值與文字資料

變數說明:

| 變數名稱         | 資料型別     | 說明與範例 |
|:-----------------|:-------------|:-----------|
| id               | Integer      | 個人編號，例如 `100000001` |
| gender           | Integer      | 性別：`0` = 男性，`1` = 女性 |
| marital_status   | String       | 婚姻狀態，例如 `single`（單身）、`non-single`（非單身，含離婚/分居/已婚/喪偶） |
| age              | Integer      | 年齡，例如 `67` |
| education        | String       | 教育程度，例如 `high school`（高中）、`university`（大學）、`other / unknown`（其他或未知） |
| income           | Integer      | 年收入金額（單位未明，推測為當地貨幣），例如 `124670` |
| occupation       | String       | 職業類別，例如 `skilled employee / official`（技術員/公務員）、`unemployed / unskilled`（失業/低技術）、`management / self-employed / highly qualified employee / officer`（管理職/自營業/高級專業） |
| num_children     | Integer      | 子女人數，例如 `2` |
| sample_id        | Integer      | 樣本流水號，例如 `2`、`3`，純粹供資料處理識別使用 |