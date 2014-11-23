gacdatacoursera
===============

Getting and Cleaning Data Coursera
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
I have created one R script called run_analysis.R that does the following. 

#STEP 1. Merges the training and the test sets to create one data set.
This data set is 'df'. A 10299x563 data frame.
For each record it is provided:
- A 561-feature vector with time and frequency domain variables.
- Its activity label. 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
- An identifier of the subject who carried out the experiment. (30 subjects)

#STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
We obtein 'tidyd'. A 10299x68 data frame
For each record it is provided:
- A 66-feature vector with the mean and standard deviation for each measurement.
- Its activity label. 
- An identifier of the subject who carried out the experiment. (30 subjects)

#STEP 3. Uses descriptive activity names to name the activities in the data set
The 80th column of the 'tidyd' data frame has been encoded.
The labels included in "activity_labels.txt" file have been used.

#STEP 4. Appropriately labels the data set with descriptive variable names. 
The labels included in "features.txt" file have been used.

#STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
We obtein 'tidy'. A 180x66 data frame
For each record it is provided:
- A 79-feature vector with the mean and standard deviation for each measurement.
The row name contains the activity label an the identifier of the subject who carried out the experiment.

First six rows represent the average of each variable for the six activities for the first subject. Next six rows the the average of each variable for the six activities for the second subject.
6 activities *30 subjects = 180 rows

Explanations of the variable's names (CodeBook)
t: Measured in time.
f: Measured in frequency.
-BodyAcc- Body acceleration.
-GarvityAcc- Gravity acceleration.
-BodyGiro- Body giroscope.
-Jerk- Jerk signals (there are not Jerk signals for Gravity acceleration)
-Mag- Euclidean norm
-X- Measured of the X axe
-Y- Measured of the Y axe
-Z- Measured of the Z axe
-mean() mean of the times or frequency
-std() mean of the times or frequency

