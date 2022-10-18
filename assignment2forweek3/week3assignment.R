getwd()
setwd("D:/Smith/R_coursera/R for programming/R-programming/assignment2forweek3")

pollutantmean<-function(directory,pollutant,id=1:332){
    file_list<-list.files(directory,full.names = TRUE)
    dat<-data.frame()
    for(i in seq_along(file_list)){
        dat<-rbind(dat,read.csv(file_list[i]))
    }
    test<-dat[dat$ID %in% id,pollutant]
    mean(test,na.rm=TRUE)
}

pollutantmean("specdata","nitrate")

complete<-function(directory,id=1:332){
    file_list<-list.files(directory,full.names = TRUE)
    dat<-data.frame()
    for(i in seq_along(file_list)){
        dat<-rbind(dat,read.csv(file_list[i]))
    }
    COUNT<-numeric(length(id))
    next_entry<-1
    for (m in id){
        test<-dat[dat$ID == m,]
        for (j in seq_len(nrow(test))){
            if (is.na(test[j,'sulfate'])==FALSE & is.na(test[j,'nitrate'])==FALSE){
                COUNT[next_entry]<-COUNT[next_entry]+1
            }
        }
        print(COUNT)
        next_entry<-next_entry+1 
    }
    Report<-data.frame(ID=id,Nobs=COUNT)
    Report
}
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "Nobs"])

corr<-function(directory,threshold = 0){
    file_list<-list.files(directory,full.names = TRUE)
    dat<-data.frame()
    for(i in seq_along(file_list)){
        dat<-rbind(dat,read.csv(file_list[i]))
    }
    Corr<-numeric(332)
    COUNT<-numeric(332)
    next_entry<-1
    for (i in 1:332){
        test<-dat[dat$ID == i,]
        for (j in seq_len(nrow(test))){
            if (is.na(test[j,'sulfate'])==FALSE & is.na(test[j,'nitrate'])==FALSE){
                COUNT[next_entry]<-COUNT[next_entry]+1
            }
        }
        if (COUNT[next_entry] > threshold){
            Corr[next_entry]<-cor(test$sulfate,test$nitrate,use = "pairwise.complete.obs")
        }
        next_entry<-next_entry+1 
    }
    final<-Corr[!(Corr==0)]
}
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
