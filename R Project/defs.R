# defs.R is used by multiple files for various variables that may need to be modified
# by the researcher running these scripts

# DATA_FOLDER is the folder containing multiple .csv files generated from the Nerve-Block-Modeling repository
# https://github.com/joey-kilgore/Nerve-Block-Modeling
# All folder paths should end in a \ or / depending on the OS
DATA_FOLDER <- ""

getDataFolder <- function(){
  if(DATA_FOLDER == ""){
    DATA_FOLDER = choose.dir(default = "", caption = "Select folder")
    if(.Platform$OS.type == "unix"){
      DATA_FOLDER <<- paste(DATA_FOLDER, "/", sep="")
    }else{
      DATA_FOLDER <<- paste(DATA_FOLDER, "\\", sep="")
    }
  }
  return(DATA_FOLDER)
}
