## Getting and cleaning data - course project
# Definition http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#install.packages("dplyr")
library(dplyr)

# Appropriately labels the data set with descriptive variable names. 
# Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="Person")
head(subjectTest)
# Test labels: 1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING,5 STANDING,6 LAYING
test_Y <- read.table("UCI HAR Dataset/test/Y_test.txt",col.names="Label")
head(test_Y)
# Feature Vector - v1 - v561
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
head(test_X, n=1)


## 4) Appropriately labels the data set with descriptive variable names. 
# Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="Person")
head(subjectTrain)
# Test labels: 1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING,5 STANDING,6 LAYING
train_Y <- read.table("UCI HAR Dataset/train/Y_train.txt",col.names="Label")
head(train_Y)
# Feature Vector - v1 - v561
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
head(train_X, n=1)

full_X <- rbind(test_X, train_X)
full_Y <- rbind(test_Y, train_Y)

## 1) Merges the training and the test sets to create one data set.
full_subject <- rbind(subjectTest, subjectTrain)
one <- cbind(full_subject, full_Y)
one <- tbl_df(one)
## 3) Descriptive activity names to name the activities in the data set
one <- mutate(one, Description = ifelse(Label==1, "Walking", ifelse (Label==2, "Up Stairs", ifelse(Label==3, "Down Stairs", ifelse(Label==4, "Sitting", ifelse(Label == 5 , "Standing",     ifelse(Label == 6, "Laying", Label)))))))
one <- cbind(one, full_X) # final
one <- tbl_df(one)
#head(one, n=1)

rm(test_X, test_Y, train_X, train_Y, subjectTest, subjectTrain) #cleanup


## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# create a vector of mean /sd results
by_pt <- one %>% group_by(Person, Description, Label)
one_mean <- by_pt %>% summarise_each(funs(mean))
one_sd <- by_pt %>% summarise_each(funs(sd))
one_mean <- one_mean[order(one_mean$Person,one_mean$Label),]
one_sd <- one_sd[order(one_sd$Person,one_sd$Label),]


#txt file created with write.table() using row.name=FALSE
write.table(one_mean, file="Person-Description-Label-Mean.txt", row.name=FALSE)
write.table(one_sd, file="Person-Description-Label-SD.txt", row.name=FALSE)


## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
one_mean

