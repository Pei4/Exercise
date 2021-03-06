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
    1. Vector:可容納元素的集合  
    2. Matrix:可將資料分門別類的矩陣  
    3. Factor:用作分類的因子  
    4. Data frame:R語言專屬的資訊框架  
    5. List:將資料各自列表  
  + [Datacamp]Intermediate R
    1. 邏輯與運算符號  
    2. 功能式:巡迴反覆的loop、設定功能的function、前提假設的for  
    3. 簡化資料:純列式的lapply、整理成表的sapply、可設定格式的vapply  
    4. 補充:grepl()、grep()捕捉資訊；sub()、gsub()取代資訊；as.Date()、as.time()指定日期時間  
  + [Datacamp]Introduction to the Tidyverse  
    1. 整理Dataset(選取行的filter、選取列的arrange、再計算的mutate、匯總選取資料的summarize)  
    2. ggplot圖像化(aes設定縱橫軸、geom_設定圖表類型、scale_x/y_log10設定縱橫軸幅度、size和color設定大小色彩、拆分圖表的facet_wrap、expand_limits設定縱橫軸起始點)  

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
    1. 目的:將半結構化/非結構資料經過統計演算，以取得其中必要的資訊  
    2. 程序:標記同/多/反義詞等的詞庫處理、移除後綴的字根還原、過濾篩選單詞並藉由TF-IDF(Term Frequency-Inverse Document Frequence)分析使用頻率   
    3. TF:該單詞在特定文件中出現的次數/該文件總單詞數  
    4. IDF:log(總文件數)-log(該單詞有出現的文件數)  
    5. TF-IDF權重:TF*IDF  
    6. 應用:開放式調查分析(藉客戶填寫的問卷進行客戶分群、客製化等服務)、自動化處理(對訊息、電子郵件快速分類與篩選)、分析合約內容(找出合約如保固、保險與診斷面談等所需細節)、
   調查競爭對手(結合網路爬蟲探勘對手的商業智慧)  
  + TF-IDF in R Language  
    1. x=單詞, y=文章, N=總文章數, tf=單詞在文章中出現的頻率, df=有單詞的文章數   
    2. ![公式](https://pei4.github.io/cs-x-programming/week2/TFIDF.JPG)
    3. Library:tm, tmcn, rJava, Rwordseg, SnowballC, slam     
  + [Datacamp]Exploration data analysis  
>### Week 3  
* Progress  
  + EDA 概述:反覆資料探索→製造合理的合成欄位→資料視覺化以顯出資料重點  
  + 示範使用Kaggle Script製作EDA報告  
  + 介紹PCA和Kmeans概念，並示範做出TFIDF->PCA->Kmeans  
* Homework  
  + [EDA報告](https://pei4.github.io/cs-x-programming/week3/HW3_part1/HW3_part1)
  + [世足法國vs阿根廷文字探勘](https://pei4.github.io/cs-x-programming/week3/HW3_part2/HW3_part0)
  + [世足法國vs阿根廷TFIDF -> PCA -> K-means](https://pei4.github.io/cs-x-programming/week3/HW3_part2/HW3_part2)
* After Class  
### Week 4  
* Progress  
  + 問題定義TEF:Task(提問), Experience(變數), Performance(衡量)  
  + 統計工具:敘述統計、機率分布、假設檢定與迴歸分析  
* Homework  
  + [EDA分析報告](https://pei4.github.io/cs-x-programming/week4/HW4_part1)  
* AfterClass  
  + ​[video]利用R語言進行ANOVA​  
  + ​[E-book]A Handbook of Statistical Analyses Using R​  
  + t Test | Educational Research Basics by Del Siegle​
  + ​淺談p值(p-value)​​  
### Week5  
* Progress  
  + 演講:敏捷開發  
  + Shiny導論  
* Homework  
  + [Shiny test](https://pei4.shinyapps.io/HW5shiny/)  
* AfterClass  
  + 期末專案內容大綱討論  
  + 爬蟲撰寫協助  
  + 資料(人氣統計)視覺化  
### Week6
* Progress
  + 衝刺期末專案
  + 專案Demo
* Homework  
  + [專案PPT](https://drive.google.com/file/d/10PS03M5A2FszLJna8Lb9TwEcez2zIH6a/view)  
  + 專案APP → View week6 document
