x<-1
print(x)
x
msg<-"hello"

x<-11:300
x

y<-1 # it seems integer, but indeed include two decimal and call numeric
z<-1L # after adding L, the numeric change to integer
1/Inf #Inf: infinity
attributes(x)
attributes(y)


x<-c(0.5,0.6) #c:construct vector
x
x<-c(TRUE,FALSE)
x
x<-c(T,F) #T,F is abbrevation of true and false
x
x<-c("a","b","c")
x

x<-vector("numeric",length=10)  # vector can be used to construct empty vector
x

y<-c("a",F) # note!: vector must include the same class of object. Or coersion will occur

x<--5:6
class(x)
as.numeric(x) # as.*(function) : explicitly coerce from one class to another
as.logical(x)
x<-c("a","b","c")
as.numeric(x)

m<-matrix(nrow=3,ncol=2) #compared with vector, matrix are vectors with dimension attribute(#of row and columns)
m
dim(m)
attributes(m)

m<-matrix(1:6,nrow=2,ncol=3)
m

n<-1:30
n
dim(n)<-c(5,6) #matric can be created directly from vectors by adding dimension attributes
n

x<-1:3#matrix can be created by column binding or row binding
y<-4:6
cbind(x,y)
rbind(x,y)

#List is a specical vector which can contain different class of object
x<-list(1,"x",T,1+4i)
x

x<-vector("list",length=5)#construct an empty list
x

#factors are used to represent categorical data and can be ordered or unordered
x<-factor(c("yes","yes","no","yes","no"))
x
table(x)
unclass(x) #https://stackoverflow.com/questions/50121005/what-is-the-purpose-of-using-unclass-function-and-why-the-error-the-column

x<-factor(c("yes","yes","no","yes","no"))
x
x<-factor(c("yes","yes","no","yes","no"),levels=c("yes","no")) #change orders of levels of a factor
x

#NA:unknown;NaN:doesn't exist in mathmatical sense;NaN is NA but NA is not NaN
x<-c(1,2,NA,10,NaN)
is.na(x)
is.nan(x)

#dataframe:same as matrix but can store different class object and have specific column name/row name
x<-data.frame(foo=1:4,bar=c(T,F,F,F))
x
ncol(x)
nrow(x)

#names
x<-1:3
names(x)
names(x)<-c("Apple","banana","orange")
x
names(x)
#names for list
x<-list("a"=1,"b"=2,"c"=3)
x
names(x)
#names for matrix
m<-matrix(1:4,nrow=2,ncol=2)
m
dimnames(m)<-list(c("a","b"),c("c","d"))
m
#another way to assign name to matrix
colnames(m)<-c("q","w")
rownames(m)<-c("z","x")
m
#name for data frame
x<-data.frame(foo=1:4,bar=c(T,F,F,F))
x
ncol(x)
nrow(x)
names(x)<-c("a","b")
row.names(x)<-c("d","f","e","g")
x

?read.table

y<-data.frame(a=1,b="a")
dput(y) #dput create a descrptive representation of an R object and preserve metadata
dput(y,file = "y.R")
new.y<-dget("y.R")
new.y

x<-"foo"
y<-data.frame(a=1L,b="a")
dump(c("x","y"),file="data.R") #multiple objects can be deparsed at once using the dump function and read back in using source
rm(x,y)
source("data.R")
str(y)
x

#numeric data can be saved to file using save()(binary format)
a<-data.frame(x=rnorm(100),y=runif(100))
b<-c(3,4.4,1/3)
save(a,b,file="mydata.rda")
load("mydata.rda")

#reading from a url connection (pdf46)
con<-url("http://www.jhsph.edu","r")
x<-readLines(con)
head(x)

#subset a vector
x<-c("a","b","c","c","d","a")
x[1]
x[2]
x[1:3]
x[c(1,3,4)]
u<-x>"a"
u
x[u]
x[x>"b"]

#subset a matrix
x<-matrix(1:6,2,3)
x
x[1,2]
x[2,1]
x[2,]
x[1,3,drop=FALSE]
x[2,,drop=FALSE]

#subset a list
x<-list(foo=1:4,bar=0.6)
x
x[[1]]
x[["bar"]]
x$bar

#notice you dont need the quotes when you use $; the difference between $ and [[ is that $ can only be used with literal names
x<-list(foo=1:4,bar=0.6,baz="hello")
name<-"foo"
x[[name]]
x$name
x$foo

#subset nested elements of a list
x<-list(a=list(10,12,14),b=c(3.14,2.61))
x[[c(1,3)]]
x[[1]][[3]]

#extract multiple elements of a list
x<-list(foo=1:4,bar=0.5,baz="hello")
x[c(1,3)]

#remove NA(missing) values
x<-c(1,2,NA,NA,4,5)
y<-c("a","b",NA,NA,"e","d")
good<-complete.cases(x,y)
good
x[good]
y[good]

#vectorized operations (matrix)
x<-matrix(1:4,2,2)
y<-matrix(rep(10,4),2,2)
x*y
