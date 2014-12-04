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



