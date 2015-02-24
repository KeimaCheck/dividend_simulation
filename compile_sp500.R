# initialize functions
source("get_historical_data.R")


# load inputs
sp500_symbol_list <- scan("sp500_symbol_list.csv", what = "character")

# produce a list of vectors, each vector being a price time series


quope <- "Grabbing"
n <- length(sp500_symbol_list)
sp500_ts_list <- vector(mode="list", length=n)
sp500_div_list <- numeric(n)
for (i in 1:n) {
	print(paste(quope,sp500_symbol_list[i],sep=" "))

	tryCatch({
	  sp500_ts_list[[i]] <- get_historical_data(sp500_symbol_list[i])},
	  warning = function(war) { print(war) },
	  error = function(err) {
          print("Failed most recent grab. Skipping that symbol.")
	    print(err)},
	  finally = {}
	)
	
	print(paste(quope,sp500_symbol_list[i],"dividend",sep=" "))
	
	tryCatch({
	  sp500_div_list[i] <- get_dividend(sp500_symbol_list[i])},
	  warning = function(war) { print(war) },
	  error = function(err) {
	    print("Failed most recent dividend grab. Skipping that symbol.")
	    print(err)},
        finally = {}
	)

}

save(sp500_ts_list, file = "sp500_ts_list.saved")
save(sp500_div_list, file = "sp500_div_list.saved")