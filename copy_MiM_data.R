current_folder = "/Volumes/blue/rachaelseidler/share/FromExternal/Research_Projects_UF/CRUNCH/MiM_Data" #AT Mac File path 
#new_folder= "/Volumes/GoogleDrive/Shared\ drives/MiM_Backup"  #AT Mac file path 
new_folder= getwd()
list_of_subjects <- c("1002")
#actual_list_of_subjects= "1004", "1007", "1009", "1010", "1011", "1012", "1013", "1017", "1018", "1019", "1020", "1022", "1024", "1025", "1026", "3066 1027 2002 2007 2008 2012 2013 2015 2017 2018 2020 2021  2022 2023 2025 2026 2027 2033 20342037203820392042205220592062300430063007300830103021302330243025302630273028302930303034303630393040304230433046304730513053305830593063
for (this_subject in list_of_subjects)
{
  dir.create(file.path(this_subject,"Raw"))
  file.copy(file.path(current_folder,this_subject,"Raw"), file.path(new_folder,this_subject,"Raw"), recursive= TRUE)
}
#Warning messages (these errors pull up everytime while running)
# 1: In dir.create(file.path(this_subject, "Raw")) :
#cannot create dir '1002/Raw', reason 'No such file or directory'
#2: In file.copy(file.path(current_folder, this_subject, "Raw"), file.path(new_folder,  :
#'recursive' will be ignored as 'to' is not a single existing directory
#'# 3: In file.create(to[okay]) : cannot create file '/Volumes/GoogleDrive/Shared drives/MiM_Backup/1002/Raw', reason 'No such file or directory'
                                                                          