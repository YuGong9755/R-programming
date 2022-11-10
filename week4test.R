x<- list(a = 1:5, b = rnorm(10))
lapply(x,mean)

x<-1:4
lapply(x,runif)

x<-1:4
lapply(x,runif,min=2, max=5) #any ... will be passed to function (here is runif)

x<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
lapply(x,function(elt){elt[,1]}) #anonymous function 

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
sapply(x, mean)

x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
split(x,f)
lapply(split(x,f),mean)

library(datasets)
head(airquality)
s<-split(airquality,airquality$Month)
str(s)
lapply(s,function(x){
    colMeans(x[,c("Ozone", "Solar.R", "Wind")])
})
sapply(s,function(x){
    colMeans(x[,c("Ozone", "Solar.R", "Wind")])
})

sapply(s,function(x){
    colMeans(x[,c("Ozone", "Solar.R", "Wind")],na.rm=TRUE)
})


x<-rnorm(10)
f1<-gl(2,5)
f2<-gl(5,2)
interaction(f1,f2)
str(split(x,list(f1,f2)))
str(split(x,list(f1,f2),drop=TRUE))

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, mean,simplify=FALSE)
tapply(x, f, range)


x <- matrix(rnorm(200), 20, 10)
apply(x,2,mean)
apply(x,1,sum)
apply(x,1,quantile,probs = c(0.25,0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)

mapply(rep, 1:4, 4:1)

sumsq <- function(mu, sigma, x) {
    sum(((x - mu) / sigma)^2)
}
set.seed(10)
x <- rnorm(100)
mapply(sumsq, 1:10, 1:10,MoreArgs = list(x))
vsumsq <- Vectorize(sumsq, c("mu", "sigma"))
vsumsq(1:10, 1:10, x)



printmessage <- function(x) {
    if(x > 0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)
    }

printmessage(NA)

lm(y ~ x)
traceback()

debug(lm)
lm(y~x)
undebug(lm)
