args <- commandArgs(trailingOnly=TRUE)

fecha <- format(Sys.time(), "%Y%m%d %H%M%S")
cat( fecha, file=args[1] )

quit( save="no" )