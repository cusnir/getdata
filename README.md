Getting and Cleaning Data: Course Project
=====================================
Course Participant: Andrei Cusnir (https://github.com/cusnir/getdata)

Description of the project
--------------------------

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
> The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
> You will be required to submit: 
>
> 1) a tidy data set as described below, 
> 2) a link to a Github repository with your script for performing the analysis, and 
> 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
>
> You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
> 
> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
> 
> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
> 
> Here are the data for the project: 
> 
> https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip 
> 
> You should create one R script called run_analysis.R that does the following. 
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
> 3. Uses descriptive activity names to name the activities in the data set.
> 4. Appropriately labels the data set with descriptive activity names.
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
> 
> Good luck!


What is provided
-------------------------------
* The R script `run_analysis.R` to run the analisys on data.
* Rmd script `run_analysis.Rmd` also can be run by KnitHtml from RStudio, it also does the analisys but also provides documentation about the script
* CodeBook.md describing tidy_data.txt variables.
* `run_analysis.Rmd` describing how the script works
* Under `data` directory there are two files:
    * Sample `tidy_data.txt` file containing the tidy data created per project description.
    * The data for the project  `UCI HAR Dataset.zip` 


How to use the script
-------------------------------

* Start RStudio or R Console app and open the R script `run_analysis.R`
* Change the parameter of the `setwd` function call to the working directory/folder (i.e., the folder where these the R script file is saved).
* Run the script by "Source"-ing the the script `run_analysis.R` in either RStudio or R Console app.

Output produced
----------------
* Tidy dataset file `tidy_dataset.txt` (space-delimited text).
* Documentation files: `run_analysis.html`, `CodeBook.html` 
