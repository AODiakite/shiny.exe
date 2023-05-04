#' create_task_shortcut
#'
#' @param task_name a character string with the name of the task. Defaults to the filename. Should not contain any spaces.
#' @param shortcut_name a character string with the name of the task. Defaults to the filename. Should not contain any spaces.
#' @param appDir see `host` parameter in `runApp()`
#'
#' @return character(0)
#' @noRd
#'
#' @examples
create_task_shortcut <- function(task_name, shortcut_name,appDir) {
  # Verifiez si les arguments sont valides
  if (!is.character(task_name) || length(task_name) != 1) {
    stop("L'argument 'task_name' doit etre une chaine de caracteres de longueur 1")
  }
  if (!is.character(shortcut_name) || length(shortcut_name) != 1) {
    stop("L'argument 'shortcut_name' doit etre une chaine de caracteres de longueur 1")
  }

  # Specifiez le chemin vers le bureau
  desktop_path <- appDir

  # Verifiez si le chemin du bureau est valide
  if (!dir.exists(desktop_path)) {
    stop("Le chemin du bureau n'existe pas:", desktop_path)
  }

  # Specifiez les details du raccourci
  target_path <- "C:\\Windows\\System32\\schtasks.exe"
  arguments <- paste0("/run /tn \"", task_name, "\"")
  icon_path <- target_path

  # Verifiez si le fichier cible existe
  if (!file.exists(target_path)) {
    stop("Le fichier cible n'existe pas:", target_path)
  }

  # Create shortcut
  shell(
    paste0(
      "powershell \"$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('",
      file.path(desktop_path, paste0(shortcut_name, ".lnk")),
      "'); $s.TargetPath = '",
      target_path,
      "\'; $s.Arguments = '",
      arguments,
      "'; $s.IconLocation = '",
      icon_path,
      "'; $s.Save()\"",
      sep = ""
    ),
    intern = TRUE
  )
}
