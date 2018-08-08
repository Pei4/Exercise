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