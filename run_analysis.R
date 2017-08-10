# load data (working dir: ".../UCI HAR Dataset")
#
test <- read.table("test/X_test.txt") # read test-data
testy <- read.table("test/Y_test.txt") # read test-data-y
subtest <- read.table("test/subject_test.txt") # read test-subjects

train <- read.table("train/X_train.txt") # read train-data
trainy <- read.table("train/Y_train.txt") # read train-data-y
subtrain <- read.table("train/subject_train.txt") # read train-subjects

lab <- read.table("features.txt") # read labels
lab <- as.character(lab[,2]) # no need for first col, chars for labels
lab <- gsub("-", " ", lab) #remove special chars
lab <- gsub("_", " ", lab) #remove special chars
lab <- gsub(",", " ", lab) #remove special chars
lab <- gsub("\\(", "", lab) #remove special chars
lab <- gsub("\\)", "", lab) #remove special chars
#
# merge subtest with testy and test, add colnames, and clean up
td1 <- cbind(subtest, testy)
td2 <- cbind(td1, test)
colnames(td2) <- c("subject", "activity", lab)
rm(list = c("subtest", "testy", "test", "td1")) # clean up
#
# merge subtrain with trainy and train, add colnames 
trd1 <- cbind(subtrain, trainy)
trd2 <- cbind(trd1, train)
colnames(trd2) <- c("subject", "activity", lab)
rm(list = c("subtrain", "trainy", "train", "trd1")) # clean up
#
# merge test and train data into one dataset & add activity names
data <- rbind(td2,trd2)
data$activity <- factor(data$activity, levels = c(1,2,3,4,5,6), labels = c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying"))
rm(list = c("td2", "trd2")) # clean up
# get only mean and std
c1 <- grep("*.[Mm]ean.*",lab) + 2 # cols with mean (add 2 because of two added vars)
c2 <- grep("*.[Ss]td.*",lab) + 2 # cols with mean (add 2 because of two added vars)
data2 <- data[,c(1,2,c1,c2)] # cols 1&2 and cols with mean & std
rm(list = c("c1", "c2", "data", "lab")) # clean up
#
# 2nd data set with the av. of each var. for each activity and each subject
library(dplyr)
data2 <- group_by(data2, subject, activity) # use dplyr to group data
means <- summarise_all(data2, mean) #summarise data using dplyr
write.table(means, file = "data.txt", row.names = FALSE) # save file (with col.names)
