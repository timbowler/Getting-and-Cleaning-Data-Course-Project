library(plyr)

# 1: merge training and test datasets
#####################################

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# create X, Y, Subject datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# 2: extract mean, std dev features
###################################

features <- read.table("features.txt")

# get column variables with 'mean' or 'std' in col names
featuresRequired <- grep(".*mean.*|.*std.*", features[, 2])

# get subset of desired column variables
x_data <- x_data[, featuresRequired]

# insert column variable names
names(x_data) <- features[featuresRequired, 2]

# 3: use descriptive activity names as names in the dataset
###########################################################

activities <- read.table("activity_labels.txt")

# update Y dataset with activity names and column variable name
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

# 4: Label dataset with descriptive column variable names and merge
###################################################################

names(subject_data) <- "subject"
combinedData <- cbind(x_data, y_data, subject_data)

# 5: create independent tidy dataset with average of each variable for
#    each activity and subject
######################################################################

averageData <- ddply(combinedData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averageData, "averageData.txt", row.names = FALSE)
