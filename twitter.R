#install.packages("twitteR")

library("twitteR")
library("wordcloud")
library("tm")
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr )
library(twitteR)
library(stringr)


#necessary file for Windows
#download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

consumer_key <- 'rBSyPsnsGCxu71b2WBOjaDK18'
consumer_secret <- 'BhBxJsgriVEDnbWpO2SO9WuhBgSZdRqrO7PvK6jKHao9RH9P0s'
access_token <- '3sX9ujRsXkwb5Qc5KiTu8pwY5mSPFjPfTJgKaLgSg'
access_secret <- 'eJSYZynymhGQ7DVBpqay9Yj3eYD6tnldQhH2RKddTQkXR'

setup_twitter_oauth(consumer_key,consumer_secret,access_token=NULL,access_secret=NULL)
tweets <- userTimeline("Timberlake", n = 100)
nDocs <- length(tweets)

##convert tweets to data frame
df <- do.call("rbind", lapply(tweets, as.data.frame))
dim(df)

myCorpus <- Corpus(VectorSource(df$text))
myCorpus <- tm_map(myCorpus, removePunctuation)
myCorpus <- tm_map(myCorpus, content_transformer(tolower))
myCorpus <- tm_map(myCorpus, removeWords, stopwords("english")) #removes common prepositions and conjunctions 
myCorpus <- tm_map(myCorpus, removeWords, c("example"))
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
myCorpus <- tm_map(myCorpus, removeURL)
myCorpus <- tm_map(myCorpus, stripWhitespace)
corpus_clean <- tm_map(myCorpus, PlainTextDocument)

myTdm <- TermDocumentMatrix(corpus_clean, control=list(wordLengths=c(1,Inf)))
myTdm

pal <- brewer.pal(9,"YlGnBu")
pal <- pal[-(1:4)]
set.seed(123)
wordcloud(words = corpus_clean, scale=c(4,0.5), max.words=50, random.order=FALSE, 
          rot.per=0.35, use.r.layout=TRUE, colors=pal)

search = searchTwitter('Weather storm',n=20)
search1 <- do.call('rbind', lapply(search, as.data.frame))
search1

write.csv(search1, file = 'tweets.csv')
tweets <- read.csv("./tweets.csv", stringsAsFactors = FALSE)
mySentiment <- get_nrc_sentiment(tweets$text)

tweets <- cbind(tweets, mySentiment)
