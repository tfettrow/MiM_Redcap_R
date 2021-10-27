#This script extract variables from redcap
#Steps(local RStudio recommanded):
#(0)make sure REDCap package is installed
#(1)set up vpn and connect to HiPerGator
#(2)enter your token and the name of variable that you want to extract in the console
#   example: token<-'your token'
#   example: variable_name<-'sppb_12', you can find this name in 'Mind in Motion _ REDCap.pdf'
#           moca is 'moca_total',400m walk time is 'time_to_walk_400_meters_re'
#(3)change the session of interest in line17(manually check the data frame)
#(4)please uncomment corresponding path


###extract the data###
library(REDCapR)
url <- "https://redcap.ctsi.ufl.edu/redcap/api/"
all_data <- redcap_read(redcap_uri = url, token = token)$data
session_of_interest_indices <- which(all_data$redcap_event_name=="base_clinical_asse_arm_1")
all_data<- all_data[session_of_interest_indices, ]
n<-paste("target_data<-data.frame(all_data$record_id, all_data$", variable_name, ")", sep = "")
eval(parse(text=n))
target_data<- na.omit(target_data)
row.names(target_data)<-c(1:nrow(target_data))
names(target_data)<-c("subject_id",variable_name)
target_data$subject_id<-as.character(target_data$subject_id)
file_name<-paste(variable_name,'.csv', sep="")

###turn the subject id to numbers### if you don't need this, omit it
for (i in 1:nrow(target_data)) {
t<-target_data[i,1]
if (nchar(t)>4) {
target_data[i,1]<-substring(t, nchar(t)-3, nchar(t))
}
}

####Path setting#####

#if you are using macOS or linux, uncomment the following line:
setwd("/Volumes/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/spreadsheet_data")
#if you are using windows, uncomment the following line:
#setwd("\\exasmb.rc.ufl.edu\blue\rachaelseidler\share\FromExternal\Research_Projects_UF\CRUNCH\MiM_Data\spreadsheet_data")
#if you run this script in HiPerGator, uncomment the following line:
#setwd("/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/spreadsheet_data")

write.csv(target_data, file=file_name, row.names = FALSE)

# vv TF code vv
# session_of_interest_indices <- which(all_data$redcap_event_name=="screening_visit_arm_1")
# 
# this_variable_of_interest_indices <- which(!is.na(eval(parse(text =paste0('all_data$',this_variable)))))
# 
# subject_id_prefix_pattern <- paste(c("H1", "H2", "H3","NH1","NH2","NH3"), collapse = '|')
# subjects_of_interest_indices <- grep(subject_id_prefix_pattern,all_data$record_id)
# 
# this_subject_variable_overlap_indices <- intersect(intersect(subjects_of_interest_indices,this_variable_of_interest_indices),session_of_interest_indices)
# 
# 
# target_data <- data.frame(all_data$record_id[this_subject_variable_overlap_indices],eval(parse(text =paste0('all_data$',this_variable)))[this_subject_variable_overlap_indices])

