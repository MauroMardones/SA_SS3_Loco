rm(list=ls(all=TRUE)) 
SSdir<-("~/")
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

# Analisis retrospectivo

    SS_doRetro(masterdir=mydir, oldsubdir="", newsubdir="retrospectives", years=0:-5)
    
    retroModels <- SSgetoutput(dirvec=file.path(mydir, "retrospectives",paste("retro",0:-5,sep="")))
    retroSummary <- SSsummarize(retroModels)
    endyrvec <- retroSummary$endyrs + 0:-5
    SSplotComparisons(retroSummary, endyrvec=endyrvec, legendlabels=paste("Data",0:-5,"years"))
  
