library(plyr)

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

y_test <- merge(y_test,activity_labels,by="V1")[-1]
y_train <- merge(y_train,activity_labels,by="V1")[-1]
test <- cbind(X_test,source="test",y_test,subject_test)
train <- cbind(X_train,source="train",y_train,subject_train)
fullset <- rbind(test,train)
names(fullset) <- features[,2]
names(fullset)[length(fullset)-2] <- "source"
names(fullset)[length(fullset)-1] <- "activity_type"
names(fullset)[length(fullset)] <- "subject"

partialset <- cbind(fullset[,grep("mean()|std()",features[,2])],fullset[,562:564])