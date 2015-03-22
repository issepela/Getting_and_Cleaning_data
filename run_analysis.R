run_analysis<-function() {
    library(plyr)
    
    ##upload files
    xte<-read.table("UCI HAR Dataset//test//X_test.txt")
    xtr<-read.table("UCI HAR Dataset//train//X_train.txt")
    sttr<-read.table("UCI HAR Dataset//train//subject_train.txt")
    stte<-read.table("UCI HAR Dataset//test//subject_test.txt")
    ytr<-read.table("UCI HAR Dataset//train//y_train.txt")
    yte<-read.table("UCI HAR Dataset//test//y_test.txt")
    act<-read.table("UCI HAR Dataset//activity_labels.txt")
    feat<-read.table("UCI HAR Dataset//features.txt")
    act<-read.table("UCI HAR Dataset//activity_labels.txt")
    
    ##rename columns
    names(xtr)<-feat[,2]
    names(xte)<-feat[,2]
    names(stte)<-c("subject")
    names(sttr)<-c("subject")
    names(ytr)<-c("test")
    names(yte)<-c("test")
    names(act)<-c("test","test_desc")

    ##select columns with mean and std
    a<-1:6
    b<-41:46
    c<-81:86
    d<-121:126
    e<-161:166
    f<-266:271
    g<-345:350
    h<-424:429
    i<-c(a,b,c,d,e,201,202,215,216,227,228,240,241,f,g,h,503,504,529,530)
    
    ##Assign descritpion to activ
    ytr<-join(ytr,act,type="left")
    yte<-join(yte,act,type="left")
    
    ##Merges the training and the test sets to create one data set
    train<-cbind(sttr,ytr,xtr[,i])
    test<-cbind(stte,yte,xte[,i])
    tot<-rbind(test,train)

    ##create t tidy data set with the average of each variable for each activity and each subject
    avg<-aggregate(tot[4:63],list(activity=tot$test_desc,subject=tot$subject),mean)
    
    
}