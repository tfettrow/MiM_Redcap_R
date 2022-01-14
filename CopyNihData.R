
x<-NIH$record_id
NIH$add<-NIH$record_id
NIH$add<-gsub("H","",as.character(NIH$add))
NIH$add<-gsub("N","",as.character(NIH$add))
NIH$add<-as.numeric(NIH$add)
for (val in x) {
#n<-1
  print(val)
  #if (any(which(NIH_data$PIN == as.character(val))) & )
  #{
  # if (any(with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1"))){
  #   NIH$wm_rs[NIH$record_id==as.character(val)]<-NIH_data$RawScore[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$wm_uss[NIH$record_id==as.character(val)]<-NIH_data$`Uncorrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$wm_acss[NIH$record_id==as.character(val)]<-NIH_data$`Age-Corrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$wm_np[NIH$record_id==as.character(val)]<-NIH_data$`National Percentile (age adjusted)`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$wm_fcts[NIH$record_id==as.character(val)]<-NIH_data$`Fully-Corrected T-score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
  # }
  # if (any(with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1"))){
  #   NIH$dc_rs[NIH$record_id==as.character(val)]<-NIH_data$RawScore[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$dc_cs[NIH$record_id==as.character(val)]<-NIH_data$`Computed Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$dc_uss[NIH$record_id==as.character(val)]<-NIH_data$`Uncorrected Standard Score`[with(NIH_data,PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$dc_acss[NIH$record_id==as.character(val)]<-NIH_data$`Age-Corrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$dc_np[NIH$record_id==as.character(val)]<-NIH_data$`National Percentile (age adjusted)`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$dc_fct[NIH$record_id==as.character(val)]<-NIH_data$`Fully-Corrected T-score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  # }
  # if (any(with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1"))){
  #   NIH$flanker_rs[NIH$record_id==as.character(val)]<-NIH_data$RawScore[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$fi_cs[NIH$record_id==as.character(val)]<-NIH_data$`Computed Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$fi_uss[NIH$record_id==as.character(val)]<-NIH_data$`Uncorrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$fi_acss[NIH$record_id==as.character(val)]<-NIH_data$`Age-Corrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$fi_np[NIH$record_id==as.character(val)]<-NIH_data$`National Percentile (age adjusted)`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  #   NIH$fi_fcts[NIH$record_id==as.character(val)]<-NIH_data$`Fully-Corrected T-score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  # }
  ifelse (!is.na(NIH$wm_rs[NIH$record_id==as.character(val)]), NIH$nih_toolbox_assessment_scores_complete[NIH$record_id==as.character(val)]<-2, NIH$nih_toolbox_assessment_scores_complete[NIH$record_id==as.character(val)]<-0)
  ifelse (NIH$add[NIH$record_id==as.character(val)]<2000, NIH$grp[NIH$record_id==as.character(val)]<-1, NIH$grp[NIH$record_id==as.character(val)]<-2)
  if (NIH$add[NIH$record_id==as.character(val)]>3000) {NIH$grp[NIH$record_id==as.character(val)]<-3}
#NIH$nih_toolbox_assessment_scores_complete[n]<-
#NIH$record_id[n]
}

#n<-n+1
x<-TPT$record_id
TPT$add<-TPT$record_id
TPT$add<-gsub("H","",as.character(TPT$add))
TPT$add<-gsub("N","",as.character(TPT$add))
TPT$add<-as.numeric(TPT$add)
for (val in x) {
  ifelse (TPT$add[TPT$record_id==as.character(val)]<2000, TPT$grp[TPT$record_id==as.character(val)]<-1, TPT$grp[TPT$record_id==as.character(val)]<-2)
  if (TPT$add[TPT$record_id==as.character(val)]>3000) {TPT$grp[TPT$record_id==as.character(val)]<-3}
}
boxplot(TPT$somat_2pt_score~TPT$grp,las=2,main="2pt disc scores by grp",xlab="grp",ylab="2pt disc distance (mm)")


x<-MFT$record_id
MFT$add<-MFT$record_id
MFT$add<-gsub("H","",as.character(MFT$add))
MFT$add<-gsub("N","",as.character(MFT$add))
MFT$add<-as.numeric(MFT$add)
for (val in x) {
  ifelse (MFT$add[MFT$record_id==as.character(val)]<2000, MFT$grp[MFT$record_id==as.character(val)]<-1, MFT$grp[MFT$record_id==as.character(val)]<-2)
  if (MFT$add[MFT$record_id==as.character(val)]>3000) {MFT$grp[MFT$record_id==as.character(val)]<-3}
}
MFT$somat_filament_score[MFT$somat_filament_score=="007"]<-0.07
MFT$somat_filament_score[MFT$somat_filament_score=="04"]<-0.4
#MFT$somat_filament_score[MFT$somat_filament_score=="02"]<-0.2
#MFT$somat_filament_score[MFT$somat_filament_score=="7"]<-0.07
MFT$somat_filament_score<-as.numeric(MFT$somat_filament_score)
boxplot((MFT$somat_filament_score)~MFT$grp,las=2,main="Microfilament scores by grp",ylab="final microfilament",xlab="grp",log="y")

Conc<-data.frame(TPT$add,TPT$grp,TPT$somat_2pt_score,MFT$somat_filament_score)
names(Conc)<-c("add","grp","TPT","MFT")


