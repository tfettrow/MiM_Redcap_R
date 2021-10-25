library(REDCapR)
library(ggplot2)

token <- "2306C4C09DE54073D5040ECAB415861A"  # AT token
url <- "https://redcap.ctsi.ufl.edu/redcap/api/"
all_data_frame <- redcap_read(redcap_uri = url, token = token)$data

#token <- 6E6CDFE57EF460564AE0F180BCCE734B"  # TF token
#token <- "2306C4C09DE54073D5040ECAB415861A"  # AT token
variables_of_interest <- c("mr_screen_sv_long_version_complete","mri_checklist_complete","white_matter_integrity_complete", "grey_matter_volume_complete","mri_fmri_brain_imagined_treadmill_complete","mri_fmri_brain_n_back_complete","conn_complete","imagined_treadmill_walking_test_fmri_complete","mri_nback_performance_complete")

subject_id_prefix_pattern <- paste(c("H1", "H2", "H3","NH1","NH2","NH3"), collapse = '|')


bv4_indices <- which(all_data_frame$redcap_event_name=="base_v4_mri_arm_1")
subjects_of_interest_indices <- grep(subject_id_prefix_pattern,all_data_frame$record_id)


# TF just thinking here...
# need to:
# 1) identify the subject ids that withdrew
# 2) exclude these subject ids from the potential list of subject ids...
# the  problem is that the this_subject_session_overlap_indices is specific to base_v4_mri_arm_1 and the screening_arm_patients_that_withdraw_indices is specific to screening_visit_arm_1


screening_arm_indices <- which(all_data_frame$redcap_event_name=="screening_visit_arm_1")
patients_that_withdraw_indices <- which(all_data_frame$pt_withdraw_fd==1)
screening_arm_patients_that_withdraw_indices <- intersect(patients_that_DIDNOT_withdraw_indices, screening_arm_indices)
# subjects_of_interest_DIDNOTwithdraw_indices <- intersect(subjects_of_interest_indices,screening_arm_patients_that_DIDNOT_withdraw_indices)

for (this_variable in variables_of_interest)
  {
    this_variable_of_interest_binary_array <- eval(parse(text =paste0('all_data_frame$',this_variable)))
    this_variable_of_interest_binary_array[is.na(this_variable_of_interest_binary_array)] <- 0
    this_subject_session_overlap_indices <- intersect(subjects_of_interest_indices,bv4_indices)

      record_id_number_only <- gsub("[^0-9.-]", "", all_data_frame$record_id)

    this_variable_of_interest_filtered_data_frame <- data.frame(record_id_number_only[this_subject_session_overlap_indices], this_variable_of_interest_binary_array[this_subject_session_overlap_indices])

    colnames(this_variable_of_interest_filtered_data_frame) <- c("record_id",this_variable)
    record_id="record_id"


    ggplot(this_variable_of_interest_filtered_data_frame, aes_string(fill = this_variable,x=this_variable, y = record_id,height=1, width=1)) +
      geom_tile(aes(fill = this_variable)) +
      theme(
        axis.text.y = element_text(size=6),
        panel.background = element_rect(fill="white", color= "grey"), legend.position = "none",
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major = element_line(color = 'black')
        )

    heatmap_file_name_tiff = paste0("heatmap_",toString(this_variable),".tiff")
    file = file.path("\\\\exasmb.rc.ufl.edu/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/redcap_figures",heatmap_file_name_tiff)
    ggsave(file)
  }

#"\\\\exasmb.rc.ufl.edu/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/redcap_figures" <- Windows file path
# "/Volumes/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data/redcap_figures" <-Macbook file path

