# Getting and Cleaning Data 
Coursera Course Project

# run_analysis.R
This script:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Data
The data (located in the data folder) was obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Usage
* Choose a working  folder; e.g. C:/temp
* git clone https://github.com/RobHowardCoursera/GettingAndCleaningDataCourseProject.git
* cd C:/temp/GettingAndCleaningDataCourseProject
* Unzip the dataset to get folder C:/temp/GettingAndCleaningDataCourseProject/UCI HAR Dataset
  * e.g. you should have file C:/temp/GettingAndCleaningDataCourseProject/UCI HAR Dataset/activity_labels.txt
* Run the script. In Windows, this might be done as follows:

```"C:\Program Files\R\R-3.1.3\bin\Rscript.exe" run_analysis.R```

* The output should show:

```
--> Reading data set "UCI HAR Dataset/features.txt"
-->   Dimensions 561 2
--> Reading data set "UCI HAR Dataset/test/X_test.txt"
-->   Dimensions 2947 561
--> Reading data set "UCI HAR Dataset/train/X_train.txt"
-->   Dimensions 7352 561
--> Merging data sets
-->   Dimensions 10299 79
--> Reading data set "UCI HAR Dataset/activity_labels.txt"
-->   Dimensions 6 2
--> Reading data set "UCI HAR Dataset/test/y_test.txt"
-->   Dimensions 2947 1
--> Reading data set "UCI HAR Dataset/train/y_train.txt"
-->   Dimensions 7352 1
-->   Dimensions 10299 1
--> Reading data set "UCI HAR Dataset/test/subject_test.txt"
-->   Dimensions 2947 1
--> Reading data set "UCI HAR Dataset/train/subject_train.txt"
-->   Dimensions 7352 1
-->   Dimensions 10299 1
--> Wrote tidy data to "tidy.txt"
```
