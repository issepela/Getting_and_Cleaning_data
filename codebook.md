the script run_analysis.R does the following:

- load data from a local copy of https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into local variables:
    - xte: measured variables from test
    - xtr: measured variables from train
    - sttr: training subjects code  
    - stte: test subjects code
    - ytr: activity code training
    - yte: activity code test
    - act: activity labels
    - feat: variable names

- rename columns of the data sets
- create a vector i of all the  columns with the measurements on the mean and standard deviation
- assign descrition to activies joining the dataset of activiy code with data set of activity labels
- merge the dataset of measurements with activity code and labels and subject
	- train: dataset with measurements  and  labels  and subject for training
	- test: dataset with measurements  and  labels  and subject for test
	- tot: merge of test and train

- create a tidy data set with the average of each variable for each activity and each subject
 	- avg: average of each variable for each activity and each subject