Just something I wrote when I should have been doing homework. "I wonder what happens if I take enough assumptions that this entire thing can be written in 20 minutes and then do just that."

objective: model a hypothetical fund owning a large number of dividend-paying 
securities and collecting dividends on a daily basis

original simulation

assumptions:
stock prices follow a geometric brownian motion almost surely,
	allowing for a discontinuous downward adjustment simultaneous with
	dividend payouts
constant volatility
exactly one dividend per day alternating through the sixty owned securities 
	during a 60-day trading "year" (actually closer to a fiscal quarter)
fractional shares, perfect liquidity, frictionless and zero-slippage market
dollar dividend remains constant for each security

initial parameters:
initial price, volatility, drift, and dividend sampled from a joint distribution chosen 
	to fit the S&P 500
simulation horizon

parameter mining process:
P1. grab S&P historical data
P2. reduce to closing price time series
P3. for each listing on the S&P, generate the 4-tuple
	(S_0, D, \sigma, \mu)
	where
	S_0 = most recent closing price
	D = most recent dividend
	\sigma = historical volatility
	\mu = drift (expected continuous rate of return)
P3a. calculating \sigma
	3a1. transform price time series to continuous daily return time series
	3a2. compute mean continuous daily return
	3a3. compute standard deviation of CDR time series
P3b. calculating \mu
	3a1. take the logarithm of price time series
	3a2. compute the slope of a best-fit line

simulation process:
setup phase (repeated for each monte carlo iteration)
S1. randomly select 60 sets of parameters for the 60 securities in the simulation
S2. assign the securities their parameters and choose a dividend order
S3. generate GBMs and adjust prices downward for each dividend'
S4. distribute initial payroll evenly among the securities
running phase (repeated for each monte carlo iteration)
R1. for each day of the simulation horizon
	compute the dividend
	reinvest the dividend evenly among all securities
computation phase (repeated for each monte carlo iteration)
C1. compute annualized return
C2. compute actual annual returns
evaluation phase (performed once)
E1. compute the average annualized return
E2. compute the average actual annualized returns