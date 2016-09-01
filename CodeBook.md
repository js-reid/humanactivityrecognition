# Getting and Cleaning Data Course Project
## Code Book:  Human Activity Recognition by John Reid

The following transformation steps were performed:
+ Data was obtained from the link above and saved into a local directory
+ Data was read into R using the read.table function.  The following files were read into R:  
  + test set
    + X_test.txt
    + y_test.txt
    + subject_test.txt
  + train set
    + X_train.txt
    + y_train.txt
    + subject_train.txt
  + activity_labels.txt
  + features.txt
+ The following manipulations were performed to consolidate the data:
  + The y_test and y_train sets were transformed from numeric values to text values using the merge function and the activity_labels set.
  + Full "test" and "train" sets were created by consolidating the X, y, and subject sets.  A source variable was also introduced to track the origin of each value.
  + The "test" and "train" sets were combined into a full set named (quite originally) "fullset".
  + Columns in "fullset" were renamed accordingly using the features set and some manual manipulation.
+ The data was subsetted to capture only columns containing "mean()" and "std()"
+ The data was further subsetted and summarized to create the end product:  a table broken out by subject and activity type containing an average for each mean and standard deviation value from the initial data set.
+ The data was written to a local file "HAR_means.txt"

Beyond those created using the read.table command, which share names with their files of origin, the following variables are present in the run_analysis.R file:
+ train:  Intermediate data set containing a consolidated version of the "train" components as described above
+ test:  Intermediate data set containing a consolidated version of the "test" components as described above
+ fullset:  Intermediate data set comprised of the consolidated "train" and "test" tables
+ partialset:  This is "fullset", but subsetted to only capture columns containing a mean or standard deviation
+ HAR_means:  This is the final data set which is organized by subject and activity type.  Contains 40 distinct rows, each of which has 79 data entries averaged for the subject/activity.
