library(ggplot2)
#����-���O
ggplot(iris, aes(x=Species, fill=Species))+
  geom_bar()
#����-�s��
ggplot(iris, aes(x=Sepal.Length, fill=Species))+
  geom_histogram()+
  facet_wrap(~Species)
#����-�s��&�s��
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+
  geom_point()
#����-����&�s��
ggplot(iris, aes(x=Species, y=Sepal.Length, fill=Species))+
  geom_boxplot()