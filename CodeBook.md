# GETDATA TIDY DATA PROJECT
## DATA DICTIONARY

The getdata_project_tidy_dataset.txt is a comma delimited dataset
with the following column in this order:

## FIELD 1: 
"subject_identifier"
> TYPE: INTEGER 
> DESC: A unique identifer per subject (person) attributed with numerous measurements of a wearable device
 
## FIELD 2: 
"activity"
> TYPE: CHARACTER STRING
> DESC: Activity types are unique labels associated with static or dynamic actions of an subject.  
    
> List of activity types:
    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING
  
## FIELD 3:  
"feature_measurement_name"
> TYPE: CHARACTER STRING
> DESC: The unique names of measurements take from the wearable device. The list of measurements names are drawn from this list:
    tBodyAcc-mean()-X
    tBodyAcc-mean()-Y
    tBodyAcc-mean()-Z
    tBodyAcc-std()-X
    tBodyAcc-std()-Y
    tBodyAcc-std()-Z
    tGravityAcc-mean()-X
    tGravityAcc-mean()-Y
    tGravityAcc-mean()-Z
    tGravityAcc-std()-X
    tGravityAcc-std()-Y
    tGravityAcc-std()-Z
    tBodyAccJerk-mean()-X
    tBodyAccJerk-mean()-Y
    tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X
    tBodyAccJerk-std()-Y
    tBodyAccJerk-std()-Z
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
    tBodyAccMag-mean()
    tBodyAccMag-std()
    tGravityAccMag-mean()
    tGravityAccMag-std()
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z
    fBodyAccJerk-mean()-X
    fBodyAccJerk-mean()-Y
    fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X
    fBodyAccJerk-std()-Y
    fBodyAccJerk-std()-Z
    fBodyGyro-mean()-X
    fBodyGyro-mean()-Y
    fBodyGyro-mean()-Z
    fBodyGyro-std()-X
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z
    fBodyAccMag-mean()
    fBodyAccMag-std()
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()    
    
## FIELD 4:
"measurement_total_average"
> TYPE: NUMERIC 
> DESC: The computed average of each measurement.
    
* * *    
## Additional Notes:
The content above is extracted from the UCI HAR Dataset provided for this assignement.  This data was provided as zip archived which was extracted to our working directory

### Field 1: subject_identifier...
contains the contents extracted from test and training dataset **subject_*.txt** files.  This data is unchanged. And there was no need to change it

###Field 2: activity...
contains the labels obtained the zip archive's root folder, called **activity_labels**. To ensure the tidy data was more readable, this dataset was joined to large measurement based dataset.  Eventually this field is used in the shaping and grouping calculations.

###Field 3: feature_measurement_name...
contains a subset of the feature names obtained in the zip archive's root folder, called **features.txt**.  An explanation of this features.txt is the additional support file, called **features_info.txt**.  This dataset used to populate the 561 fields both the training and test datasets.
Then a filter mechanism was used to extract out the columns that were only related to "mean" and "standard deviation (std)".

###Field 4: measurement_total_average...
contains the computed averages each measurement, grouped by factor of activities per and related to a specific subject.
 

