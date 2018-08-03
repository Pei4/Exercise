library(xml2)
library(tmcn)
library(rvest)
Data <- data.frame(title=0, catagory=0, date=0, population=0, rata=0, feature=0)

for(j in c(1:196)){
  URL <- paste0("https://acg.gamer.com.tw/index.php?page=", j, "&p=ANIME&t=1&tnum=4816")
  for(i in c(1:15)){
    html = read_html(URL, encoding="BIG5")
    titlepath = paste0('//*[@id="BH-master"]/div[1]/div[',i,']/div[2]/h1/a[1]')
    featurepath = paste0('//*[@id="BH-master"]/div[1]/div[',i,']/div[2]/ul[2]/li')
    catapath = paste0('//*[@id="BH-master"]/div[1]/div[',i,']/div[2]/ul[1]/li[1]')
    poppath = paste0('//*[@id="BH-master"]/div[1]/div[',i,']/div[1]/p[2]/span')
    ratepath = paste0('//*[@id="BH-master"]/div[1]/div[',i,']/div[1]/p[1]/span')
    titletarget = xml_find_all(html, titlepath)
    featuretarget = xml_find_all(html, featurepath)
    catatarget = xml_find_all(html, catapath)
    poptarget = xml_find_all(html, poppath)
    ratetarget = xml_find_all(html, ratepath)
    title = xml_text(titletarget)
    feature = xml_text(featuretarget)
    catagory = xml_text(catatarget)
    population = xml_text(poptarget)
    rate = xml_text(ratetarget)
    rownum <- 15*(j-1)+i
    splitTitle <- function(x){
      strsplit(x, split='[/]')[[1]]
      }
    splitTitle2 <- function(x){
      strsplit(x, split='[¡G]')[[1]]
    }
    Temp = sapply(as.character(catagory), splitTitle)
    Temp2 = sapply(as.character(feature), splitTitle2)
    Data[rownum,1] <- title
    Data[rownum,2] <- Temp[1,]
    Data[rownum,3] <- Temp[2,]
    Data[rownum,4] <- population
    Data[rownum,5] <- rate
    Data[rownum,6] <- Temp2[2,]
    }
}

saveRDS(Data, "Data.rds")
