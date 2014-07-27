  #1. reading the features file
  features=read.table("./features.txt",header=FALSE)
  #2. reading the training data to x_train data frame
  x_train<-read.table("./train/X_train.txt",dec = ".",header=FALSE)
  #3. update column names from feature data frame
  for (i in 1:nrow(features)){
    names(x_train)[i]<-as.character(features[i,2])
  }
  #4. reading the activity id and activity description
  activity<-read.table("./activity_labels.txt",col.names=c("activity_id","activity_desc"),header=FALSE)
  #5. reading the activity ids correspnding to the training data frame
  y_train<-read.table("./train/y_train.txt",col.names=c("activity_id"),header=FALSE)
  #6. merge the activity id frame with activity labels on activity_id 
  y_train1<-merge(y_train, activity, by = "activity_id", all = TRUE)
  #7. bind the column of activity descrption to training data
  x_train1<-cbind(x_train, y_train1[,2])
  #8. update the column name as "activity"
  names(x_train1)[ncol(x_train1)]<-"activity"
  #9. reading subject train data into sub_train
  sub_train<-read.table("./train/subject_train.txt",header=FALSE)
  #10. bind subjects to training data
  x_train2<-cbind(x_train1, sub_train)
  #11 update the column name as "subject"  
  names(x_train2)[ncol(x_train2)]<-"subject"
  #12 reading test data to data frame
  x_test<-read.table("./test/X_test.txt",header=FALSE)
  #13. update column names using feature data frame
  for (i in 1:nrow(features)){
    names(x_test)[i]<-as.character(features[i,2])
  }
  #14.reading the activity id correspnding to the test data
  y_test<-read.table("./test/y_test.txt",col.names=c("activity_id"),header=FALSE)
  #15. reading the activity ids correspnding to the test data frame
  y_test1<-merge(y_test, activity, by = "activity_id", all = TRUE)
  #16. bind the column of activity descrption to test data
  x_test1<-cbind(x_test, y_test1[,2])
  #17. update the column name as "activity"
  names(x_test1)[ncol(x_test1)]<-"activity"
  #18. reding subject test data
  sub_test<-read.table("./test/subject_test.txt",header=FALSE)
  #19. bind subjects to test data
  x_test2<-cbind(x_test1, sub_test)
  #20 update the column name as "subject"  
  names(x_test2)[ncol(x_test2)]<-"subject"
  #21 remove unused data frames
  remove(activity)     
  remove(sub_test)
  remove(sub_train)
  remove(x_train)
  remove(x_train1)
  remove(y_train)
  remove(y_train1)

  remove(x_test)
  remove(x_test1)
  remove(y_test)
  remove(y_test1)

  #22. merge the two data frames (training and test) in "x_all" data frame
  x_all<-rbind(x_train2,x_test2)
  #23. remove unused data frames
  remove(x_test2)
  remove(x_train2)
  
  #24. create two lists with the column names for the x_all data frame
  #    Extracts only the measurements on the mean and standard deviation 
  #    for each measurement.
  names1<-c("subject","activity")
  listmean<-c()
  for (i in 1:ncol(x_all)){
    if (length(grep("mean()",names(x_all)[i],fixed=TRUE))>0){
        names1<-c(names1,names(x_all)[i])
        listmean <-c(listmean,names(x_all)[i])
    }
  
    if (length(grep("std()",names(x_all)[i],fixed=TRUE))>0){
        names1<-c(names1,names(x_all)[i])
        listmean <-c(listmean,names(x_all)[i])
    }
  }
  
  #25. select all the required columns in a new data frame
  x_new<-x_all[names1]
  #26. remove unused data frame
  remove(x_all)
  #27. create a new tidy data set with the average of 
  #    each variable for each activity and each subject.
  tidy_set<-aggregate(x_new[listmean], list(bysubject=x_new$subject,byactivity=x_new$activity), mean, na.rm=TRUE)
  #28. n1 (column names)
  n1<-names(tidy_set)
  #29. remove "-", "(",")"
  n1<-gsub("-","",n1,fixed=TRUE)
  n1<-gsub("(","",n1,fixed=TRUE)
  n1<-gsub(")","",n1,fixed=TRUE)
  #30. make all letters lowecase
  n1<-tolower(n1)
  #31 update data frame columns
  names(tidy_set)<-n1
  #32. create the file from tidy_set data frame
  write.table(tidy_set,file="tidy_data.txt",col.names=TRUE,sep = " ")
  #33. remove unused data frames and variables
  remove(features)
  remove(x_new)
  remove(listmean)
  remove(n1)
  remove(names1)
