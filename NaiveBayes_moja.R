library(e1071)
library(tm)
library(wordcloud)

podatki <- read.csv("C:/Users/andreask/Desktop/French.csv",sep ="#" ,header = FALSE)

traindata <- as.data.frame(podatki[1:4,c(1,2)])
testdata <- as.data.frame(podatki[5:10,c(1,2)])


trainvector <- as.vector(traindata$V2)
testvector <- as.vector(testdata$V2)

is.vector(trainvector)
is.vector(testvector)

trainsource <- VectorSource(trainvector)
testsource <- VectorSource(testvector)

traincorpus <- Corpus(trainsource)
testcorpus <- Corpus(testsource)

trainmatrix <- t(TermDocumentMatrix(traincorpus))
testmatrix <- t(TermDocumentMatrix(testcorpus))

model <- naiveBayes(as.matrix(trainmatrix),as.factor(traindata$V1))
results <- predict(model, as.matrix(testmatrix))
results <- as.matrix(results)
results


