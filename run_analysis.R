## Grab the data for the project (wearable computing data)

## Write an R script that accomplishes the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

## Prep work

## Download the file from the link provided
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "courseproject.zip")
dateDownloaded <- date()
dateDownloaded

## Unzip the file to local directory

## Set the working directory
setwd("C:/Users/Eric/Desktop/Coursera/Getting and Cleaning Data/R Files")

## Clean up environment
rm(list=ls())

## Load the plyr library to work with data more easily
library(plyr)




## STEP 1. Merges the training and the test sets to create one data set.

## Get TRAINING data ready
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
features     <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
activityType <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

## Assign column names to the TRAINING data imported above
colnames(activityType)  = c("activityId", "activityType"); activityType
colnames(subjectTrain)  = "subjectId"; head(subjectTrain)
colnames(xTrain)        = features[,2]; head(xTrain[1:5, 1:5])
colnames(yTrain)        = "activityId"; head(yTrain)

## Merge the tables into a single table of TRAINING data
trainingData <- cbind(yTrain, subjectTrain, xTrain)


## Get TEST data ready
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Assign column names to the TEST data imported above
colnames(subjectTest)  = "subjectId"; head(subjectTest)
colnames(xTest)        = features[,2]; head(xTest[1:5, 1:5])
colnames(yTest)        = "activityId"; head(yTest)

## Merge the tables into a single table of TEST data
testData <- cbind(yTest, subjectTest, xTest)

## Merge the TRAINING and TEST datasets into a final dataset for analysis
trainingTestData <- rbind(trainingData, testData)



## STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## Create a vector for the column names from the final dataset to be able to select
## among the column names

colNames <- colnames(trainingTestData)

##  Create a logical vector to pull together the desired columns:
## the ID, mean() & stddev() columns and FALSE for others
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | 
                   grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & 
                   !grepl("mean..-", colNames) | grepl("-std..",colNames) & 
                   !grepl("-std()..-",colNames))

# Subset trainingTestData table based on the logicalVector to keep only desired columns
trainingTestDataMeanSd <- trainingTestData[logicalVector==TRUE];


## STEP 3. Uses descriptive activity names to name the activities in the data set

## Merge the trainingTestDataMeanSd set with the activityType table to include descriptive activity names
trainingTestDataMeanSdMerged <- merge(trainingTestDataMeanSd, activityType, by='activityId', all.x=TRUE)




## STEP 4. Appropriately label the data set with descriptive variable names. 

## Updating the colNames vector to include the new column names after merge
colNamesMerged <- colnames(trainingTestDataMeanSdMerged)

## Take a look at the names as they are now so we know what to adjust

for (i in 1:length(colNamesMerged)) 
{
  colNamesMerged[i] = gsub("\\()","", colNamesMerged[i])                   ## removes parentheses from labels
  colNamesMerged[i] = gsub("-std$","stddev ", colNamesMerged[i])            ## converts to readable standard deviation
  colNamesMerged[i] = gsub("-mean","mean ", colNamesMerged[i])              ## converts to readable mean
  colNamesMerged[i] = gsub("^(t)","time ", colNamesMerged[i])               ## converts lines beginning with "t" to "time"
  colNamesMerged[i] = gsub("^(f)","frequency ", colNamesMerged[i])               ## converts lines beginning with "f" to "frequency"
  colNamesMerged[i] = gsub("([Gg]ravity)","gravity ", colNamesMerged[i])          ## converts all "gravity" to lowercase
  colNamesMerged[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","body ", colNamesMerged[i]) ## converts all "body" to single "body"
  colNamesMerged[i] = gsub("[Gg]yro","gyro ",colNamesMerged[i])                  ## converts all "gyro" to lowercase
  colNamesMerged[i] = gsub("[Aa]ccMag","acc magnitude ", colNamesMerged[i])          ## converts abbreviated ACCMag to full description
  colNamesMerged[i] = gsub("[Aa]ccJerk","acc jerk ", colNamesMerged[i])          ## converts abbreviated ACCJerk to full description
  colNamesMerged[i] = gsub("([Bb]odyaccjerkmag)","body acc jerk magnitude ", colNamesMerged[i])   ## converts abbreviated AccJerkMag to full description
  colNamesMerged[i] = gsub("[Jj]erkMag","jerk magnitude ", colNamesMerged[i])      ## converts abbreviated JerkMag to full description
  colNamesMerged[i] = gsub("[Gg]yroMag","gyro magnitude ", colNamesMerged[i])      ## converts abbreviated GyroMag to full description
  colNamesMerged[i] = gsub("Mag","magnitude ", colNamesMerged[i])               ## converts abbreviated Mag to full description
}

## View changes
colNamesMerged

## Make a copy
colNamesMerged2 <- colNamesMerged


## Reassign the new descriptive column names to the trainingTestDataMeanSdMerged dataset
colnames(trainingTestDataMeanSdMerged) = colNamesMerged2

## View changes in column labels
names(trainingTestDataMeanSdMerged)


## STEP 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

## Create a new table, finalDataNoActivityType without the activityType column
finalDataNoActivityType  <- trainingTestDataMeanSdMerged[,names(trainingTestDataMeanSdMerged) != 'activityType']

## Aggregate the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
tidyData <- aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) 
                                              != c('activityId','subjectId')],
                      by=list(activityId=finalDataNoActivityType$activityId, 
                              subjectId = finalDataNoActivityType$subjectId), mean)

## Merge the tidyData with activityType to include descriptive activity names
tidyData <- merge(tidyData, activityType, by='activityId', all.x=TRUE)

## Export the tidyData set 
write.table(tidyData, './tidyData.txt', row.names=FALSE, sep='\t')



