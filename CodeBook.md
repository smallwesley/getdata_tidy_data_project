# CODEBOOK FOR GETDATA TIDY DATA PROJECT 

## Overview of Codebook:

The Cookbook provides a detailed data dictionary explanation for the structure of the tidy dataset for this project.

The tidy data result produced from the **run_analysis.R** is a transmutation of the original Samsumg Wearables UCI HAR Dataset that is provided at:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Please note: the Samsung Wearables "training" & "test" dataset are used in the scope of this project.  The content of the Inertia subfolders were not used.
The test and training sets are merged together as one large dataset during which, the structure is cleaned up to be more tidy.
The dataset provides a various artifacts give clarity to the various fields (features measurements) and the activity names. 
The only measurements necessary for scope  of this project were those related to the mean or standard deviation. 
These feature measurement were extracted based on the names containing "-mean()" and "-std()" respectively.
The units for feature measurements (mean, standard deviation) where from the dataset are not modified in any manner.

The tidy dataset is in narrow long format. 
It contains 4 fields -> 
    [Subject Identifier(CodeBook.md#field-1), 
    [Activity Label(CodeBook.md#field-2), 
    [Feature Measurement Name(CodeBook.md#field-3), 
    [Measurement Total Average](CodeBook.md#field-4).  
Each row is contains a unique combination of subject identifier, an activity label and a feature measurement name, and the computed average.   
The computed average was obtained while grouping the subject identifier and activity types with "R" programming operations.



## DATA DICTIONARY

The getdata_project_tidy_dataset.txt is a single space delimited dataset with the following columns in this order:


### FIELD 1: 
**"subject_identifier"**

**TYPE:** INTEGER (2)

**DESC:** A unique identifier per subject (person) attributed with numerous measurements of a wearable device
 
**NOTES:**
The content above is extracted from the UCI HAR Dataset provided for this assignment.  This data was provided as zip archived which was extracted to our working directory


### FIELD 2: 
**"activity"**

**TYPE:** CHARACTER STRING (18)

**DESC:** Activity types are unique labels associated with static or dynamic actions of an subject.  

**NOTES:**
The activity field contains the human readable labels retrieved directly from **activity_labels.txt** file provided in the Samsung dataset. Eventually this field is used in the shaping and grouping calculations.
	
List of activity types are restricted to the following 6 actions names:

	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING
  
### FIELD 3:
**"feature_measurement_name"**

**TYPE:** CHARACTER STRING (50)

**DESC:** The unique names of measurements take from the wearable device. The list of measurements names are drawn from this list:

**NOTES:**
This field contains a subset of the feature names translated from the original set listed in **features.txt** which can be found in the Samsung dataset directory.
An explanation of this features.txt is the additional support file, called **features_info.txt**.  Please see ADDENDUM A for the feature info document. 
All constants here have been translated from the original raw form to a clearer human readable format. The list of constants used in our tidy dataset is listed below on the left.  The original feature measurement names are list beside on the right.
The rules were used to translate convert are listed below the list of measurement names.

    {UPDATED MEASUREMENT NAME}                         {ORIGINAL MEASUREMENT NAME}
    --------------------------                         --------------------------- 
    TimeBodyAccelerationMean-X                         [ tBodyAcc-mean()-X ]
    TimeBodyAccelerationMean-Y                         [ tBodyAcc-mean()-Y ]
    TimeBodyAccelerationMean-Z                         [ tBodyAcc-mean()-Z ]
    TimeBodyAccelerationSTD-X                          [ tBodyAcc-std()-X ]
    TimeBodyAccelerationSTD-Y                          [ tBodyAcc-std()-Y ]
    TimeBodyAccelerationSTD-Z                          [ tBodyAcc-std()-Z ]
    TimeGravityAccelerationMean-X                      [ tGravityAcc-mean()-X ]
    TimeGravityAccelerationMean-Y                      [ tGravityAcc-mean()-Y ]
    TimeGravityAccelerationMean-Z                      [ tGravityAcc-mean()-Z ]
    TimeGravityAccelerationSTD-X                       [ tGravityAcc-std()-X ]
    TimeGravityAccelerationSTD-Y                       [ tGravityAcc-std()-Y ]
    TimeGravityAccelerationSTD-Z                       [ tGravityAcc-std()-Z ]
    TimeBodyAccelerationJerkMean-X                     [ tBodyAccJerk-mean()-X ]
    TimeBodyAccelerationJerkMean-Y                     [ tBodyAccJerk-mean()-Y ]
    TimeBodyAccelerationJerkMean-Z                     [ tBodyAccJerk-mean()-Z ]
    TimeBodyAccelerationJerkSTD-X                      [ tBodyAccJerk-std()-X ]
    TimeBodyAccelerationJerkSTD-Y                      [ tBodyAccJerk-std()-Y ]
    TimeBodyAccelerationJerkSTD-Z                      [ tBodyAccJerk-std()-Z ]
    TimeBodyGyroscopicMean-X                           [ tBodyGyro-mean()-X ]
    TimeBodyGyroscopicMean-Y                           [ tBodyGyro-mean()-Y ]
    TimeBodyGyroscopicMean-Z                           [ tBodyGyro-mean()-Z ]
    TimeBodyGyroscopicSTD-X                            [ tBodyGyro-std()-X ]
    TimeBodyGyroscopicSTD-Y                            [ tBodyGyro-std()-Y ]
    TimeBodyGyroscopicSTD-Z                            [ tBodyGyro-std()-Z ]
    TimeBodyGyroscopicJerkMean-X                       [ tBodyGyroJerk-mean()-X ]
    TimeBodyGyroscopicJerkMean-Y                       [ tBodyGyroJerk-mean()-Y ]
    TimeBodyGyroscopicJerkMean-Z                       [ tBodyGyroJerk-mean()-Z ]
    TimeBodyGyroscopicJerkSTD-X                        [ tBodyGyroJerk-std()-X ]
    TimeBodyGyroscopicJerkSTD-Y                        [ tBodyGyroJerk-std()-Y ]
    TimeBodyGyroscopicJerkSTD-Z                        [ tBodyGyroJerk-std()-Z ]
    TimeBodyAccelerationMagnitudeMean                  [ tBodyAccMag-mean() ]
    TimeBodyAccelerationMagnitudeSTD                   [ tBodyAccMag-std() ]
    TimeGravityAccelerationMagnitudeMean               [ tGravityAccMag-mean() ]
    TimeGravityAccelerationMagnitudeSTD                [ tGravityAccMag-std() ]
    TimeBodyAccelerationJerkMagnitudeMean              [ tBodyAccJerkMag-mean() ]
    TimeBodyAccelerationJerkMagnitudeSTD               [ tBodyAccJerkMag-std() ]
    TimeBodyGyroscopicMagnitudeMean                    [ tBodyGyroMag-mean() ]
    TimeBodyGyroscopicMagnitudeSTD                     [ tBodyGyroMag-std() ]
    TimeBodyGyroscopicJerkMagnitudeMean                [ tBodyGyroJerkMag-mean() ]
    TimeBodyGyroscopicJerkMagnitudeSTD                 [ tBodyGyroJerkMag-std() ]
    FrequencyBodyAccelerationMean-X                    [ fBodyAcc-mean()-X ]
    FrequencyBodyAccelerationMean-Y                    [ fBodyAcc-mean()-Y ]
    FrequencyBodyAccelerationMean-Z                    [ fBodyAcc-mean()-Z ]
    FrequencyBodyAccelerationSTD-X                     [ fBodyAcc-std()-X ]
    FrequencyBodyAccelerationSTD-Y                     [ fBodyAcc-std()-Y ]
    FrequencyBodyAccelerationSTD-Z                     [ fBodyAcc-std()-Z ]
    FrequencyBodyAccelerationJerkMean-X                [ fBodyAccJerk-mean()-X ]
    FrequencyBodyAccelerationJerkMean-Y                [ fBodyAccJerk-mean()-Y ]
    FrequencyBodyAccelerationJerkMean-Z                [ fBodyAccJerk-mean()-Z ]
    FrequencyBodyAccelerationJerkSTD-X                 [ fBodyAccJerk-std()-X ]
    FrequencyBodyAccelerationJerkSTD-Y                 [ fBodyAccJerk-std()-Y ]
    FrequencyBodyAccelerationJerkSTD-Z                 [ fBodyAccJerk-std()-Z ]
    FrequencyBodyGyroscopicMean-X                      [ fBodyGyro-mean()-X ]
    FrequencyBodyGyroscopicMean-Y                      [ fBodyGyro-mean()-Y ]
    FrequencyBodyGyroscopicMean-Z                      [ fBodyGyro-mean()-Z ]
    FrequencyBodyGyroscopicSTD-X                       [ fBodyGyro-std()-X ]
    FrequencyBodyGyroscopicSTD-Y                       [ fBodyGyro-std()-Y ]
    FrequencyBodyGyroscopicSTD-Z                       [ fBodyGyro-std()-Z ]
    FrequencyBodyAccelerationMagnitudeMean             [ fBodyAccMag-mean() ]
    FrequencyBodyAccelerationMagnitudeSTD              [ fBodyAccMag-std() ]
    FrequencyBody2AccelerationJerkMagnitudeMean        [ fBodyBodyAccJerkMag-mean() ]
    FrequencyBody2AccelerationJerkMagnitudeSTD         [ fBodyBodyAccJerkMag-std() ]
    FrequencyBody2GyroscopicMagnitudeMean              [ fBodyBodyGyroMag-mean() ]
    FrequencyBody2GyroscopicMagnitudeSTD               [ fBodyBodyGyroMag-std() ]
    FrequencyBody2GyroscopicJerkMagnitudeMean          [ fBodyBodyGyroJerkMag-mean() ]
    FrequencyBody2GyroscopicJerkMagnitudeSTD           [ fBodyBodyGyroJerkMag-std() ]
	
Rules for conversion of the raw feature measurement labels:

    **-mean()** is converted to **Mean**
    **-std()** is converted to **STD**
    **Acc** is converted to **Acceleration**
    **Gyro** is converted to **Gyroscopic**
    **Mag** is converted to **Magnitude**
    **BodyBody** is converted to **Boby2**
    Labels starting with letter **t** is prefixed **Time**
    Labels starting with letter **f** is prefixed **Frequency**	
	
	
	
### FIELD 4:
**"measurement_total_average"**

**TYPE:** NUMERIC (17)

**DESC:** The computed average of each measurement in decimal format.
	
**NOTES:**	
This field contains the computed averages each feature measure related to a subject and activity.


* * *

## REPORT FROM R:

#### STRUCTURE OF DATA.FRAME

    > str( "getdata_project_tidy_dataset.txt"
    
    'data.frame':	2640 obs. of  4 variables:
     $ subject_identifier       : int  1 1 1 1 1 1 1 1 1 1 ...
     $ activity                 : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
     $ feature_measurement_name : Factor w/ 66 levels "TimeBodyAccelerationMean-X",..: 1 2 3 4 5 6 7 8 9 10 ...
     $ measurement_total_average: num  0.2657 -0.0183 -0.1078 -0.5458 -0.3677 ...
    
* * *    
    
#### SAMPLING OF TIDY DATASET RECORDS:
    
    > dfFinal[sample(nrow(dfFinal), 8),]
         subject_identifier           activity                 feature_measurement_name measurement_total_average
    905                  18           STANDING                  TimeBodyGyroscopicSTD-Y                -0.7593708
    2257                 13            SITTING             FrequencyBodyGyroscopicSTD-Y                -0.6506236
    331                   9   WALKING_UPSTAIRS            TimeGravityAccelerationMean-Z                 0.1043537
    2255                 12            SITTING             FrequencyBodyGyroscopicSTD-Y                -0.6696223
    1856                 12 WALKING_DOWNSTAIRS      FrequencyBodyAccelerationJerkMean-X                -0.6599621
    2131                  9   WALKING_UPSTAIRS            FrequencyBodyGyroscopicMean-Y                -0.6839243
    2621                 16 WALKING_DOWNSTAIRS FrequencyBody2GyroscopicJerkMagnitudeSTD                -0.8865332
    2056                 12 WALKING_DOWNSTAIRS       FrequencyBodyAccelerationJerkSTD-Z                -0.7963086


* * * 

## ADDENDUM A) SAMSUNG FEATURE_INFO DOCUMENT##

###Feature Selection### 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
