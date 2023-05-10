#' shiny.exe
#'
#' @param appName the name of you shortcut or application
#' @param port see port parameter in shiny::runApp()
#' @param host see host parameter in shiny::runApp(). If host = 'public', the application will be launched on the public server to which you are connected. Thus, all other devices connected to the same server will be able to access the application through the link of your IPv4 extended by the port. You can stop the application by leaving the terminal opened by the shortcut.
#' @param appDir see host parameter in shiny::runApp()
#'
#' @return character(0)
#' @export
#'
#' @examples
#' \dontrun{shiny.exe(appName = "MyApp", host = 'public')}
shiny.exe <- function(
    appName,
    port = getOption("shiny.port"),
    host = getOption("shiny.host", "127.0.0.1"),
    appDir = getwd()){

  if(is.null(port)) port = "getOption('shiny.port')"
  # Choose host function depending the OS type
  host_func <- ifelse(Sys.info()["sysname"] == "Windows", "hostWin", "hostUnix")
  texte = c("#' Please do not rename this file !",
  "library(shiny.exe)",
  paste0(host_func,"(
    appDir = '", appDir,"',
    port = ",port,",
    launch.browser = TRUE,
    host = ","'",host,"'",",
                  workerId = '',
                  quiet = FALSE,
                  display.mode = c('auto', 'normal', 'showcase'),
                  test.mode = getOption('shiny.testmode', FALSE))"))
  writeLines(
    texte,
    paste0(appName,".R")
  )
  create_task_shortcut(appName,appName,appDir)
}

