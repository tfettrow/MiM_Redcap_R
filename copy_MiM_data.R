library(googledrive)
current_folder = "Volumes/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data" #AT Mac File path 
new_folder= "https://drive.google.com/drive/u/1/folders/0APPdHWQoH9zKUk9PVA"  #Google drive link for shared drive
list_of_subjects <- c("1002")
#actual_list_of_subjects= "1004", "1007", "1009", "1010", "1011", "1012", "1013", "1017", "1018", "1019", "1020", "1022", "1024", "1025", "1026", "3066 1027 2002 2007 2008 2012 2013 2015 2017 2018 2020 2021  2022 2023 2025 2026 2027 2033 20342037203820392042205220592062300430063007300830103021302330243025302630273028302930303034303630393040304230433046304730513053305830593063
for (this_subject in list_of_subjects)
{
  drive_mkdir(this_subject, path = "https://drive.google.com/drive/u/1/folders/0APPdHWQoH9zKUk9PVA")
   #successfully creates the subject folder 
   #Don't know how to include subject folder with subfolder
  file.copy(file.path(current_folder,this_subject,"Raw"), file.path(new_folder,this_subject,"Raw"), recursive= TRUE)
  #not sure how to execute this function in copying from one network drive to another
}

                                                                          