
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
  if (any(with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1"))){
    NIH$wm_rs[NIH$record_id==as.character(val)]<-NIH_data$RawScore[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$wm_uss[NIH$record_id==as.character(val)]<-NIH_data$`Uncorrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$wm_acss[NIH$record_id==as.character(val)]<-NIH_data$`Age-Corrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$wm_np[NIH$record_id==as.character(val)]<-NIH_data$`National Percentile (age adjusted)`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$wm_fcts[NIH$record_id==as.character(val)]<-NIH_data$`Fully-Corrected T-score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")]
  }
  if (any(with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1"))){
    NIH$dc_rs[NIH$record_id==as.character(val)]<-NIH_data$RawScore[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$dc_cs[NIH$record_id==as.character(val)]<-NIH_data$`Computed Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$dc_uss[NIH$record_id==as.character(val)]<-NIH_data$`Uncorrected Standard Score`[with(NIH_data,PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$dc_acss[NIH$record_id==as.character(val)]<-NIH_data$`Age-Corrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$dc_np[NIH$record_id==as.character(val)]<-NIH_data$`National Percentile (age adjusted)`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$dc_fct[NIH$record_id==as.character(val)]<-NIH_data$`Fully-Corrected T-score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Dimensional Change Card Sort Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  }
  if (any(with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1"))){
    NIH$flanker_rs[NIH$record_id==as.character(val)]<-NIH_data$RawScore[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$fi_cs[NIH$record_id==as.character(val)]<-NIH_data$`Computed Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$fi_uss[NIH$record_id==as.character(val)]<-NIH_data$`Uncorrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$fi_acss[NIH$record_id==as.character(val)]<-NIH_data$`Age-Corrected Standard Score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$fi_np[NIH$record_id==as.character(val)]<-NIH_data$`National Percentile (age adjusted)`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
    NIH$fi_fcts[NIH$record_id==as.character(val)]<-NIH_data$`Fully-Corrected T-score`[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox Flanker Inhibitory Control and Attention Test Age 12+ v2.1" & `Assessment Name`=="Assessment 1")]
  }
  ifelse (!is.na(NIH$wm_rs[NIH$record_id==as.character(val)]), NIH$nih_toolbox_assessment_scores_complete[NIH$record_id==as.character(val)]<-2, NIH$nih_toolbox_assessment_scores_complete[NIH$record_id==as.character(val)]<-0)
  ifelse (NIH$add[NIH$record_id==as.character(val)]<2000, NIH$grp[NIH$record_id==as.character(val)]<-1, NIH$grp[NIH$record_id==as.character(val)]<-2)
  if (NIH$add[NIH$record_id==as.character(val)]>3000) {NIH$grp[NIH$record_id==as.character(val)]<-3}
#NIH$nih_toolbox_assessment_scores_complete[n]<-
#NIH$record_id[n]
}

#n<-n+1
x<-X2ptDiscScores$record_id
X2ptDiscScores$add<-X2ptDiscScores$record_id
X2ptDiscScores$add<-gsub("H","",as.character(X2ptDiscScores$add))
X2ptDiscScores$add<-gsub("N","",as.character(X2ptDiscScores$add))
X2ptDiscScores$add<-as.numeric(X2ptDiscScores$add)
for (val in x) {
  ifelse (X2ptDiscScores$add[X2ptDiscScores$record_id==as.character(val)]<2000, X2ptDiscScores$grp[X2ptDiscScores$record_id==as.character(val)]<-1, X2ptDiscScores$grp[X2ptDiscScores$record_id==as.character(val)]<-2)
  if (X2ptDiscScores$add[X2ptDiscScores$record_id==as.character(val)]>3000) {X2ptDiscScores$grp[X2ptDiscScores$record_id==as.character(val)]<-3}
}
boxplot(X2ptDiscScores$somat_2pt_score~X2ptDiscScores$grp,las=2)


x<-MicroFilamentScores$record_id
MicroFilamentScores$add<-MicroFilamentScores$record_id
MicroFilamentScores$add<-gsub("H","",as.character(MicroFilamentScores$add))
MicroFilamentScores$add<-gsub("N","",as.character(MicroFilamentScores$add))
MicroFilamentScores$add<-as.numeric(MicroFilamentScores$add)
for (val in x) {
  ifelse (MicroFilamentScores$add[MicroFilamentScores$record_id==as.character(val)]<2000, MicroFilamentScores$grp[MicroFilamentScores$record_id==as.character(val)]<-1, MicroFilamentScores$grp[MicroFilamentScores$record_id==as.character(val)]<-2)
  if (MicroFilamentScores$add[MicroFilamentScores$record_id==as.character(val)]>3000) {MicroFilamentScores$grp[MicroFilamentScores$record_id==as.character(val)]<-3}
}
boxplot((as.numeric(MicroFilamentScores$somat_filament_score))~MicroFilamentScores$grp,las=2)
