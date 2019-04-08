# Code Book

The run_analysis.R script obtains and treats the data following the instructions given in the assignment (5 steps). More information available at README.md.

### Loading packages 
The dplyr package is loaded to allow the treatment of the data.

### Load data to directory
Dataset downloaded and extracted under the folder called UCI HAR Datase.

### Import data to R with assigning variables
The data is imported to R using the read.table() function.
activities <- activity_labels.txt : 6 rows, 2 columns 
List of activities performed when the corresponding measurements were taken and its codes (labels)
features <- features.txt : 561 rows, 2 columns 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
subject_test <- test/subject_test.txt : 2947 rows, 1 column 
contains test data of 9/30 volunteer test subjects being observed
x_test <- test/X_test.txt : 2947 rows, 561 columns 
contains recorded features test data
y_test <- test/y_test.txt : 2947 rows, 1 columns 
contains test data of activities’code labels
subject_train <- test/subject_train.txt : 7352 rows, 1 column 
contains train data of 21/30 volunteer subjects being observed
x_train <- test/X_train.txt : 7352 rows, 561 columns 
contains recorded features train data
y_train <- test/y_train.txt : 7352 rows, 1 columns 
contains train data of activities’code labels

### Step 1: Merge the training and the test sets to create one data set.
X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function
rawdata (10299 rows, 563 column) is created by merging subject, Y and X using cbind() function
All unnecessary datasets are removed using rm() function, keeping only rawdata and activities.

### Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
data (10299 rows, 88 columns) is created by subsetting rawdata, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

### Step 3: Use descriptive activity names to name the activities in the data set.
Code numbers of activity in the code column of the data dataframe are replaced with corresponding activity accordantly to the second column of the activities variable.

### Step 4: Appropriately label the data set with descriptive variable names.
code column in data renamed to Activity
subject column in data renamed to Subject
the numbers in the Subject column of the data dataframe are turned into absolute numbers to avoid negative subjects
All Freq in column’s name replaced by Frequency
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time
All Acceleromete in column’s name replaced by Accelerometer
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All tBody in column’s name replaced by TimeBody
All Mean or mean in column’s name replaced by Mean
All Std or std in column's name replaced by Std
All angle in column's name replaced by Angle
All gravit in column's name replaced by Gravity
All XGravityMean in column's name replaced by GravityMeanX
All YGravityMean in column's name replaced by GravityMeanY
All ZGravityMean in column's name replaced by GravityMeanZ
All dots removed from the column's name.

### Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
finaldata (180 rows, 88 columns) is created by sumarizing data taking the means of each variable for each activity and each subject, after groupped by subject and activity.
All unnecessary datasets are removed using rm() function, keeping only rawdata and finaldata.
Export the finaldata to the working directory in a txt file format.
