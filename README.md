# Tidy Data Project
### Coursera.org - GetData Course 
### Author: Wesley Small

The purpose of this project is demonstrate the ability to collect, work with, and clean a data set. 

This project has the following artifacts in this git respository:

* README.md - This document being currently read,
* getdata_project_tidy_dataset.txt - The tidy reshaped dataset required for this project assignment
* CodeBook.md -  A document that describes the variables, the data, and any transformations or work, performed to clean up the data,
* run_analysis.R - The R code that creates the tidy dataset.  See section below named R Code for more an overview about the code.  Within the codebase are inline documents for detailed steps to load and reshape the tidy dataset.


## Background and Synopsis

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The raw dataset is obtained from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


## What makes this Tidy?

The original raw dataset is spread out over multiple files.  We are also combining the training set and test of data into a single dateset to perform grouped averages by subject and activity.  The tidy data focuses on making the it human readable by combining the labels and keynames with the dataset files for activities and features. 

Please note:
* the original raw features dataset has 561 measurements columns series of test subjects. 
* For the puspose of this assignment, we are only interested a subset measurements taken, which total 66 fields.

We must transform the data in fews steps:
1. Merge the data together from the various artifacts related to measures provided for the UCI HAR Dataset.
2. add combine the readable labels to the combination of these files.
3. reshape the data to perform grouped analysis of the measurements by subject / activity type.
4. prepare the final dataset for review with proper naming conventions.


## R Code: run_analysis.R

The run_analysis.R that does the following step requested in the project assignment:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Set up and Execution of R Code

1. To execute the R code **run_analysis.R**, create a working directory and place this file in that directory.
2. Update the script's "setwd" (set working directory) to match if necessary.  Or comment out using the "#"
3. Extract the contents of the raw dataset achive (zip file) in to the working directory.  You should have a sub folder named **UCI HAR Dataset**.  If named anything else, rename to "UCI HAR Dataset"
4. Execute R code.
5. Open newly generate tidy dataset file named **getdata_project_tidy_dataset.txt** in working. The following code has been provided to load the dataset in R.

    filepath <- "./getdata_project_tidy_dataset.txt"
    data <- read.table(filepath, header = TRUE) 
    View(data)

