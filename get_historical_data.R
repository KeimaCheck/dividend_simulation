get_historical_data <- function(symbol){
# symbol is a ticker symbol
# outputs closing price time series for the corresponding security

earl <- paste("http://real-chart.finance.yahoo.com/table.csv?s=", symbol, sep = "")
dat_get <- read.csv(earl)

ts <- dat_get$Open

# because fuck how yahoo organizes their shit
ts <- rev(ts)
}

get_dividend <- function(symbol){
earl <- paste("http://real-chart.finance.yahoo.com/table.csv?s=", symbol, "&g=v", sep="")
dat_get <-read.csv(earl)

div <- dat_get$Dividends[1]

}