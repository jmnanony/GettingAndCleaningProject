
# R script called run_analysis.R that does the following. 
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject.


run_analysis <- function() {
    
# Create file paths to training/test sets and subject/feature/label data
    trainsetfile <- "./UCI HAR Dataset/train/X_train.txt"
    trainsubfile <- "./UCI HAR Dataset/train/subject_train.txt"
    trainactfile <- "./UCI HAR Dataset/train/y_train.txt"
    testsetfile <- "./UCI HAR Dataset/test/X_test.txt"
    testsubfile <- "./UCI HAR Dataset/test/subject_test.txt"
    testactfile <- "./UCI HAR Dataset/test/y_test.txt"
    featurenamefile <- "./UCI HAR Dataset/features.txt"
    activitylabelfile <- "./UCI HAR Dataset/activity_labels.txt"
    
# Read in feature names to be used as col.names for data sets. Remove special characters and set to lower case.
    varnames <- read.table(featurenamefile)
    varnames[,2] <- tolower(gsub("-|\\(|\\)", "", varnames[,2]))
    
    
# Read in train data with variable names as columns.
    datatrain <- read.table(trainsetfile, col.names = varnames[,2])
# Add columns to train data for subject and activity files.
    tempsub <- read.table(trainsubfile, col.names = "subject")
    tempact <- read.table(trainactfile, col.names = "activity")
    datatrain <- cbind(tempact, datatrain)
    datatrain <- cbind(tempsub, datatrain)
    
# Read in test data with variable names as columns.
    datatest <- read.table(testsetfile, col.names = varnames[,2])
# Add columns to test data for subject and activity files.
    tempsub <- read.table(testsubfile, col.names = "subject")
    tempact <- read.table(testactfile, col.names = "activity")
    datatest <- cbind(tempact, datatest)
    datatest <- cbind(tempsub, datatest)    
    
# Combine the training and test frames    
    data <- rbind(datatrain, datatest)

# Apply factor names to activity column
    actnames <- read.table(activitylabelfile)
    data$activity <- factor(data$activity, levels = actnames$V1, labels = actnames$V2)
    
# Make subject column a factor as well
    data$subject <- factor(data$subject, levels = c(1:30), labels = c(1:30))

# Keep only the columns for the subject, activity, and the mean and std variables in the time (t) domain    
    data <- select(data, subject, activity, matches("^t.*(mean|std)"))

    
# Create tidy dataset with the average of each variable for each activity and each subject.
    data %>% group_by(activity, subject) %>%
        summarise_each(funs(mean)) %>%
        write.table("./tidyset.txt", row.name = FALSE)

}
