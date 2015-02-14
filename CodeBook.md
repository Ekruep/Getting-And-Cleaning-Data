##Purpose of This Document

The purpose of this document is to provide the Code Book for the variables in the dataset analyzed by the "run_analysis.R" script

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


##Detailed Variable Descriptions


### activityId
numeric type variable

The six activity types are numbered 1 through 6 as follows: 
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


### subjectId
numeric type variable

Each subject (n=30) is numbered 1 through 30 for identification

### time body acc magnitude mean
numeric type variable

The time domain variable estimated body acceleration magnitude from the accelerometer - mean

### time body acc magnitude stddev
numeric type variable

The time domain variable estimated body acceleration magnitude from the accelerometer - standard deviation

### time gravity acc magnitude mean
numeric type variable

The time domain variable estimated gravity acceleration magnitude from the accelerometer - mean

### time gravity acc magnitude stddev
numeric type variable

The time domain variable estimated gravity acceleration magnitude from the accelerometer - standard deviation

### time body acc jerk magnitude mean
numeric type variable

The time domain variable estimated body acceleration jerk magnitude from the accelerometer - mean

### time body acc jerk magnitude stddev
numeric type variable

The time domain variable estimated body acceleration jerk magnitude from the accelerometer - standard deviation

### time body gyro magnitude mean
numeric type variable

The time domain body triaxial angular velocity magnitude from the gyroscope - mean

### time body gyro magnitude stddev
numeric type variable

The time domain body triaxial angular velocity magnitude from the gyroscope - standarrd deviation

### time body gyro jerk magnitude mean
numeric type variable

The time domain body triaxial angular velocity jerk magnitude from the gyroscope - mean

### time body gyro jerk magnitude stddev
numeric type variable

The time domain body triaxial angular velocity jerk magnitude from the gyroscope - standard deviation

### frequency body acc magnitude mean
numeric type variable

The frequency domain variable estimated body acceleration magnitude from the accelerometer - mean

### frequency body acc magnitude stddev
numeric type variable

The frequency domain variable estimated body acceleration magnitude from the accelerometer - standard deviation

### frequency body acc jerk magnitude mean
numeric type variable

The frequency domain variable estimated body acceleration jerk magnitude from the accelerometer - mean

### frequency body acc jerk magnitude stddev
numeric type variable

The frequency domain variable estimated body acceleration jerk magnitude from the accelerometer - standard deviation

### frequency body gyro magnitude mean
numeric type variable

The frequency domain body triaxial angular velocity magnitude from the gyroscope - mean

### frequency body gyro magnitude stddev
numeric type variable

The frequency domain body triaxial angular velocity magnitude from the gyroscope - standard deviation

### frequency body gyro jerk magnitude mean
numeric type variable

The frequency domain body triaxial angular velocity jerk magnitude from the gyroscope - mean

### frequency body gyro jerk magnitude stddev
numeric type variable

The frequency domain body triaxial angular velocity jerk magnitude from the gyroscope - standard deviation

### activityType
character type variable

6 classes include: 
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING