#' create_task_shortcut
#'
#' @param task_name a character string with the name of the task. Defaults to the filename. Should not contain any spaces.
#' @param shortcut_name a character string with the name of the task. Defaults to the filename. Should not contain any spaces.
#' @param appDir see host parameter in shiny::runApp()
#'
#' @return character(0)
#' @noRd
#'
#' @examples
create_task_shortcut <- function(task_name, shortcut_name,appDir){
  # Get Os type
  sysname <- Sys.info()["sysname"]
  if (sysname == "Windows") {
    # Créer le contenu du fichier .bat
    contenu <- c("@echo off ",
                 paste0(Sys.which("Rscript.exe")," \"",
                        appDir,"/",task_name,".R\""),
                 "pause")
    writeLines(contenu, paste0(task_name, ".bat"))

  }
  else if (sysname == "Darwin") {
    # Créer le contenu du fichier .command
    contenu <- paste0("#!/bin/bash\nRscript ", paste0("\"",appDir,"/",task_name,".R","\""))

    # Enregistrer le fichier .command
    writeLines(contenu, paste0(task_name, ".command"))

    # Rendre le fichier exécutable
    system(paste0("chmod +x ", task_name, ".command"))

    # Afficher un message de confirmation
    message(paste0("File '", task_name, ".command' was created !"))
  }
  else if (sysname == "Linux") {
    # shell file contents
    contenu <- paste0("#!/bin/bash\nRscript ", paste0("\"",appDir,"/",task_name,".R","\""))
    writeLines(contenu, paste0(task_name, ".sh"))

    # Make it executable
    system(paste0("chmod +x ", task_name, ".sh"))

    # Confrimation message
    message(paste0("File '", task_name, ".sh' was created !"))}
}
