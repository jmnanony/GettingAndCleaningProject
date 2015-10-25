==================================================================
## CodeBook for Course Project for Getting and Cleaning Data
==================================================================

The source data file structure and variable derivations from the raw data are described in the README and features_info files included with the original data set: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Those files describe each measure, units, and initial processing to arrive at the 561 feature data set. Those details will not be repeated in this CodeBook.

This CodeBook does describes how the data from those derived variables are collected and manipulated to achieve the desired tidy subset.

NOTE: only the mean and standard deviation for the time domain (t) variables are included in the resulting tidy subset. The frequency and angular variables could be processed in a similar way by also "select"ing those variables in run_analysis().

==================================================================
### Variables in tidyset.txt
==================================================================

subject - factor of 1 to 30 identifying each participant
activity - factor naming the six activities done by the subjects (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Each of these base variable names have either "mean"" or "std"" and an "x"", "y"", or "z"" appended to the name. These represent with the mean or standard deviation data for each of the 3-axial directions measured:

* tbodyacc
* tgravityacc
* tbodyaccjerk
* tbodygyro
* tbodygyrojerk

Each of these base variable names have either "mean"" or "std"" appended to the name. These represent with the mean or standard deviation data for the magnitude calculated from the 3 dimensional signals:

* tbodyaccmag
* tgravityaccmag
* tbodyaccJerkmag
* tbodygyromag
* tbodygyroJerkmag

The resulting matrix has 2 id variables (subject, activity) and 40 measurement variables.

==================================================================
### Transformations to create tidyset.txt
==================================================================

Steps taken in the code for run_analysis():

* Define paths to all required text files.
* Read in variable names, remove special characters, and set case to lower.
* Read in primary training data set using modified variable names for column names.
* Column bind the corresponding training activity and subject vectors to the training data.
* Read in primary test data set using modified variable names for column names.
* Column bind the corresponding test activity and subject vectors to the test data.
* Row bind the training and test data sets to merge into one data set.
* Read in the activity names and transform the activity column to be a factor using these names.
* Transform the subject column to be a factor of the ids.
* Select a subset of columns to include subject, activity, and all mean or std variables in the time-domain.
* Group the data by activity and subject.
* Generate a summary table that calculates the mean for each grouping (summarise_each(funs(mean))).
* Output the table to tidyset.txt.

==================================================================


