# Tidy Data Project
### Coursera.org - GetData Course 
### Author: Wesley Small

The purpose of this project is demonstrate the ability to collect, work with, and clean a data set. 

This READ-ME file has the following sections below:

1. Overview
2. Background and Synopsis
3. What makes this Tidy
4. About the R Code -> run_anaylsis.R
5. Set up & Execution of R Code


## Overview

This respository has the following artifacts listed for review:

* [README.md](README.md) - This document being currently read,
* [getdata_project_tidy_dataset.txt](getdata_project_tidy_dataset.txt) - The tidy reshaped dataset required for this project assignment
* [CodeBook.md](CodeBook.md) -  A document that describes the variables, the data, and any transformations or work, performed to clean up the data,
* [run_analysis.R](run_analysis.R) - The R code that creates the tidy dataset.  See section below named R Code for more an overview about the code.  Within the codebase are inline documents for detailed steps to load and reshape the tidy dataset.


## Background and Synopsis

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The raw dataset is obtained from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

*** The above section was cited: From the getdata course project instructions***

In addition, a thorough dissertation about Tidy Data is provided by --------- in his paper called []().  There are additonal references made to the summarized lectures notes provided Professor Jeff Leek at <https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/01_03_componentsOfTidyData.pdf>.

## What makes this Tidy?

The original raw Samsung Wearables dataset is spread out over multiple files. The notes about the format of the original dataset is not combine in the raw data making it difficult to read. These findings are consistent with the information discussed our instructor. Professor Jeff Leak, in his lecture about Tidy Data.  Please see [Tidy Data Slide #3](http://jtleek.com/modules/03_GettingData/01_03_componentsOfTidyData/#3).

Please note:

* the original raw features dataset has 561 measurements columns series of test subjects. 
* For the puspose of this assignment, we are only interested a subset measurements taken. This accounts for 66 feature measurements with mean or standard deviation (std) in the naming conventions. The explanation of the naming conventions was provided in the original raw dataset in a file named **features_info.txt**.
 
The Samsung Wearables dataset is transformed from it's raw form to the requested tidy data format outlined for this assignement using the following methods:

1. Merged together the required data artifacts within the Samumg UCI HAR Dataset to a single data construct.
2. Combined in the human readable labels into this new dataset 
3. Reshaped the dataset in order to perform specific grouped based calculations of the measurements related to combinations subject, activity type and meansurement type.
4. Prepared the final data for output (and subsequent review) with additional cleansing of the final data model. In this case, altered the column names to be meaningful.

The final tidy dataset generated by the [run_analysis.R](run_analysis.R) script satisfies both:

A. Course Project Instruction, "...data set with the average of each variable for each activity and each subject."
B. The rules Tidy Data which Professor Jeff Leek summarrized in his lectures on Tiy Data. Please see [Tidy Data Slide #4](http://jtleek.com/modules/03_GettingData/01_03_componentsOfTidyData/#4). 

*Each variable you measure should be in one column.  
*Each Observation should be in one Row.  
*The header should be included with the variable names.
*Make the variable names more human readable.


## About the R Code -> run_anaylsis.R

The run_analysis.R that does the following step requested in the project assignment:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Set up & Execution of R Code

1. To execute the R code **run_analysis.R**, create a working directory and place this file in that directory.
2. Update the script's "setwd" (set working directory) to match if necessary.  Or comment out using the "#"
3. Extract the contents of the raw dataset achive (zip file) in to the working directory.  You should have a sub folder named **UCI HAR Dataset**.  If named anything else, rename to "UCI HAR Dataset"
4. Execute R code.
5. Open newly generate tidy dataset file named **getdata_project_tidy_dataset.txt** in working. 


***The following code has been provided to load the dataset in R.***

    filepath <- "./getdata_project_tidy_dataset.txt"
    data <- read.table(filepath, header = TRUE) 
    View(data)

