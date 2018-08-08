animate <- readRDS('animate.rds')
library(ggplot2)
library(scales)

#種類produce圖
ProduceCate <- data.frame()
for(i in c(2008:2018)){
  anime_20xx <- animate %>% filter(Year == i)
  Cate2 <- unique(anime_20xx$Category)
  for (j in Cate2){
    anime_xx <- anime_20xx %>% filter(Category == j)
    nrow <- nrow(anime_xx)
    Temp <- data.frame(Year=i, Category=j, Count=nrow)
    ProduceCate <- rbind(Temp, ProduceCate)}
}

ProduceCate$Year<- sapply(ProduceCate$Year, as.numeric)
ProduceCate <- ggplot(ProduceCate, aes(Year, Count, color= Category))+
  geom_jitter()+
  geom_line()
ProduceCate