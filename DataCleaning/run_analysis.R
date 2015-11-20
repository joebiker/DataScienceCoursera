## Getting and cleaning data - course project

#You will be required to submit: 
#1) a tidy data set as described below, 
#2) a link to a Github repository with your script for performing the analysis, 
#3) CodeBook.md: a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
#4) README.md: explains how all of the scripts work and how they are connected.

# Definition http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


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


# Appropriately labels the data set with descriptive variable names. 
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

#install.packages("dplyr")
library(dplyr)
#two <- tbl_df(one)
#two <- mutate(two, Description = ifelse(Label==1, "Walking", ifelse (Label==2, "Up Stairs", ifelse(Label==3, "Down Stairs", ifelse(Label==4, "Sitting", ifelse(Label == 5 , "Standing",     ifelse(Label == 6, "Laying", Label)))))))


## Merges the training and the test sets to create one data set.
full_subject <- rbind(subjectTest, subjectTrain)
one <- cbind(full_subject, full_Y)
one <- tbl_df(one)
one <- mutate(one, Description = ifelse(Label==1, "Walking", ifelse (Label==2, "Up Stairs", ifelse(Label==3, "Down Stairs", ifelse(Label==4, "Sitting", ifelse(Label == 5 , "Standing",     ifelse(Label == 6, "Laying", Label)))))))
one <- cbind(one, full_X) # final
one <- tbl_df(one)
#one
rm(test_X, test_Y, train_X, train_Y, subjectTest, subjectTrain) #cleanup
#head(one, n=1)


#Extracts only the measurements on the mean and standard deviation for each measurement. 

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



