==========================================================================================
Getting and Cleaning Data Course Project
==========================================================================================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
  
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==========================================================================================
Getting and cleaning data - Course Project - by Nathalie Kuicheu
==========================================================================================

Objective of the project: create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

==========================================================================================
## This repository contains:
==========================================================================================

0. README.txt
1. run_analysis.R : The .R script that analyses and cleans the provided data into a tidy data set.
The principal variables in run_Analysis are:

1.1 data: contains the data set loaded from the orginal sets provided fr this project.
The size of data (its dimension): 10299: rows and   563 columns. The names of its column are printed in the codebook.

1.2 dataMeanStd: our first tidy data set which contains only the measurements on the mean and standard deviation for each measurement. Its column's names descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names
The size of dataMeanStd (its dimension): 10299: rows and   88 columns. The names of its column are printed in the codebook.

1.3 tidyData2 : From dataMeanStd, we create a second independent tidy data set with the average of each variable for each activity and each subject called tidyData2.
The size of tidyData2 (its dimension): 180 rows and   88 columns. 


2. Codebook.Rmd: Explains step by step the fonctionality of each line of the run_analysis.r script. It also contains some other code used to validate the progress in the data set; its checks the dimension of the data set at every steps and also the names of its columns.

3. TidyData.txt : From tidyData2, we order its column and write the result in an out put file named tidyData.txt: the tidy data obtained after running the script run_analysis.R
