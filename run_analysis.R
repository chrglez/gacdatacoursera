url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp<-tempfile(fileext=".zip")
download.file(url,temp)
#Training data set
X_train<-read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"))
#Training activities
Y_train<-read.table(unz(temp,"UCI HAR Dataset/train/y_train.txt"))
#Test data set
X_test<-read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"))
#Test activities
Y_test<-read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))
#Subjects in training set
subjects_train<-read.table(unz(temp,"UCI HAR Dataset/train/subject_train.txt"))
#Subjects in test set
subjects_test<-read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"))
#Activities labels
activity_labels<-read.table("activity_labels.txt")
#Variables labels
features<-read.table("features.txt")
unlink(temp)

#STEP 1:
#Merges the training and the test sets to create one data set.
#Binding data set
ds<-rbind(X_train,X_test)
#Bindind activities
activities<-rbind(Y_train,Y_test)
#Binding subjects
subjects<-rbind(subjects_train,subjects_test)
#creating data frame
df<-cbind(ds,activities,subjects)

#STEP 2:
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Picking relevant variables
wmean<-grep("mean",features[,2])
wstd<-grep("std",features[,2])
picks<-sort(c(wmean,wstd))
#data frame with  the mean and standard deviation for each measurement
#Last two columns are encoded activities and subjects
tidyd<-df[,c(picks,562:563)]

#STEP 3:
#Uses descriptive activity names to name the activities in the data set
#Encodig (factor) activities
activities_char<-as.character(activity_labels$V2)
tidyd[,80]<- factor(activities$V1,labels=activities_char)

#STEP 4:
#Appropriately labels the data set with descriptive variable names. 
#Naming columns
labels<-as.character(features$V2[picks])
labels<-c(labels,"activities","subjects")
names(tidyd)<-labels

#STEP 5:
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#tidy has only 79 because we exclude subjects and activities
#Row names: activitiy.subject
#eg. 
tidy<-t(sapply(split(tidyd[,1:79],list(tidyd$activities,factor(tidyd$subjects))),colMeans))
tidy<-data.frame(tidy)