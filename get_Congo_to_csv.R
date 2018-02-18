setwd("C:/Users/sneha/Documents/GitHub/Unicef/Congo data")
library(haven)
library(data.table)
ch.data <- read_spss("ch.sav")
View(ch.data)

write.csv(ch.data, file = "ch.csv",row.names=FALSE, na="")
