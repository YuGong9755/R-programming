# week3 test 
x<-runif(1,0,10)
if(x>3){
  y<-10
}else{
  y<-0
}
y

x<-runif(1,0,10)
y<-if(x>3){
  10
}else{
  0
}
y

for (i in 1:10){
  print(i)
}


x<-c('a','b','c','d')
for(i in 1:4){
  print(x[i])
}

#seq_along(x) generate a sequence/vector based on the length of 'x'
for (i in seq_along(x)){
  print(x[i])
}

#seq_len(x) generate a sequence/vector based on the value of 'x'
x <- matrix(1:6,2,3)
for (i in seq_len(nrow(x))){
  for (j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

count<-0 
while (count < 10){
  print(count)
  count<-count+1
}


#random walk
z<- 5 
set.seed(1)
while(z>=3 && z<=10){
  coin <-rbinom(1,1,0.5)
  if (coin == 1){
    z<-z+1
  }else{
    z<-z-1
  }
}
print(z)


f <-function(){
  
}
class(f)
f()

f <-function(){
  cat('hello world\n')
}
f()

f<-function(num){
  for (i in seq_len(num)){
    cat('hello world\n')
  }
}
f(4)

f<-function(num){
  for (i in seq_len(num)){
    cat('hello world\n')
  }
  chars<-nchar('hello world\n')*num
  chars
}
f(4)

f<-function(num=1){
  for (i in seq_len(num)){
    cat('hello world\n')
  }
}
f()
formals(f)

make.power <- function(n) {
  pow <- function(x) {
    x^n
    }
  pow
  }
cube<-make.power(3)
cube(3)
cube
ls(environment(cube))
get('n',environment(cube))
get('pow',environment(cube))

data

a<-c(FALSE,2)
b<-c(1,2)
b[!a]


#statistic inference

Negloglik<-function(data,fixed=c(FALSE,FALSE)){
  param<-fixed
  function(p){
    param[!fixed]<-p
    mu<-param[1]
    sigma<-param[2]
    a<- -(1/2)*length(data)*log(2*pi*sigma^2)
    b<- -(1/2)/(sigma^2)*sum((data-mu)^2)
    -(a+b)
  }
}

set.seed(1)
normals<-rnorm(100,1,2)
test1<-Negloglik(normals)
test1
ls(environment(test1))
optim(c(0,1),test1)$par


test2<-Negloglik(normals,c(FALSE,2))
test2
ls(environment(test2))
optimize(test2,c(-1,3))


test3<-Negloglik(normals,c(1,FALSE))
test3
ls(environment(test3))
optimize(test3,c(-0.001,3))

test4<-Negloglik(normals,c(1,FALSE))
x<-seq(1.7,2.4,len =100)
y<-sapply(x,test4)
plot(x,exp(-(y-min(y))))


x<-as.Date('1997-05-05')
x
class(x)

x<-Sys.time()
x
class(x)
p<-as.POSIXlt(x)
unclass(p)


x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x <- as.POSIXlt(x)
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 01:00:00", tz = "GMT")
y-x

