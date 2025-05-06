options(repos = c("https://cloud.r-project.org/"))
options(Ncpus = 4)

install.packages( "data.table",  dependencies= TRUE, lib="/home/$USER/.local/lib/R/site-library")
install.packages( "httr",  dependencies= TRUE, lib="/home/$USER/.local/lib/R/site-library")
install.packages( "devtools",  dependencies= TRUE, lib="/home/$USER/.local/lib/R/site-library")


library( "devtools" )
devtools::install_github("IRkernel/IRkernel")
devtools::install_github("krlmlr/ulimit")

quit( save="no" )