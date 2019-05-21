
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer")# color palettes
install.packages('readr')

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("readr")

#Load the data as a corpus
matchinfo = read_csv("C:/Users/alienware/Desktop/658project/matchinfo_1.csv")
champ <- Corpus(VectorSource(matchinfo$champs))

#Build a term-document matrix
dtm <- TermDocumentMatrix(champ, control = list(tolower = FALSE))
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

#Generate the Word cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
         random.order=FALSE, random.color = TRUE, rot.per=0.35, 
          colors=brewer.pal(6, "Dark2"))

names(v)

