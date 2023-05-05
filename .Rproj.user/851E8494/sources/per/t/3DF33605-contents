#' create_task_shortcut
#'
#' @param task_name a character string with the name of the task. Defaults to the filename. Should not contain any spaces.
#' @param shortcut_name a character string with the name of the task. Defaults to the filename. Should not contain any spaces.
#' @param appDir see `host` parameter in `shiny::runApp()`
#'
#' @return character(0)
#' @noRd
#'
#' @examples
create_task_shortcut <- function(task_name, shortcut_name,appDir) {
  # Check parameters
  if (!is.character(task_name) || length(task_name) != 1) {
    stop("The 'task_name' argument must be a character string of length 1")
  }
  if (!is.character(shortcut_name) || length(shortcut_name) != 1) {
    stop("The 'shortcut_name' argument must be a character string of length 1")
  }

  # Specify the path to the shiny app
  desktop_path <- appDir

  # Check if the desktop path is valid
  if (!dir.exists(desktop_path)) {
    stop("Desktop path does not exist:", desktop_path)
  }

  # Specify shortcut details
  target_path <- "C:\\Windows\\System32\\schtasks.exe"
  arguments <- paste0("/run /tn \"", task_name, "\"")
  icon_path <- target_path

  # Check if the target file exists
  if (!file.exists(target_path)) {
    stop("Target file does not exist:", target_path)
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
