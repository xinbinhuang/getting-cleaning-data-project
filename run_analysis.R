#
#
#  Script instructions
#      Set the "path" to be the location inside the "UCI HAR Dataset", and then you can
#      run through all the scripts. At the end, it will produce two tidy dataset "tidy.txt"
#      and "tidymean.txt" in the "tidy-dataset" folder.
# ------------------------------------------------------------------------------
# 
# What this script do:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.


# setting up package and environmennt
library(tidyverse)
library(stringr)

# set data path ***
path <- "./UCI HAR Dataset"

# load subject files
subject_train <- read_table2(file = file.path(path,"train","subject_train.txt"), col_names = FALSE)
subject_test <- read_table2(file = file.path(path,"test","subject_test.txt"), col_names = FALSE)

# load activity files
activity_train <- read_table2(file = file.path(path,"train", "y_train.txt"), col_names = FALSE)
activity_test <- read_table2(file = file.path(path,"test", "y_test.txt"), col_names = FALSE)

# load data files
data_train <- read_table2(file = file.path(path,"train", "X_train.txt"), col_names = FALSE)
data_test <- read_table2(file = file.path(path,"test", "X_test.txt"), col_names = FALSE)

## 1. Merges the training and the test sets to create one data set.
# merge all files to one data set
subject <- bind_rows(subject_train,subject_test)
activity <- bind_rows(activity_train,activity_test)
data <- bind_rows(data_train, data_test)
df <- bind_cols(subject, activity, data)
str(df)

# load features and activity lablels  
features <- read_table2(file = file.path(path,"features.txt"), col_names = FALSE)
features <- features %>% rename(featureslabel=X1, features_name=X2)

act_lab <- read_table2(file = file.path(path, "activity_labels.txt"), col_names = FALSE)
act_lab <- act_lab %>% rename(activitylabel = X1, activity = X2)

# assign column names to subject and activity label
df <- df %>% rename("subject"=X1, "activitylabel" = X1100 )

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Reading "features.txt" and extracting only the mean and standard deviation
featuresMeanSTd <- str_subset(features$features_name, "mean\\(\\)|std\\(\\)")
index <- which(features$features_name %in% featuresMeanSTd) 

# Taking only measurements for the mean and standard deviation
df<- df %>% select(1:2 , index+2) 

## 3. Uses descriptive activity names to name the activities in the data set

# Create column for activity names
df <- left_join(df, act_lab)

# Exclude the activity_nmu field    
df <- df %>% select(-2) %>% select(1, activity,everything())
df$activity <- str_to_lower(df$activity)
head(df)
str(df)

## 4. Appropriately labels the data set with descriptive variable names.
# subset the corresponding measurement variable names
measurements <- features$features_name[index]

# assign the measurement variable names to the data set
colnames(df)[3:length(colnames(df))] <- measurements
str(df)


## 5. Create tidy dataset from step 4
# calculate the average of each variable for each activity and each subject.
df_mean <- df %>% group_by(subject, activity) %>% summarise_if(is.numeric, mean)

# write out the data set
write.table(df,"./tidy-dataset/tidy.csv", row.name=FALSE)
write.table(df_mean,"./tidy-dataset/tidymean.csv", row.name=FALSE)


