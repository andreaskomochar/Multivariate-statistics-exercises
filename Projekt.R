library(tm)
library(wordcloud)

sov_govor <- "C:/Users/andreask/Desktop/Podatki/govori/sovgovor" 
nesov_govor <- "C:/Users/andreask/Desktop/Podatki/govori/nesovgovor"

korpus_sov_govor <- Corpus(DirSource(sov_govor))
korpus_nesov_govor <- Corpus(DirSource(nesov_govor))
korpus <- c(korpus_nesov_govor,korpus_sov_govor)      #Celoten Korpus.

#Èišèenje korpusa
korpus_nesov_govor <- tm_map(korpus_nesov_govor, removePunctuation)
korpus_nesov_govor <- tm_map(korpus_nesov_govor, removeNumbers)
korpus_nesov_govor <- tm_map(korpus_nesov_govor, stripWhitespace)
#korpus_nesov_govor <- tm_map(korpus_nesov_govor, tolower)

korpus_sov_govor <- tm_map(korpus_sov_govor, removePunctuation)
korpus_sov_govor <- tm_map(korpus_sov_govor, removeNumbers)
korpus_sov_govor <- tm_map(korpus_sov_govor, stripWhitespace)
#korpus_sov_govor <- tm_map(korpus_sov_govor, tolower)


dtm_sov_govor <- DocumentTermMatrix(korpus_sov_govor)
dtm_nesov_govor <- DocumentTermMatrix(korpus_nesov_govor)

findFreqTerms(dtm_nesov_govor, 5)
a <- findFreqTerms(dtm_sov_govor, 5)


wordcloud(a, scale=c(3,0.5),rot.per=0.35, use.r.layout=FALSE)

test <- as.matrix(dtm_sov_govor)


