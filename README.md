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


