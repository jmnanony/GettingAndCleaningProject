==================================================================
## Course Project for Getting and Cleaning Data
==================================================================

### Collect and clean data recorded from a study of
### "Human Activity Recognition Using Smartphones Dataset".

The data set and full description is found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

High level summary excerpted from the original data README:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz."

==================================================================

### File relationships and deliverables

The output of this project is a tidy data set holding the average of each mean and standard deviation variable of the original data set grouped by the activity type and recorded subjects (the volunteers). All reading of data from the original set and subsequent manipulations are done in the function run_analysis() defined in the script:

run_analysis.R

This file provides in coded format the instructions to transform the original data into the required tidy data set and write that to an output file:

tidyset.txt


The function run_analysis() can run if the top-level directory ("UCI HAR Dataset") of the original extracted data set is in the working directory. The output tidyset.txt is written to the working directory. The tidyset.txt can be most easily viewed by running these commands:

data <- read.table("./tidyset.txt", header = TRUE)

View(data)

==================================================================










