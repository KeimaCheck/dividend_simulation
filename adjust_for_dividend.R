adjust_for_dividend <-function(proc, D, dt){

n <-length(proc)
dat_gbm <- proc
counter<-dt
while (counter < n){
  for (i in counter:n){
    dat_gbm[i] <- dat_gbm[i] - D*dat_gbm[counter]
  }
  counter <- counter + 60
}

dat_gbm
}