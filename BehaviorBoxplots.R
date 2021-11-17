Red_NIH<-as.data.frame(NIH[,c(22,23,4,9,10,15,16)])
l<-reshape(data=Red_NIH,varying=c("wm_rs","dc_rs","dc_cs","flanker_rs","fi_cs"),v.names="score",timevar = "test",times=c("wm_rs","dc_rs","dc_cs","flanker_rs","fi_cs"),new.row.names = 1:620,direction = "long")
boxplot(score~grp*test,data=l,las=2)
