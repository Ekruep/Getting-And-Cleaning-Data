##Purpose of This Document

The purpose of this document is to describe the function of the R-script titled "run_analysis.R"

### Summary
In brief, the "run_analysis.R" script was written to analyze human performance data. The Human Activity Recognition database contains recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The data are provided across multiple files. As such, the "run_analysis.R" script is written to accomplish the following:
1. Merge training and test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Details

#### Prep work
Key preparatory steps include the following:
1. Download the data file from this link - fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Unzip the file to your local working directory
3. Set your working directory in R
4. Load the plyr package in R

#### STEP 1. Merge training and test sets to create one data set
* Set the source directory for the files
* Get training data ready
** Read into tables the training data (X_train.txt, y_train.txt)
** Read into tables the features data (features.txt)
** Read into a table activity label data (activity_labels.txt)
** Read into a table the subject training data (subject_train.txt)
* Assign column names to the training data imported
* Merge these created tables into a single training dataset

* Get test data ready
** Read into tables the test data (X_test.txt, y_test.txt)
** Read into a table the subject test data (subject_test.txt)
* Assign column names to the test data imported
* Merge these created tables into a single test dataset

* Merge the training and test datasets into a single dataset ready for the next steps



#### STEP 2. Extract only the measurements on the mean and standard deviation for each measurement
* Create a vector for the column names from the final dataset from STEP 1 to be able to select among the column names
* Create a logical vector to pull together the desired columns (TRUE for the ID, mean() & stddev() columns and FALSE for all others)
* Subset training-test table based on the logical vector to keep only desired columns

#### STEP 3. Use descriptive activity names to name the activities in the data set
* Merge the final dataset from STEP 2 with the activity type table (created from the activity_labels.txt data) to include descriptive activity names

#### STEP 4. Appropriately label the data set with descriptive variable names
* Update the column names vector to include the new column names after merge
* View the column names in the merged final dataset from STEP 3 as they are in the table to understand what should change to be more descriptive
* Utilize the gsub function within a "for" loop to convert all text in column names to more descriptive labels
* Reassign the new descriptive column names to the dataset


#### STEP 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
* Create a new table, without the activity type column
* Aggregate the final dataset table to include just the mean of each variable for each activity and each subject
* Merge the final dataset with activity type to include descriptive activity names
* Export the dataset







