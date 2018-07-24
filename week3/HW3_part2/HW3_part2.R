library(bitops)
library(httr)
library(RCurl)
library(tm)
library(NLP)
library(tmcn)
library(jiebaRD)
library(jiebaR)

#input data
d.corpus <- Corpus( DirSource("./DATA") )
d.corpus <- tm_map(d.corpus, removePunctuation)
d.corpus <- tm_map(d.corpus, removeNumbers)
d.corpus <- tm_map(d.corpus, function(word) {
  gsub("[A-Za-z0-9]", "", word)
})

#記得轉置

#TDM
mixseg = worker()
jieba_tokenizer = function(d)
{
  unlist( segment(d[[1]], mixseg) )
}
seg = lapply(d.corpus, jieba_tokenizer)

count_token = function(d)
{
  as.data.frame(table(d))
}
tokens = lapply(seg, count_token)

n = length(seg)
TDM = tokens[[1]]
colNames <- names(seg)
colNames <- gsub(".txt", "", colNames)
for( id in c(2:n) )
{
  TDM = merge(TDM, tokens[[id]], by="d", all = TRUE)
  names(TDM) = c('d', colNames[1:id])
}
TDM[is.na(TDM)] <- 0
library(knitr)
kable(head(TDM))
kable(tail(TDM))

#TF-IDF


#PCA
library(devtools)
install_github("ggbiplot", "vqv")
library(scales)
library(grid)
library(ggbiplot)

data(iris)
ir.pca <- prcomp(iris[,1:4])
ir.species <- iris[, 5]

g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, 
              groups = ir.species, ellipse = TRUE, 
              circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)

scatter <- ggplot(data=iris, aes(x = Petal.Length, y = Sepal.Width)) 
scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

#Kmeans