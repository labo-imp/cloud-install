options(repos = c("https://cloud.r-project.org/"))
options(Ncpus = 4)

install.packages("devtools" )
library( "devtools" )
devtools::install_github("IRkernel/IRkernel", force=TRUE)
library( "IRkernel" )
IRkernel::installspec()
quit( save="no" )
