# -----------------------------------------
# TOPIC: COURSERA DATASCIENCE GETTING DATA PROJECT
# AUTHOR: WESLEY SMALL
#
# SYNOPSIS:
#  THE RUN ANALYSIS SCRIPT PERFORMS THE NECESSARY ACTIONS TO
#  LOAD THE UCI HAR DATASET AND MERGE MULTIPLE FILES OF MEASURED 
#  CONTENT INTO A SINGLE DATASET
#
# THE OVERALL OBJECTIVE IS TO PROVIDE TIDY SUMMARY OF AVERAGES
# FOR UNIQUE SUBJECT-ACTIVITY-MEASURESURE COMBINATION.
# 
# THE INITIAL WORK MUST MERGE LARGER ASSET TOGETHER;
# SEE FUNCTION BELOW LABELLED: "generateTidyDataset"
# -----------------------------------------

# SET WORKING DIRECTORY; Contains the UCI-HAR-Dataset Content Uncompressed
# UNCOMMENT ALTER TO LOCAL ENVIRONMENT WHEN RUNNING.
setwd("~/develop/academic/coursera/datascience/c3-getdata/project1")

# SET BASE FILEPATH USED FOR READ OPERATION TO FOLLOW (ASSUMES WORKING DIRECTORY)
# CONTAINS DATASET IN QUESTION
filepathBase <- "./UCI HAR Dataset"

# -----------------------------------------
# LOAD ACTIVITY LABELS AS METADATA
dfMetaDataActivityLabels <- read.table(
    file = paste0(filepathBase,"/activity_labels.txt"),
    header = FALSE,
    sep = " ",
    col.names = c("activity_id","activity_label"))    

# -----------------------------------------
# LOAD FEATURES LIST AS METADATA FOR COLUMN NAMES
dfMetaDataFeatureColumnNames <- read.table(
    file = paste0(filepathBase,"/features.txt"),
    header = FALSE,
    sep = " ",
    col.names = c("feature_id","feature_label"))

# ------------------------------------------
# FUNCTION: GENERATE TIDY DATASET
# PARAM: datasetIdentifier (i.e. "train, "test")
# ANSWER: DATA.FRAME SUBJECTS, ACTIVITIES AND REQUIRED FEATURES
#
# SEE INLINE STEP/COMMENTS
# -----------------------------------------
generateTidyDataset <- function( datasetIdentifier ) {
    
    # LOAD SUBJECTS FROM SPECIFIED DATASET
    filenameSubjects <- 
        paste0(filepathBase,"/",datasetIdentifier,"/subject_",datasetIdentifier,".txt")
    dfSubjects <- read.table(
        file = filenameSubjects,
        header = FALSE,
        sep = "",
        stringsAsFactors = FALSE,
        col.names = c("subject_id"))
    
    # LOAD ACTIVITIES FROM SPECIFIED DATASET
    filenameActivities <-
        paste0(filepathBase,"/",datasetIdentifier,"/y_",datasetIdentifier,".txt")
    dfActivities <- read.table(
        file = filenameActivities,
        header = FALSE,
        sep = "",
        stringsAsFactors = FALSE,
        col.names = c("activity_id"))
    
    # LOAD RAW FEATURES FROM SPECIFIED DATASET
    filenameFeatures <- 
        paste0(filepathBase,"/",datasetIdentifier,"/X_",datasetIdentifier,".txt")
    dfFeatures <- read.table(
        file = filenameFeatures,
        header = FALSE,
        sep = "",
        stringsAsFactors = FALSE,
        fill = TRUE)
    
    # [TIDY] ASSOCIATE FEATURE DATASETS COLUMNS WITH LABEL NAMES
    # USER THE FEATURE.TXT FILE WITH LABELS PRESET FOR THE 561 COLUMNS
    names(dfFeatures) = as.vector(dfMetaDataFeatureColumnNames$feature_label)
    
    # [TIDY] REDUCE FEATURE COLUMNS DATA.FRAME TO CONTAIN ONLY 
    #        THOSE FIELDS RELATED TO "MEAN" OR "STANDARD DEVIATION"
    #        NOTE: USES REGEX EXPRESSION FILTER 
    #        TO LOGICAL VECTOR OF NECESSARY COLUMNS
    #        NOTE: meanFreq() IS NOT INCLUDED
    dfFeaturesSlim <- dfFeatures[,grepl( "-mean\\(\\)|-std\\(\\)",names( dfFeatures))]
    
    # [TIDY] MODIFY HUMAN READABLE VARIABLES NAMES
    names(dfFeaturesSlim) <- gsub("-mean\\(\\)", "Mean", names(dfFeaturesSlim))
    names(dfFeaturesSlim) <- gsub("-std\\(\\)", "STD", names(dfFeaturesSlim))
    names(dfFeaturesSlim) <- gsub("Acc", "Acceleration", names(dfFeaturesSlim))
    names(dfFeaturesSlim) <- gsub("Gyro", "Gyroscopic", names(dfFeaturesSlim))
    names(dfFeaturesSlim) <- gsub("Mag", "Magnitude", names(dfFeaturesSlim))
    names(dfFeaturesSlim) <- gsub("BodyBody", "Body2", names(dfFeaturesSlim))
    #names(dfFeaturesSlim) <- gsub("Gravity", "Gravity", names(dfFeaturesSlim))
    names(dfFeaturesSlim) <- gsub("^t", "Time", names(dfFeaturesSlim))
    names(dfFeaturesSlim) <- gsub("^f", "Frequency", names(dfFeaturesSlim))
    
    # GARBAGE COLLECTION: REMOVE FEATURES
    remove("dfFeatures")
    
    # [TIDY] MERGE (JOIN) ACTIVITIES WITH METADATA TO GET LISTING READABLE ACTIVITY 
    #        LABELS FOR ALL ROWS
    dfActivities <- merge(dfActivities, 
                          dfMetaDataActivityLabels, 
                          by.x = "activity_id", 
                          by.y = "activity_id")
    
    # BIND TOGETHER FULL DATASET
    dfTidy <- cbind(dfSubjects,dfActivities,dfFeaturesSlim)
    
    # GARBAGE COLLECTION: REMOVE DATASET (SCOPE FUNCTION ENVIRONMENT)
    remove("dfSubjects")
    remove("dfActivities")
    remove("dfFeaturesSlim")
    
    # RETURN DATA.FRAME
    dfTidy
}

