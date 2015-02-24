#sp500_ts_list
if (!("sp500_ts_list" %in% ls())){
load("sp500_ts_list.saved")		
}
#sp500_div_list
if (! ("sp_div_list" %in% ls())){
load("sp500_div_list.saved")
}

#reload required scripts
source("ptrize.R")

n <- length(sp500_ts_list)
if (n!= length(sp500_div_list)){
 stop("Data misformatted. Please attempt to reload it")
}

sp500_ptrized <- matrix(ptrize(sp500_ts_list[[1]],sp500_div_list[1]))

for (i in 2:n){
 if( !is.null(sp500_ts_list[[i]]) & !is.na(sp500_div_list[i])){
   if( !(sp500_div_list[i] ==0)){
   if( !(tail(sp500_ts_list[[i]],n=1) >5000)){
    a <- ptrize(sp500_ts_list[[i]],sp500_div_list[i])
    sp500_ptrized <- cbind(sp500_ptrized,a)
   }
  }
 }
}

rm(a,i,n)
save(sp500_ptrized, file="sp500_ptrized.saved")