source("gbm_model.R")
source("adjust_for_dividend.R")

dcf_basic_setup <- function(P,T, principal){
# P is a matrix of parameter columns
# T is the horizon of the experiment in days

n <- length(P[1,])
js <- sample(n,60,replace=FALSE)
Ds <- P[2,]
gbms <- list()

for (i in 1:60){
 dat_gbm <- gbm_model(P[,js[i]],T)
 gbms[[i]] <- adjust_for_dividend(dat_gbm,P[2,js[i]],i)
}

# from here we can roughly replace this with the content of dcf_basic_iter

portfolio <- numeric(60)
pf_chart <- numeric(T)

# assign an equal amount of capital to each stock
for (i in 1:60){
 portfolio[i] <- (principal/60)/gbms[[i]][1]
}
pf_chart[1] <- principal

# on each day of the simulation horizon, collect the 
# dividend for that day and invest that money in the
# security paying a dividend on the next day
for (i in 2:T+1){
 payer <- (i-1)%%60
 if (payer == 0) {payer <- 60}
 payout <- gbms[[payer]][i] * Ds[js[payer]] * portfolio[payer]
 payee <- (i)%%60
 if (payee == 0) {payee <- 60}
 portfolio[payee] <- portfolio[payee] + payout/gbms[[payee]][i]
 
 # compute the present valuation of the portfolio and store it in pf_chart[i]
 value_now <- 0
 for (k in 1:60) { value_now <- value_now + portfolio[k]*gbms[[k]][i] }
 pf_chart[i] <- value_now
}

ts(pf_chart[3:T+1])

} 