# -----------------------------------------
# LOAD TRAINING AND TEST DATASETS AND BIND TOGETHER
df <- rbind(
         generateTidyDataset("train"),
         generateTidyDataset("test")
         )


# -----------------------------------------
# MELT DATASET -> 
#      ID COLUMNS SUBJECT + ACTIVITY
#      SET REMAINER OF COLUMNS (MEANS/STD) AS VARIABLES
if (!"reshape2" %in% installed.packages()){ install.packages("reshape2")} 
library("reshape2")
df1 <- melt(df,
            id=c("subject_id", "activity_label"),
            measure.vars=colnames(df)[grepl( "Mean|STD",names( df))]
       )

# -----------------------------------------
# DCAST TO "SUMMARIZE" MEAN FOR BY SUBJECT/ACTIVITY 
# FOR EACH FACTOR GROUP MEASUREMENTS VARIABLES
df2 <- dcast(df1, subject_id + activity_label ~ variable, mean)

# ------------------------------------------
# SET THE SUBJECT FIELD AS A FACTOR OF INTEGER IDS
df2$subject_id <- factor(df2$subject_id)

# -----------------------------------------
# [TIDY] NARROW DATASET SUCH A MANNER:
#        EACH ROW HAS UNIQUE(DISTINCT) COMBINATION OF 
#        SUBJECT, ACTIVITY, MEASUREMENT AND TOTAL AVERAGE     
df3 <- melt(df2,
            id=c("subject_id", "activity_label"),
            measure.vars=colnames(df2)[grepl( "Mean|STD",names( df2))]
       )

# -----------------------------------------
# [TIDY] RESET COLUMN NAMES TO MEANINGFUL IDENTIFIERS
colnames(df3) <- c("subject_identifier", 
                   "activity", 
                   "feature_measurement_name", 
                   "measurement_total_average")

# -----------------------------------------
# [TIDY] SORT DATASET
dfFinal <- df3[order(df3$subject_identifier, df3$activity, df3$feature_measurement_name),]

# -----------------------------------------
# [TIDY] WRITE OUT FINAL DATASET WORKING DIRECTORY
filenameFinalDataset <- "./getdata_project_tidy_dataset.txt"
write.table(file=filenameFinalDataset, 
            x=dfFinal,
            row.names = FALSE
            )
# View
#View(dfFinal)
