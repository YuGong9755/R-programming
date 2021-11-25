myfunction <-function(){
  x<- rnorm(100)
  mean(x)
}
myfunction()

second <- function(x){
  x + rnorm(length(x))
}
second(5)
second(5:10)