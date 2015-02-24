dcf_basic_mc <- function(itertions, P, T, principal){
 charts <- vector(mode="list",
itertions)
 for (i in 1:itertions){
  charts[[i]] <- dcf_basic_setup(P,T,principal)
 }


 charts
}