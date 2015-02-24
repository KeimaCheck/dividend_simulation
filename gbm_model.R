gbm_model <- function(params,t){
# returns a time series modeling a stock with parameters
S_0 = params[1]
mu = params[3]
sig = params[4]
# and running for t days

dat_ts = GBM(S_0,r=mu,sigma=sig,T=t,N=t)

}