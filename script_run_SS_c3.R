rm(list=ls(all=TRUE)) 
SSdir<-("~/IFOP/Loco_Assessment_AMERB/SA_Loco/Conglom_3_Base")
setwd(SSdir)
dir()

install.packages("r4ss")
require(r4ss)

#shell(cmd="ss") # run SS
system("./ss")
# install.packages("devtools")
# devtools::install_github("r4ss/r4ss", ref="development")
# 
# 
# 
# install.packages("caTools")
# library("caTools")
# 


tmp3<-SS_output(dir=SSdir,covar=T,forecast=F, ncols=300) 
SS_plots(tmp3, uncertainty=T,datplot = F, png=T, aalresids = F,btarg=0.60, minbthresh=0.25, forecast=F)

# create list summarizing model results
SSsummarize(tmp3)


#SS_readdat(run.new)
