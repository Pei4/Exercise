library(ggplot2)
#單變-類別
ggplot(iris, aes(x=Species, fill=Species))+
  geom_bar()
#單變-連續
ggplot(iris, aes(x=Sepal.Length, fill=Species))+
  geom_histogram()+
  facet_wrap(~Species)
#雙變-連續&連續
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+
  geom_point()
#雙變-離散&連續
ggplot(iris, aes(x=Species, y=Sepal.Length, fill=Species))+
  geom_boxplot()
