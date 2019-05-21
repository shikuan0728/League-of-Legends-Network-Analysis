library("readr")
library("igraph")

rm(list = ls())


champswin <- read_csv("C:/Users/alienware/Desktop/658project/matrix_as_60_60.csv")
g <- graph.data.frame(champswin,directed=FALSE)
plot(g)
