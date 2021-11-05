
x<-NIH$record_id
for (val in x) {
#n<-1
print(val)
#if (any(which(NIH_data$PIN == as.character(val))) & )
#{
if (any(with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1"))){
NIH$wm_rs[NIH$record_id==as.character(val)]<-as.character(NIH_data$RawScore[with(NIH_data, PIN==as.character(val) & Inst=="NIH Toolbox List Sorting Working Memory Test Age 7+ v2.1" & `Assessment Name`=="Assessment 1")])
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
#NIH$nih_toolbox_assessment_scores_complete[n]<-
#NIH$record_id[n]
}

#n<-n+1

