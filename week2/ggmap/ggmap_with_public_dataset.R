library(ggmap)
library(mapproj)
map <- get_map(location='Taipei', zoom=13, language = "zh-TW")
ggmap(map)

data <- read.csv(file="TPhydrant.csv")
data
