# Getting and Cleaning Data Project

Xinbin Huang

### Project Introduction
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Description of the DATA
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to indicate frequency domain signals).

##### Description of abbreviations of measurements

1. leading t or f is based on time or frequency measurements.
2. Body = related to body movement.
2. Gravity = acceleration of gravity
2. Acc = accelerometer measurement
2. Gyro = gyroscopic measurements
2. Jerk = sudden movement acceleration
2. Mag = magnitude of movement
2. mean and SD are calculated for each subject for each activity for each mean and SD measurements.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

These signals were used to estimate variables of the feature vector for each pattern:
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.

-  tBodyAcc-XYZ
-  tGravityAcc-XYZ
-  tBodyAccJerk-XYZ
-  tBodyGyro-XYZ
-  tBodyGyroJerk-XYZ
-  tBodyAccMag
-  tGravityAccMag
-  tBodyAccJerkMag
-  tBodyGyroMag
-  tBodyGyroJerkMag
-  fBodyAcc-XYZ
-  fBodyAccJerk-XYZ
-  fBodyGyro-XYZ
-  fBodyAccMag
-  fBodyAccJerkMag
-  fBodyGyroMag
-  fBodyGyroJerkMag

##### The set of variables that were estimated from these signals are:

- __mean()__: Mean value
- __std()__: Standard deviation


### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### Section 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

- Assign column names and merge to create one data set.

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement.
- Create a index vector that is used to subset the subject, activitylabel, mean and standard deviation columns.

- Subset this data to keep only the necessary columns.

## Section 3. Use descriptive activity names to name the activities in the data set
- Merge data subset with the activity-label table to include the descriptive activity names

## Section 4. Appropriately label the data set with descriptive activity names.
- Label the data with descriptive activity names according to the `features-info.txt` file.

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
- Create a second, independent tidy data set with the average of each variable for each activity and each subject.

- Output the original tidy dataset at step 4, `tidy.txt` and the tidy dataset at step 5 `tidymean.txt` into the `tidy-dataset` folder.  
