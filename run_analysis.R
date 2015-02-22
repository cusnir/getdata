setwd("~/projects/CourseraProgramming/DataScience/getdata/CourseProject")
# download data function
download_data <- function(url, file){
    file_path <- paste("./data", file, sep = "/")
    if (!file.exists(file_path)) {
        download.file(url, destfile = file_path, method = "curl")
    }
}
# create data folder if it does not exist
if (!file.exists("data")) {
    dir.create("data")
}
# providing url from which to load the dataset zip file
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip"
# download the dataset
download_data(dataset_url, "UCI HAR Dataset.zip")
data_dir <- "./data/UCI HAR Dataset"
# unzip the dataset
unzip("./data/UCI HAR Dataset.zip", exdir = "./data")
# get file path based on type: test or training and what data it holds
# if no type is provided it means to return path for a features.txt file for example
fpath <- function(file, type){
    if(type == ""){
        paste(data_dir, paste(file, "txt", sep = "."), sep = "/")
    }else{
        paste(data_dir, type, paste(file, "_", type, ".txt", sep = ""), sep = "/")
    }
    
}
# create full folder inside our dataset dir 
# to hold full data set if it does not exist
if (!file.exists(paste(data_dir, "full", sep = "/"))) {
    dir.create(paste(data_dir, "full", sep = "/"))
}
# simplest way to merge test and train data is by 
# copy test file to full file location then 
# in a second operation append the train data on same file
# it is more like system command 
# cat test_file train_file > full_file
merge_data_on <- function(file){
    # will use overwrite = T option so that 
    # on a second run we have a clean file to work with
    file.copy(fpath(file ,"test"), fpath(file, "full"), overwrite = T)
    file.append(fpath(file ,"full"), fpath(file, "train"))
}
# create a merged set from test and train, consisting of:
# X_full.txt, y_full.txt, subject.txt
merge_data_on("X")
merge_data_on("y")
merge_data_on("subject")
# read full sets for X_full.xtx and y_full.txt
X_full <- read.table(fpath("X", "full"), numerals = "no.loss")
y_full <- read.table(fpath("y", "full"))
subject_full <- read.table(fpath("subject", "full"))
# 2. Extract the measurements on the mean and standard deviation for each measurement.
# reading features.txt to get the list with Features so that we can choose 
# the means and standard deviations for each measurement
features <- read.table(fpath("features", ""), stringsAsFactors = F)
colnames(features) <- c("nr", "name")
colnames(X_full) <- features$name
colnames(y_full) <- "activity"
colnames(subject_full) <- "subject_id"
#1. merge these data in one big data frame
full_data <- cbind(subject_full, y_full, X_full)
# 2. Extract only the measurements on the mean and standard deviation for each measurement
# create an integer vector with cols for means and standard deviations
library(plyr)
full_data <- arrange(full_data, subject_id)
mean_std_features <- grep("mean|std", features$name)
# extract mean and std data from X_full measurement dataset, 
# because features does not account for subject and activity type
# and cbind it with subject and activities
mean_std_data <- cbind(subject_full, y_full, X_full[, mean_std_features])
# writing on disk only for testing purposes
#write.table(mean_std_data, "./data/mean_std_data.txt", quote = F, row.name=FALSE)
#3) Use descriptive activity names to name the activities in the data set
activity_labels <- read.table(fpath("activity_labels", ""))
#4) Appropriately label the data set with descriptive variable names. 
full_data$activity <- factor(full_data$activity, levels=activity_labels$V1, labels=activity_labels$V2)
#5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidy_data <- ddply(mean_std_data, .(subject_id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(tidy_data)[-c(1:2)] <- paste("mean_", colnames(tidy_data)[-c(1:2)], sep="")
# save the results on disk
write.table(tidy_data, "./data/tidy_data.txt", quote = F, row.name=FALSE)
# just a test to see the tidy_data.txt file contains correct data
m_s_a <- full_data[(full_data$subject_id == 1 & full_data$activity == "WALKING"),][[3]]
mean(m_s_a)
