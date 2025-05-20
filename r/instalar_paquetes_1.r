options(repos = c("https://cloud.r-project.org/"))
options(Ncpus = 4)

install.packages( "data.table",  dependencies= TRUE)
install.packages( "rpart",  dependencies= TRUE)
install.packages( "yaml",  dependencies= TRUE)
install.packages( "mlflow",  dependencies= TRUE)
install.packages( "httr",  dependencies= TRUE)

install.packages( "devtools",  dependencies= TRUE)


library( "devtools" )
devtools::install_github("IRkernel/IRkernel")
devtools::install_github("krlmlr/ulimit")

quit( save="no" )