library(XML)
library(RCurl)
library(stringr)

#PRIDOBI SLIKE IZ URLA-a
url <- "http://en.wikipedia.org/wiki/Niccol%C3%B2_Machiavelli"

xpath <- "//img[contains(@src, '')]/@src"

slikice <- getHTMLExternalFiles(url, xpQuery = xpath)


#Preberi tabele
tabele <- names(readHTMLTable(url))
tabele
tabela <- readHTMLTable(url)$persondata
tabela


####################################################################

jaccard

podatki <- read.table("jaccard.txt")



test <- vegdist(podatki, method = "jaccard", binary = T)




test
hc <- hclust(test)



hc
plot(hc, hang = -1)










