#sp500_ts_list
if (!("sp500_ptrized" %in% ls())){
load("sp500_ptrized.saved")		
}


S_0s <- sp500_ptrized[1,]
Ds <- sp500_ptrized[2,]
mus <- sp500_ptrized[3,]
sigmas <- sp500_ptrized[4,]