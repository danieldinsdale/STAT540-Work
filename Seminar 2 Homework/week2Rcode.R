n <- 1   #number of tests 
m <- 200 #number of trials
p <- 0.5 #probability of success
headPropFull <- NULL
for(m in 1:200){
  numHeads <- rbinom(, m, p)
  headProp <- numHeads/m
  headPropFull <- c(headPropFull, headProp)
}
plot(x=1:200, headPropFull, ylim=c(0,1), xlab="Number of Flips", ylab="Proportion of Heads")
abline(0.5,0, col="red")


#draw 100 samples for each n
meanFull <- NULL
medianFull <- NULL
IQRFull <- NULL
for(m in 1:200){
  headPropFull <- NULL
  numHeads <- rbinom(10, m, p)
  headProp <- numHeads/m
  headPropFull <- c(headPropFull, headProp)
  meanm <- mean(headPropFull)
  medianm <- median(headPropFull)
  IQRm <- IQR(headPropFull)
  meanFull <- c(meanFull, meanm)
  medianFull <- c(medianFull, medianm)
  IQRFull <- c(IQRFull, IQRm)
}

plot(x=1:200, meanFull, ylim=c(0,1), xlab="Number of Flips", ylab="Mean Number of Heads")
abline(0.5,0, col="red")

plot(x=1:200, medianFull, ylim=c(0,1), xlab="Number of Flips", ylab="Median Number of Heads")

plot(x=1:200, IQRFull, ylim=c(0,1), xlab="Number of Flips", ylab="IQR")
#####################################
library(lattice)
library(gridExtra)
p1 <- densityplot(rnorm(n=100, mean=500, sd=20))
p2 <- densityplot(rnorm(mean=500, sd=20, n=100))
p3 <- densityplot(rnorm(100, 500, 20))
p4 <- densityplot(rnorm(500, 20, 100))
grid.arrange(p1,p2, p3, p4,nrow = 2, ncol=2)

par(mfrow=c(1,1))
######################################
n <- 10000
sampleNorm <- rnorm(n, 100, 40)
pnorm(130, 100, 40)
sum(sampleNorm <= 130)/n
######################################
n <- 10000
sampleChi <- rchisq(n, 3)
pchisq(4, 3)
sum(sampleChi <= 4)/n
######################################
n <- 100
sampleChi <- rchisq(n, 3)
pchisq(4, 3)
sum(sampleChi <= 4)/n
######################################
n <- 10000
sampleChi <- rchisq(n, 3)
1-pchisq(2, 3)
sum(sampleChi >= 2)/n
######################################
n <- 10000
sampleChi <- rchisq(n, 3)
pchisq(5, 3)-pchisq(2, 3)
sum(sampleChi >= 2 & sampleChi <= 5)/n
