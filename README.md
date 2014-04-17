# Coursera Getting Data Assignemnt 4 #

__Important__ : This code assumes that all *.txt files from the data set are in the working directory, not in subdirectories.

This program works as follows:

- It checks if the input files are present and quits with an error if it is not the case
- It Loads the activity names, and assigns varname for a merge() later
- It load the 561 column names for the main datasets (train and test) and cleans them up
- It load activity label codes and assigns column names that are useful for a later join.
- It joins the training and test data for the data.frames build so far
- It Loads the Subject data
- It loads the one column subject data for test and train
- It merges the activity names with the activity code to get the clear names for the activities.
- It loads all measurement, assigning the colnames from earlier
- It append train and test set
- It selects only those colums that hold std and mean values, based on name, then add the activity and subject columns.
- It prepars the tidy dataset be selecting only mean, activity and subject, and writes it.
