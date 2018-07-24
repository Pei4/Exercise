library(bitops)
library(httr)
library(XML)
library(RCurl)
library(tm)
library(NLP)
library(tmcn)
library(jiebaRD)
library(jiebaR)
library(dplyr)
library(tm)
library(knitr)
library(ggplot2)
library(factoextra)

#爬蟲世足4強開始的世足板
#https://www.ptt.cc/bbs/WorldCup/index1293.html
from <- 1328 # 2018-07-11
to   <- 1385 # 2018-07-18
prefix = "https://www.ptt.cc/bbs/WorldCup/index"

data <- list()
for( id in c(from:to) )
{
  url  <- paste0( prefix, as.character(id), ".html" )
  html <- htmlParse( GET(url) )
  url.list <- xpathSApply( html, "//div[@class='title']/a[@href]", xmlAttrs )
  data <- rbind( data, as.matrix(paste('https://www.ptt.cc', url.list, sep='')) )
}
data <- unlist(data)

head(data)

#依照小時
getdoc <- function(url)
{
  html <- htmlParse( getURL(url) )
  doc  <- xpathSApply( html, "//div[@id='main-content']", xmlValue )
  time <- xpathSApply( html, "//*[@id='main-content']/div[4]/span[2]", xmlValue )
  temp <- gsub( "  ", " 0", unlist(time) )
  part <- strsplit( temp, split=" ", fixed=T )
  #date <- paste(part[[1]][2], part[[1]][3], part[[1]][5], sep="-")
  #date <- paste(part[[1]][2], part[[1]][5], sep="_")
  #date <- paste(part[[1]][1], part[[1]][2], sep="_")
  timestamp <- part[[1]][4]
  timestamp <- strsplit( timestamp, split=":", fixed=T )
  hour <- timestamp[[1]][1]
  #print(hour)
  name <- paste0('./DATA/', hour, ".txt")
  write(doc, name, append = TRUE)
}

sapply(data, getdoc)

#建立文本資料結構與基本文字清洗
d.corpus <- Corpus(DirSource("DATA") )
d.corpus <- tm_map(d.corpus, removePunctuation)
d.corpus <- tm_map(d.corpus, removeNumbers)
d.corpus <- tm_map(d.corpus, function(word) {
  gsub("[A-Za-z0-9]", "", word)
})

#斷詞
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

kable(head(TDM))
kable(tail(TDM))

#TF-IDF
tf <- apply(as.matrix(TDM[,2:(n+1)]), 2, sum)

library(Matrix)
idfCal <- function(word_doc)
{ 
  log2( n / nnzero(word_doc) ) 
}
idf <- apply(as.matrix(TDM[,2:(n+1)]), 1, idfCal)

doc.tfidf <- TDM
# for(x in 1:nrow(TDM))
# {
#   for(y in 2:ncol(TDM))
#   {
#     doc.tfidf[x,y] <- (doc.tfidf[x,y] / tf[y]) * idf[x]
#   }
# }

tempY = matrix(rep(c(as.matrix(tf)), each = length(idf)), nrow = length(idf))
tempX = matrix(rep(c(as.matrix(idf)), each = length(tf)), ncol = length(tf), byrow = TRUE)
doc.tfidf[,2:(n+1)] <- (doc.tfidf[,2:(n+1)] / tempY) * tempX

stopLine = rowSums(doc.tfidf[,2:(n+1)])
delID = which(stopLine == 0)

kable(head(doc.tfidf[delID,1]))

kable(tail(doc.tfidf[delID,1]))

TDM = TDM[-delID,]
doc.tfidf = doc.tfidf[-delID,]

#取得的重要關鍵字
TopWords = data.frame()
for( id in c(1:n) )
{
  dayMax = order(doc.tfidf[,id+1], decreasing = TRUE)
  showResult = t(as.data.frame(doc.tfidf[dayMax[1:5],1]))
  TopWords = rbind(TopWords, showResult)
}
rownames(TopWords) = colnames(doc.tfidf)[2:(n+1)]
TopWords = droplevels(TopWords)
kable(TopWords)

#重要關鍵字 TDM merge 視覺化
TDM$d = as.character(TDM$d)
AllTop = as.data.frame( table(as.matrix(TopWords)) )
AllTop = AllTop[order(AllTop$Freq, decreasing = TRUE),]

kable(head(AllTop))

TopNo = 5
tempGraph = data.frame()
for( t in c(1:TopNo) )
{
  word = matrix( rep(c(as.matrix(AllTop$Var1[t])), each = n), nrow = n )
  temp = cbind( colnames(doc.tfidf)[2:(n+1)], t(TDM[which(TDM$d == AllTop$Var1[t]), 2:(n+1)]), word )
  colnames(temp) = c("hour", "freq", "words")
  tempGraph = rbind(tempGraph, temp)
  names(tempGraph) = c("hour", "freq", "words")
}

library(varhandle)
tempGraph$freq = unfactor(tempGraph$freq)
ggplot(tempGraph, aes(hour, freq)) + 
  geom_point(aes(color = words, shape = words), size = 5) +
  geom_line(aes(group = words, linetype = words))

kable(tail(AllTop))

#發文時間與發文量
filenames = as.array(paste0("./DATA/",colnames(doc.tfidf)[2:(n+1)],".txt"))
sizeResult = apply(filenames, 1, file.size) / 1024
showSize = data.frame(colnames(doc.tfidf)[2:(n+1)], sizeResult)
names(showSize) = c("hour", "size_KB")

ggplot(showSize, aes(x = hour, y = size_KB)) + geom_bar(stat="identity")

#PCA
#TF-IDF
docs.corpus <- Corpus(DirSource("DATA"))
docs.seg <- tm_map(docs.corpus, segmentCN)
docs.tdm <- TermDocumentMatrix(docs.seg)
docs.tf <- apply(as.matrix(docs.tdm), 2, function(word) { word/sum(word) })
idf <- function(doc) {
  return ( log2( length(doc)+1 / nnzero(doc)) )
}
docs.idf <- apply(as.matrix(docs.tdm), 1, idf)
docs.tfidf <- docs.tf * docs.idf

#PCA
docs.pca <- prcomp(docs.tfidf, scale = T)
