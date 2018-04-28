#Local File Location - Chage as per needed
setwd("C:/Users/Varsha/Desktop/MSIM/Capstone/Pakistan (Sindh)_MICS5_Datasets/Pakistan (Sindh) MICS 2014 SPSS Datasets")

#Required libraries for this file
library(haven)
library(data.table)
library(dplyr)

#Read the SAV files into R
ch.data <- read_spss("ch.sav")
View(ch.data)
hh.data <- read_spss("hh.sav")
View(hh.data)
wm.data <- read_spss("hh.sav")
View(wm.data)

#Print all the SAV files as CSV
write.csv(wm.data, file = "wm_pak.csv",row.names=FALSE, na="")
write.csv(ch.data, file = "ch_pak.csv",row.names=FALSE, na="")
write.csv(ch.data, file = "hh_pak.csv",row.names=FALSE, na="")

#Function to get all the labels of columns in a list - making the lookup list
makelist <- function(givendata) { 
  labels <- sapply(givendata, function(x) attr(x, "label"))
  tibble(name = names(labels),
         label = labels)
}

#Make Label List for all the files
dataset.labels1 <- makelist(ch.data)
dataset.labels2 <- makelist(wm.data)
dataset.labels3 <- makelist(hh.data)

#Merge all the files and print the combined label list as a csv file
merged1 <- rbind(dataset.labels1,dataset.labels2)
merged_final <- rbind(merged1, dataset.labels3)
write.csv(merged_final, file = "label_pak.csv",row.names=FALSE, na="")

setwd("C:/Users/Varsha/Desktop/MSIM/Capstone/Nigeria 2011 MICS_Datasets/Nigeria_MICS4_Datasets/Nigeria MICS 2011 SPSS Datasets")
#Read the SAV files into R
ch.data <- read_spss("ch.sav")
View(ch.data)
hh.data <- read_spss("hh.sav")
View(hh.data)
wm.data <- read_spss("hh.sav")
View(wm.data)

#Make Label List for all the files
dataset.labels1 <- makelist(ch.data)
dataset.labels2 <- makelist(wm.data)
dataset.labels3 <- makelist(hh.data)

#Merge all the files and print the combined label list as a csv file
merged1 <- rbind(dataset.labels1,dataset.labels2)
merged_final <- rbind(merged1, dataset.labels3)
write.csv(merged_final, file = "label_nig.csv",row.names=FALSE, na="")
