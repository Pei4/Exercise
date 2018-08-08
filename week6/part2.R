animate <- readRDS('animate.rds')
library(ggplot2)
library(scales)

#種類Q3圖
lineQ3 <- data.frame()
for(i in c(2008:2018)){
anime_20xx <- animate %>% filter(Year == i)
Cate2 <- unique(anime_20xx$Category)
for (j in Cate2){
anime_xx <- anime_20xx %>% filter(Category == j)
summ =summary(anime_xx$Popularity)
anime_xx <- as.vector(summ[5])
Temp <- data.frame(Year=i, Category=j, Q3=anime_xx)
lineQ3 <- rbind(Temp, lineQ3)}
}

lineQ3$Year<- sapply(lineQ3$Year, as.numeric)
Q3plot <- ggplot(lineQ3, aes(Year, Q3, color= Category))+
  geom_jitter()+
  geom_line()+
  scale_y_log10()
Q3plot

#特色Q3圖
FeatureQ3 <- data.frame()
completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}
splitTitle <- function(x){
    strsplit(x, split='[、]')[[1]]
  }
FeatureList <- completeFun(animate, "Feature")
FeatureList = sapply(as.character(FeatureList), splitTitle)
Feat2 <- unique(unlist(FeatureList))
for(i in c(2008:2018)){
  anime_20xx <- animate %>% filter(Year == i)
  for (j in Feat2){
    anime_xx <- anime_20xx %>% filter(Feature %in% j)
    summ =summary(anime_xx$Popularity)
    anime_xx <- as.vector(summ[5])
    Temp2 <- data.frame(Year=i, Feature=j, Q3=anime_xx)
    FeatureQ3 <- rbind(Temp2, FeatureQ3)}
}

FeatureQ3$Year<- sapply(FeatureQ3$Year, as.numeric)
FeatureQ3plot <- ggplot(FeatureQ3, aes(Year, Q3, color= Feature))+
  geom_jitter()+
  geom_line()
FeatureQ3plot
