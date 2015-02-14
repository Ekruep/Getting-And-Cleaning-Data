##Purpose of This Document

The purpose of this document is two-fold:
1. Describe the function of the R-script titled "run_analysis.R"
2. Provide the Code Book for the variables in the dataset analyzed by the "run_analysis.R" script

##The Function of "run_analysis.R"

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







##Code Book for Variables in the Dataset Analyzed by "run_analysis.R"

####Dataset Title:
Human Activity Recognition Using Smartphones Data Set

####Dataset Access:
Project Information - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
Dataset - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

####Data Set Description:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

####Attribute Information:
For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


####Citation Request:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
