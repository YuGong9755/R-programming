# tutorial: https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-breakingDownMakeVector.md
# tutorial: https://www.coursera.org/learn/r-programming/discussions/forums/_ZerTCj2EeaZ8Apto8QB_w/threads/mowodw4rEemS0Q4U5mc4kg
# tutorial https://www.coursera.org/learn/r-programming/discussions/forums/_ZerTCj2EeaZ8Apto8QB_w/threads/n_UhPw4tEembrRJ2GRXQmA
# https://www.coursera.org/learn/r-programming/discussions/forums/_ZerTCj2EeaZ8Apto8QB_w/threads/ePlO1eMdEeahzg7_4P4Vvg




makeVector <- function(x=numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}


cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}


aVector <- makeVector(1:10)
aVector$get()
aVector$getmean()
cachemean(aVector)
aVector$set(30:50)
cachemean(aVector)
aVector$getmean()
aVector <- makeVector()
aVector$get()
aVector$getmean()
cachemean(aVector)
