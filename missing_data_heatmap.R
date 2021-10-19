library(REDCapR)
library(ggplot2)

token <- "2306C4C09DE54073D5040ECAB415861A"  # AT token
url <- "https://redcap.ctsi.ufl.edu/redcap/api/"
all_data_frame <- redcap_read(redcap_uri = url, token = token)$data

#token <- 6E6CDFE57EF460564AE0F180BCCE734B"  # TF token
#token <- "2306C4C09DE54073D5040ECAB415861A"  # AT token
variables_of_interest <- c("mri_checklist_complete","white_matter_integrity_complete", "grey_matter_volume_complete","mri_fmri_brain_imagined_treadmill_complete","mri_fmri_brain_n_back_complete","conn_complete","imagined_treadmill_walking_test_fmri_complete","mri_nback_performance_complete")
# variables_of_interest <- c("zero_short_dprime")


subject_id_prefix_pattern <- paste(c("H1", "H2", "H3","NH1","NH2","NH3"), collapse = '|')

subjects_of_interest_indices <- grep(subject_id_prefix_pattern,all_data_frame$record_id)
# session_of_interest_indices <- which(all_data_frame$redcap_event_name=="screening_visit_arm_1")
session_of_interest_indices <- which(all_data_frame$redcap_event_name=="base_v4_mri_arm_1")

for (this_variable in variables_of_interest)
  {
    this_variable_of_interest_binary_array <- eval(parse(text =paste0('all_data_frame$',this_variable)))
    this_variable_of_interest_binary_array[is.na(this_variable_of_interest_binary_array)] <- 0
    this_subject_session_overlap_indices <- intersect(subjects_of_interest_indices,session_of_interest_indices)

    record_id_number_only <- gsub("[^0-9.-]", "", all_data_frame$record_id)


    this_variable_of_interest_filtered_data_frame <- data.frame(record_id_number_only[this_subject_session_overlap_indices], this_variable_of_interest_binary_array[this_subject_session_overlap_indices])

    colnames(this_variable_of_interest_filtered_data_frame) <- c("record_id",this_variable)
    record_id="record_id"
    

    ggplot(this_variable_of_interest_filtered_data_frame, aes_string(this_variable,record_id)) +
      geom_tile() +
      theme(
        axis.text.y = element_text(size=11, hjust=5),
        panel.background = element_rect(fill="black", color= "yellow")
        )
       #this does not work at all 
       #scale_fill_manual(values= this_variable, aesthetic="fill")
      
    heatmap_file_name_tiff = paste0("heatmap_",toString(this_variable),".tiff")
    file = file.path("/Volumes/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/redcap_figures",heatmap_file_name_tiff)
    ggsave(file)
  }

#"\\\\exasmb.rc.ufl.edu/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/redcap_figures" <- Windows file path 
# "/Volumes/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/redcap_figures" <-Macbook file path

