setwd("C:/Users/Rob/OneDrive/Coursera/03 Getting and Cleaning Data/project/repo/GettingAndCleaningDataCourseProject")



# ================================================================================
# INITIALIZATION:

if (!require("data.table", quietly=T)) install.packages("data.table")
if (!require("reshape2", quietly=T)) install.packages("reshape2")

library(data.table)
library(reshape2)


# Assert you are in the right folder and have the right data.
stopifnot(file.exists("data/test/X_test.txt"))
stopifnot(file.exists("data/train/X_train.txt"))
stopifnot(file.exists("data/activity_labels.txt"))
stopifnot(file.exists("data/test/y_test.txt"))
stopifnot(file.exists("data/train/y_train.txt"))
stopifnot(file.exists("data/test/subject_test.txt"))
stopifnot(file.exists("data/train/subject_train.txt"))



# ================================================================================
# REFERENCES
# reshape2 and melt
#   http://seananderson.ca/2013/10/19/reshape.html



# ================================================================================
# DEFINITIONS:
# An 'activity' is the name of any of the 561 columns.




# ================================================================================
# FUNCTIONS:

# Print function
p = function(...) { cat('-->', ..., '\n') }

# Quote function
q = function(s) { paste('"', s, '"', sep = '') }

# Read in a space-delimited table and display its dimensions
ReadTable = function(fn)
{
  p('Reading data set', q(fn))
  x = read.table(fn)  
  stopifnot(class(x)[1] == "data.frame") # assert
  p('  Dimensions', dim(x))  
  x
}

# Read a data set, select only specific columns, and rename them.
ReadData = function(fn, iCol, nCol)
{
  x = ReadTable(fn)
  
  # Extract only iCol columns and rename the columns using the activity names.
  x = x[,iCol]
  
  # Set the new column names
  colnames(x) = nCol
  x
}




# ================================================================================
# READ DATA:


# Read the activities to give us a table of (columnindex,columname) records.
# We will use these to select the mean and std columns.
d = ReadTable("data/features.txt")



# Select columnindex values where columnname contains "std" or "mean".
# NOTE: Activities containing "Mean" and not "mean" (e.g. "angle(tBodyAccMean,gravity)") were ignored
# with the assumption that an angle of a mean is not a mean.
iCol = d[grep("mean|std",d$V2),1] # index
nCol = d[grep("mean|std",d$V2),2] # name
#nCol = make.names(nCol, unique=T)


# Read the entire x testing table
xTest = ReadData("data/test/X_test.txt", iCol, nCol)


# Read the entire x training table
xTrain = ReadData("data/train/X_train.txt", iCol, nCol)


# Merge the two sets
p('Merging data sets')
x = rbind(xTest,xTrain)
p('  Dimensions', dim(x))


# Read the activity labels.
al = ReadTable("data/activity_labels.txt")
colnames(al) = c('activity', 'activityname')


# Read activity data; i.e. the single column tables with values in 1:6 each representing
# the different activities.
ad = rbind(
  ReadTable("data/test/y_test.txt"),
  ReadTable("data/train/y_train.txt"))
p('  Dimensions', dim(ad))
colnames(ad) = c('activity')

# Assert the number of rows in our merged x is the same as the number of rows in sd.
stopifnot(dim(x)[1] == dim(ad)[1])


# Read subject data; i.e. the single column tables with values in 1:30 each representing
# the different people performing the experiments.
sd = rbind(
  ReadTable("data/test/subject_test.txt"),
  ReadTable("data/train/subject_train.txt"))
p('  Dimensions', dim(sd))
colnames(sd) = c('subject')

# Assert the number of rows in our merged x is the same as the number of rows in sd.
stopifnot(dim(x)[1] == dim(sd)[1])


# Join the sd table
z = cbind(ad, x)
z = merge(al, z, by='activity',all=T)

# Join the subject data
z = cbind(sd, z)

setDT(z)
names(z)

r = melt(z, c('activity', 'activityname', 'subject'), na.rm=T)
r <- dcast(r, subject + activity + activityname ~ variable, mean)
fn = "tidy.txt"
write.table(r, fn)
p('Wrote tidy data to', q(fn))

length(unique(z[,z$activity+z$subject]))
z[,count(activity), by=c('activity','subject')]
