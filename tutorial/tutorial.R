# https://github.com/derekfranks/practice_assignment/blob/master/practice_assignment.rmd

getwd()
setwd("D:/Smith/R_coursera/R for programming/R-programming/tutorial")

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")


list.files('diet_data')
andy<-read.csv('diet_data/Andy.csv')
head(andy)

length(andy$Day)
dim(andy)

str(andy)
summary(andy)
names(andy)


andy[1,"Weight"]
andy[30,"Weight"]

andy[which(andy$Day==30),"Weight"]
andy[which(andy[,'Day']==30),"Weight"]
subset(andy$Weight,andy$Day==30)

andy_start<-andy[1,"Weight"]
andy_end<-andy[30,"Weight"]
andy_loss<-andy_start-andy_end
andy_loss

files<-list.files("diet_data")
files
files[1:4]

files_full<-list.files('diet_data',full.names=TRUE)
files_full

head(read.csv(files_full[3]))
andy_david<-rbind(andy,read.csv(files_full[2]))
head(andy_david)
tail(andy_david)

day_25<-andy_david[which(andy_david$Day==25),]
day_25

dat<-data.frame()
for (i in 1:5){
  dat<-rbind(dat,read.csv(files_full[i]))
}

str(dat)
median(dat$Weight,na.rm=TRUE)
day_30<-dat[which(dat$Day==30),]
day_30

median(day_30$Weight)

weightmedian<-function(directory,day){
  file_list<-list.files(directory,full.names = TRUE)
  dat<-data.frame()
  for (i in seq_along(file_list)){
    dat<-rbind(dat,read.csv(file_list[i]))
    }
  day_i<-dat[which(dat$Day==day),]
  median(day_i$Weight,na.rm = TRUE)
}

weightmedian('diet_data',day=4)



