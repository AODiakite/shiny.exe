#' shiny.exe
#'
#' @param appName the name of you shortcut or application
#' @param port see `port` parameter in `runApp()`
#' @param host see `host` parameter in `runApp()`
#' @param appDir see `host` parameter in `runApp()`
#'
#' @return
#' @export
#'
#' @examples
shiny.exe <- function(
    appName,
    port = getOption("shiny.port"),
    host = getOption("shiny.host", "127.0.0.1"),
    appDir = getwd()){

  if(is.null(port)) port = "getOption('shiny.port')"
  texte = c("library(shiny.exe)",paste0( "hostWin(
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
  create_task(appName,paste0(appDir,"/",appName,".R"))
  create_task_shortcut(appName,appName,appDir)
}

