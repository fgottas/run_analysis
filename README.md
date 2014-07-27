run_analysis
============

Getting and Cleaning Data - run analysis

#1. reading the features.txt file into features data frame
#2. reading the training data into x_train data frame
#3. update column names from feature data frame
#4. reading the activity id and activity description
#5. reading the activity ids correspnding to the training data frame
#6. merge the activity id frame with activity labels on activity_id 
#7. bind the column of activity descrption to training data
#8. update the column name as "activity"
#9. reading subject train data into sub_train data set
#10. bind subjects to training data
#11 update the column name as "subject"  
#12 reading test data to data frame
#13. update column names using feature data frame
#14.reading the activity id correspnding to the test data
#15. reading the activity ids correspnding to the test data frame
#16. bind the column of activity descrption to test data
#17. update the column name as "activity"
#18. reding subject test data
#19. bind subjects to test data
#20 update the column name as "subject"  
#21 remove unused data frames
#22. merge the two data frames (training and test) in "x_all" data frame
#23. remove unused data frames
#24. create two lists with the column names for the x_all data frame
#    Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
#25. select all the required columns in a new data frame
#26. remove unused data frame
#27. create a new tidy data set with the average of 
#    each variable for each activity and each subject.
#28. n1 (column names)
#29. remove "-", "(",")"
#30. make all letters lowecase
#31 update data frame columns
#32. create the file from tidy_set data frame
#33. remove unused data frames and variables
