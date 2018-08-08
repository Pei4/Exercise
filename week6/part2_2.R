animate <- readRDS('animate.rds')
library(ggplot2)
library(scales)

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
FeatureList$Feature = sapply(as.character(FeatureList$Feature), splitTitle)
Feat2 <- unique(unlist(FeatureList$Feature))
for(i in c(2008:2018)){
  anime_20xx <- animate %>% filter(Year == i)
  anime_20xx <- completeFun(anime_20xx, "Feature")
  feature_vector <- vector()
  popularity_vector <- vector()
  Year_vector <- vector()
  for (j in c(1:nrow(anime_20xx))){
    temp <- strsplit(anime_20xx[j,3],split = "[、]")[[1]]
    for(k in c(1:length(temp))){
      temp2 <- anime_20xx[j,4]
      temp3 <- anime_20xx[j,7]
      feature_vector <- append(feature_vector,temp[k])
      popularity_vector <- append(popularity_vector, temp2)
      Year_vector <- append(Year_vector, temp3)
      }
    }
    featureCount <- data.frame(Feature=feature_vector, Popularity=popularity_vector, Year=Year_vector)
    for(l in Feat2){
      anime_xx <- featureCount %>% filter(Feature == l)
      summ =summary(anime_xx$Popularity)
      anime_xx <- as.vector(summ[5])
      Temp2 <- data.frame(Year=i, Feature=l, Q3=anime_xx)
      FeatureQ3 <- rbind(Temp2, FeatureQ3)
     }
}

FeatureQ3$Year<- sapply(FeatureQ3$Year, as.numeric)
FeatureQ3plot <- ggplot(FeatureQ3, aes(Year, Q3, color= Feature))+
  geom_jitter()+
  geom_line()+
  scale_y_log10()
FeatureQ3plot
