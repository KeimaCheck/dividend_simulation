ptrize <- function(ts, D){
# input is a time series and a number (a dividend)
# output is the tuple (S_0, D, mu, sigma)

n = length(ts)
pters <- numeric(4)
pters[1] <- ts[n]
pters[2] <- D/pters[1]			# dollar dividends tied to dividend yield

# obtain mu
lts <- log(ts)
xs <- 1:n
lr <- lm(lts~xs)
summary(lr)
mu <- coef(summary(lr))["xs", "Estimate"]
pters[3] <- mu

# obtain sigma
cdrs <- numeric(n-1)
for (i in 1:n-1){
    cdrs[i] = log(ts[i+1]/ts[i])
}
sigma <- sd(cdrs)
pters[4] <- sigma

pters
}