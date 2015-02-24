dcf_basic_iter <-function(stocks,principal,horizon){
# performs one full iteration of the basic simulation

n<-length(stocks)
portfolio <- numeric(n)
pf_chart <- numeric(horizon)

# assign an equal amount of capital to each stock
for (i in 1:n){
 portfolio[i] <- (principal/n)/stocks[[i]][1]
}

# on each day of the simulation horizon, collect the 
# dividend for that day and invest that money in the
# security paying a dividend on the next day
for (i in 1:horizon){
 payer <- i%n
 payout <- stocks[[payer]][i] * # need to find a way to get the dividend for this stock here
 payee <- (i+1)%n
 portfolio[payee] <- portfolio[payee] + payout/stocks[[payee]][i]
 
 # compute the present valuation of the portfolio and store it in pf_chart[i]

}
}