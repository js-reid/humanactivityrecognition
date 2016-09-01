# Getting and Cleaning Data
## Course Project:  Human Activity Recognition
### by John Reid   

The goal of this project was to take [raw human activity data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from the Samsung Galaxy S smartphone and create a composed and tidy data set indicating averages of certain values broken out by subject and activity type.

The following steps were performed:
+ Data was obtained from the link above and saved into a local directory
+ Data was read into R using the read.table function.  The following files were read into R:  X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt, activity_labels.txt, and features.txt
+ The following manipulations were performed to consolidate the data:
  + The y_test and y_train sets were transformed from numeric values to text values using the merge function and the activity_labels set.
  + Full "test" and "train" sets were created by consolidating the X, y, and subject sets.  A source variable was also introduced to track the origin of each value.
  + The "test" and "train" sets were combined into a full set named (quite originally) "fullset".
  + Columns in "fullset" were renamed accordingly using the features set and some manual manipulation.
+ The data was subsetted to capture only columns containing "mean()" and "std()"
+ The data was further subsetted and summarized to create the end product:  a table broken out by subject and activity type containing an average for each mean and standard deviation value from the initial data set.
+ The data was written to a local file "HAR_means.txt"
