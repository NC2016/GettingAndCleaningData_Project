# Getting and cleaning data - Course Project - by Nathalie Kuicheu
#### You should create one R script called run_analysis.R that does the following.
#### 1. Merges the training and the test sets to create one data set.
#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#### 3. Uses descriptive activity names to name the activities in the data set
#### 4. Appropriately labels the data set with descriptive variable names.
#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library (dplyr)
library(data.table)

setwd("C:/Users/Fanzou Nath/Documents/Data Science - Coursera/R programming WD")
featuresNames <- read.table('./UCI HAR Dataset/features.txt')
activityNames <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
features_test <- read.table('./UCI HAR Dataset/test/X_test.txt', header = FALSE)
activity_test <- read.table('./UCI HAR Dataset/test/y_test.txt', header = FALSE)
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt', header = FALSE)
features_train <- read.table('./UCI HAR Dataset/train/X_train.txt', header = FALSE)
activity_train <- read.table('./UCI HAR Dataset/train/y_train.txt', header = FALSE)
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt', header = FALSE)

## 1. Merging the training set and the test set  
features <- rbind(features_train, features_test)
activity <- rbind(activity_train, activity_test)
subject <- rbind(subject_train, subject_test)
colnames(features) <- featuresNames[, 2]
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
data <- cbind(features, activity, subject)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanstd <- grep("mean|std", names(data), ignore.case = TRUE)
x <- c(meanstd, 562, 563)
## dim(data)
dataMeanStd <- data[,x]
## dim(dataMeanStd)

## 3. Uses descriptive a,ctivity names to name the activities in the data set
dataMeanStd$Activity <- as.character(dataMeanStd$Activity)
for (i in 1:6){
  dataMeanStd$Activity[dataMeanStd$Activity == i] <- as.character(activityNames[i,2])
}
dataMeanStd$Activity <- as.factor(dataMeanStd$Activity)

## 4. Appropriately labels the data set with descriptive variable names.
## names(dataMeanStd)
names(dataMeanStd) <- gsub("Acc", "Accelerometer", names(dataMeanStd))
names(dataMeanStd) <- gsub("Gyro", "Gyroscope", names(dataMeanStd))
names(dataMeanStd) <- gsub("BodyBody", "Body", names(dataMeanStd))
names(dataMeanStd) <- gsub("Mag", "Magnitude", names(dataMeanStd))
names(dataMeanStd) <- gsub("^f", "Frequency", names(dataMeanStd))
names(dataMeanStd) <- gsub("^t", "Time", names(dataMeanStd))
names(dataMeanStd) <- gsub("tBody", "TimeBody", names(dataMeanStd))
names(dataMeanStd) <- gsub("freq\\(\\)", "Frequency", names(dataMeanStd), ignore.case = TRUE)
names(dataMeanStd) <- gsub("-mean\\(\\)", "Mean", names(dataMeanStd), ignore.case = TRUE)
names(dataMeanStd) <- gsub("-std\\(\\)", "STD", names(dataMeanStd), ignore.case = TRUE)
names(dataMeanStd) <- gsub("angle", "Angle", names(dataMeanStd), ignore.case = TRUE)
names(dataMeanStd) <- gsub("gravity", "Gravity", names(dataMeanStd), ignore.case = TRUE)
names(dataMeanStd)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

dataMeanStd$Subject <- as.factor(dataMeanStd$Subject)
tidyData2 <- aggregate(. ~Subject + Activity, dataMeanStd, mean)
tidyData2 <- tidyData2[order(tidyData2$Subject, tidyData2$Activity), ]
write.table(tidyData2, file = "TidyData.txt", row.names = FALSE)
#dim(tidyData2)








