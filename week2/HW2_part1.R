library(ggplot2)
#單變-類別
ggplot(iris, aes(x=Species))+
  geom_bar(fill="lightgreen")
#雙變-類別&連續
ggplot(iris, aes(x=Sepal.Length, y=Species))+
  geom_point()
