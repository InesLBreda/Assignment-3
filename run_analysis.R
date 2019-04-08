#Load packages
library (dplyr)

#load data to directory
file <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(file)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, file, method = "curl")
} #To download the zip file if it does not exist in the  directory.
if (!file.exists("UCI HAR Dataset")) {
        unzip(file)
} #To unzip the file if the unziped file does not exist in the directory.

#Import data to R with assigning variables
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features <- features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
subject_test <- - read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Step 1: Merge the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
rawdata <- cbind(subject, x, y)
rm("subject_test", "x_test", "y_test", "subject_train", "x_train", "y_train", "x", "y", "subject", "features") #To remove unnecessary datasets.

#Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
data <- rawdata %>% select(subject, code, contains("mean"), contains("std"))

#Step 3: Use descriptive activity names to name the activities in the data set.
data$code <- activities[data$code, 2]

#Step 4: Appropriately label the data set with descriptive variable names.
data <- rename(data, Activity = code, Subject = subject)
data$Subject <- abs(data$Subject)
names(data) <- gsub("Freq", "Frequency", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub ("Acceleromete", "Accelerometer", names(data))
names(data) <- gsub ("Acc", "Accelerometer", names(data))
names(data) <- gsub ("Gyro", "Gyroscope", names(data))
names(data) <- gsub ("BodyBody", "Body", names(data))
names(data) <- gsub ("Mag", "Magnitude", names(data))
names(data) <- gsub ("tBody", "TimeBody", names(data))
names(data) <- gsub(".[Mm]ean()", "Mean", names(data))
names(data) <- gsub(".[Ss]td()", "Std", names(data))
names(data) <- gsub("angle", "Angle", names(data))
names(data) <- gsub("gravit", "Gravity", names(data))
names(data) <- gsub("XGravityMean", "GravityMeanX", names(data))
names(data) <- gsub("YGravityMean", "GravityMeanY", names(data))
names(data) <- gsub("ZGravityMean", "GravityMeanZ", names(data))
names(data) <- gsub("\\.", "", names(data))

#Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
finaldata <- data %>%
        group_by(Subject, Activity) %>%
        summarise_all(funs(mean))
rm("data", "activities") #To remove unnecessary datasets.
write.table(finaldata, "FinalData.txt", row.name=FALSE) # To export the final data to the working directory in a txt file format.
