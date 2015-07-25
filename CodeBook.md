# GETDATA TIDY DATA PROJECT
## DATA DICTIONARY

The getdata_project_tidy_dataset.txt is a space delimited dataset
with the following column in this order:

## FIELD 1: 
"subject_identifier"

TYPE: INTEGER (2)

DESC: A unique identifer per subject (person) attributed with numerous measurements of a wearable device
 
## FIELD 2: 
"activity"

TYPE: CHARACTER STRING (18)

DESC: Activity types are unique labels associated with static or dynamic actions of an subject.  
	
List of activity types:

	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING
  
## FIELD 3:  
"feature_measurement_name"

TYPE: CHARACTER STRING (27)

DESC: The unique names of measurements take from the wearable device. The list of measurements names are drawn from this list:

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

TYPE: NUMERIC (17)

DESC: The computed average of each measurement in decimal format.
	
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


## REPORT FROM R:

#### STRUCTURE OF DATA.FRAME

    > str( "getdata_project_tidy_dataset.txt"
    
    'data.frame':	924 obs. of  4 variables:
    $ subject_identifier      : int  2 2 2 2 2 2 2 2 2 2 ...
    $ activity                : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
    $ feature_measurement_name: Factor w/ 66 levels "tBodyAcc-mean()-X",..: 1 2 3 4 5 6 7 8 9 10 ...
    $ total_average           : num  0.2731 -0.0191 -0.1156 -0.6056 -0.429 ...
    
#### SAMPLING OF TIDY RECORDS:
    
    > dfFinal[sample(nrow(dfFinal), 8),]
    subject_identifier           activity    feature_measurement_name total_average
    387                 13            SITTING       tBodyGyroJerk-std()-X  -0.715772980
    80                  18            SITTING            tBodyAcc-std()-Z  -0.950753018
    112                 24             LAYING        tGravityAcc-mean()-Y   0.072950970
    410                  9   WALKING_UPSTAIRS       tBodyGyroJerk-std()-Z  -0.744656038
    395                  4   WALKING_UPSTAIRS       tBodyGyroJerk-std()-Y  -0.888412003
    588                 24             LAYING           fBodyAcc-mean()-Y  -0.611509043
    334                 20             LAYING           tBodyGyro-std()-Z  -0.460843186
    358                 12 WALKING_DOWNSTAIRS      tBodyGyroJerk-mean()-Y  -0.042195706
