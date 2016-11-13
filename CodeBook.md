The `run_analysis.R` code does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Variables, Summaries, and any other relevant info:

1. `x_train`, `y_train`, `subject_train`, `x_test`, `y_test`, and `subject_test` contain data from the UCI HAR files.
2. `x_data`, `y_data` and `subject_data` merge the datasets.
3. `features` has the names for the `x_data` dataset, and they're the variable/column names applied to `featuresRequired`, a vector that extracts the desired data.
4. `activities` applies the activity names to `y_data`.
5. `combinedData` merges `x_data`, `y_data` and `subject_data`.
6. `averagesData` contains the mean and std dev averages, which are stored in a `averageData.txt`.  The `ddply()` package is used to calc the means.
