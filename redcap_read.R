library(REDCapR)


#token <- "6E6CDFE57EF460564AE0F180BCCE734B"  # TF token

token <- "2306C4C09DE54073D5040ECAB415861A"  # AT token


url <- "https://redcap.ctsi.ufl.edu/redcap/api/"
all_data_frame <- redcap_read(redcap_uri = url, token = token)$data
all_data_frame$fmri_zero_short_dprime

subject_id_prefix_pattern <- paste(c("H","NH"), collapse = '|')
subjects_of_interest_indices <- grep(subject_id_prefix_pattern,all_data_frame$record_id)

this_pattern_did_not_work <- all_data_frame$record_id[subjects_of_interest_indices]

