Red_NIH<-as.data.frame(NIH[,c(8,10,3:7)])
l<-reshape(data=Red_NIH,varying=c("wm_rs","dc_rs","dc_cs","flanker_rs","fi_cs"),v.names="score",timevar = "test",times=c("wm_rs","dc_rs","dc_cs","flanker_rs","fi_cs"),new.row.names = 1:620,direction = "long")
l$test[l$test=="wm_rs"]<-"WMRaw"
l$test[l$test=="dc_cs"]<-"DemCardComputed"
l$test[l$test=="fi_cs"]<-"FlankerComputed"
# boxplot(score~grp*test,data=l,las=3,main='NIHtoolbox Scores by age grp')
#pairs(l$test)
names(Red_NIH)[3]<-"WMRaw"
names(Red_NIH)[5]<-"DemCardComputed"
names(Red_NIH)[7]<-"FlankerComputed"
pairs(Red_NIH$WMRaw+Red_NIH$DemCardComputed+Red_NIH$FlankerComputed+jitter(Conc$MFT,3)+jitter(Conc$TPT,3)~Red_NIH$grp,log=4,col = c("blue", "red", "green")[Red_NIH$grp],labels=c("WMRaw","DemCardComp","FlankerComp","MicroFil (g)","TwoPTDisc (mm)"),lower.panel=NULL)
legend(x="bottomleft",fill=c("blue", "red", "green"), legend=c("1","2","3"))

ppp<-as.data.frame(reshape(data=gaitdata,varying=c("DelGait","DelOG","VBL","OgHigh"),times=c("DelGait","DelOG","VBL","OgHigh"), direction = "long",v.names="value",timevar = "times",new.row.names = 1:124))
boxplot(gaitdata$delta_OGgaitdata$delta_Gait~gaitdata$grp)
