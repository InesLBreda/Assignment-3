# Assignment: Getting and Cleaning data Assignment

Dataset: Human Activity Recognition Using Smartphones 

Data details at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files:
- CodeBook.md a code book that describes the variables, the data, and any transformations or work performed to clean up the data

- run_analysis.R The script starts by loading the required packages, downloading the data files to the working directory (if needed) and importing the data files to R. After, the script executes 5 steps, as described in the assignment of the course: 1.Merge the training and the test sets to create one data set; 2.Extract only the measurements on the mean and standard deviation for each measurement; 3.Use descriptive activity names to name the activities in the data set; 4.Appropriately label the data set with descriptive variable names; 5.Create a second, independent tidy data set with the average of each variable for each activity and each subject.

- finaldata.txt is the data obtained after run_analysis.R
