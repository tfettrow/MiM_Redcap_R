library(REDCapR)
url <- "https://redcap.ctsi.ufl.edu/redcap/api/"
token <- "6E6CDFE57EF460564AE0F180BCCE734B"  # TF token
all_data <- redcap_read(redcap_uri = url, token = token)$data

session_of_interest_indices <- which(all_data$redcap_event_name=="base_clinical_asse_arm_1")

this_variable_of_interest_indices <- which(!is.na(eval(parse(text =paste0('all_data$',"bc_rbc")))))


subject_id_prefix_pattern <- paste(c("H1", "H2", "H3","NH1","NH2","NH3"), collapse = '|')
subjects_of_interest_indices <- grep(subject_id_prefix_pattern,all_data$record_id)

this_subject_variable_overlap_indices <- intersect(intersect(subjects_of_interest_indices,this_variable_of_interest_indices),session_of_interest_indices)

hct = (all_data$bc_rbc[this_subject_variable_overlap_indices] * all_data$bc_mcv[this_subject_variable_overlap_indices]) / 10

hct_filtered_data_frame <- data.frame(all_data$record_id[this_subject_variable_overlap_indices], hct)

colnames(hct_filtered_data_frame) <- c("record_id","hct")

file_name = file.path("\\\\exasmb.rc.ufl.edu/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/spreadsheet_data/hematocrit.csv")

write.csv(hct_filtered_data_frame, file=file_name, row.names = FALSE)
