# subset: https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-extractOperator.md

library(datasets)
data(mtcars)

theCol<-"cyl"

mtcars[[theCol]]
mtcars[,theCol]
mtcars$cyl

head(mtcars[,1:3])
theCols<-c('mpg','cyl','disp')
head(mtcars[,theCols])

mtcars[20:22,]
head(mtcars[mtcars$cyl==4 & mtcars$am ==1,])
head(mtcars[mtcars[,"cyl"]==4,],)

test<-which(mtcars$cyl==4)
head(mtcars[test,])

?"["
1:10 %in% c(1,3,5,9)


