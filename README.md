# 106學年度夏季學院【資料科學程式設計】  
大家好，我是政治大學會計系二年級的蔡沛姍。  
興趣是打排球和數位媒體創作，希望能藉由這堂課對程式語言有更多認識和學習。  
>### Week 1  
* Progress  
  + 建立Github概念與製作  
  + R語言基本語法學習與應用  
  + 建立R Markdown的html並匯入ReadMe
* Homework  
  + [R Markdown](https://pei4.github.io/cs-x-programming/week1/HW1)
* After Class  
  + [Datacamp]Introduction to R:介紹R的元素  
    ⋅⋅1⋅ Vector:可容納元素的集合  
    ⋅⋅2⋅ Matrix:可將資料分門別類的矩陣  
    ⋅⋅3⋅ Factor:用作分類的因子  
    ⋅⋅4⋅ Data frame:R語言專屬的資訊框架  
    ⋅⋅5⋅ List:將資料各自列表  
  + [Datacamp]Intermediate R
     ⋅⋅* 邏輯與運算符號  
     ⋅⋅* 功能式:巡迴反覆的loop、設定功能的function、前提假設的for  
     ⋅⋅* 簡化資料:純列式的lapply、整理成表的sapply、可設定格式的vapply  
     ⋅⋅* 補充:grepl()、grep()捕捉資訊；sub()、gsub()取代資訊；as.Date()、as.time()指定日期時間  
  + [Datacamp]Introduction to the Tidyverse  
     ⋅⋅* 整理Dataset(選取行的filter、選取列的arrange、再計算的mutate、匯總選取資料的summarize)  
     ⋅⋅* ggplot圖像化(aes設定縱橫軸、geom_設定圖表類型、scale_x/y_log10設定縱橫軸幅度、size和color設定大小色彩、拆分圖表的facet_wrap、expand_limits設定縱橫軸起始點)  

>### Week 2  
* Progress  
  + 練習分辨和製作ggplot  
  + 介紹網路爬蟲、嘗試製作WordCloud  
* Homework  
  + [Plot Practice](https://pei4.github.io/cs-x-programming/week2/HW2_part1)  
  + [WordCloud](https://pei4.github.io/cs-x-programming/week2/HW2_part2)  
* After Class  
  + [ggmap and public dataset](https://pei4.github.io/cs-x-programming/week2/ggmap/ggmap_with_public_dataset.html)  
  + Text Mining前處理  
     ⋅⋅* 目的:將半結構化/非結構資料經過統計演算，以取得其中必要的資訊  
     ⋅⋅* 程序:標記同/多/反義詞等的詞庫處理、移除後綴的字根還原、過濾篩選單詞並藉由TF-IDF(Term Frequency-Inverse Document Frequence)分析使用頻率   
     ⋅⋅* TF:該單詞在特定文件中出現的次數/該文件總單詞數  
     ⋅⋅* IDF:log(總文件數)-log(該單詞有出現的文件數)  
     ⋅⋅* TF-IDF權重:TF*IDF  
     ⋅⋅* 應用:開放式調查分析(藉客戶填寫的問卷進行客戶分群、客製化等服務)、自動化處理(對訊息、電子郵件快速分類與篩選)、分析合約內容(找出合約如保固、保險與診斷面談等所需細節)、
   調查競爭對手(結合網路爬蟲探勘對手的商業智慧)  
  + TF-IDF in R Language  
     ⋅⋅* Library:tm, tmcn, rJava, Rwordseg, SnowballC, slam  
     ⋅⋅*     
  + [Datacamp]Exploration data analysis  




