library(dplyr)

# read in all applicable files from the UCI HAR Dataset
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# begin to merge the files into a single data set
## these replace the numeric labels in the "y" sets with text
y_test <- merge(y_test,activity_labels,by="V1")[-1]
y_train <- merge(y_train,activity_labels,by="V1")[-1]
## consolidate the X, y, and subject sets into test/train sets
test <- cbind(X_test,source="test",y_test,subject_test)
train <- cbind(X_train,source="train",y_train,subject_train)
## create a full set using the test and train sets
fullset <- rbind(test,train)
## rename the columns in the "fullset" item to make sense
names(fullset) <- features[,2]
names(fullset)[length(fullset)-2] <- "source"
names(fullset)[length(fullset)-1] <- "activity_type"
names(fullset)[length(fullset)] <- "subject"

# create a subset by parsing out all columns containing "mean" or "std"
partialset <- cbind(fullset[,grep("mean()|std()",features[,2])],fullset[,562:564])

# further subset the data, breaking out by subject and activity type
# create a mean of each column from the prior subset
HAR_means <- suppressWarnings(partialset %>% group_by(subject,activity_type) %>% summarise_each(funs(mean)))
## strip out the now-unnecessary "source" column
HAR_means <- subset(HAR_means, select = -source)

# write the table to a local file
write.table(HAR_means,file="HAR_means.txt")