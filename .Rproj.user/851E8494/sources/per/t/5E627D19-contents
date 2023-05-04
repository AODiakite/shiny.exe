
#' hostWin
#'
#' @param appDir see `host` parameter in `runApp()`
#' @param port see `port` parameter in `runApp()`
#' @param launch.browser see `launch.browser` parameter in `runApp()`
#' @param host see `host` parameter in `runApp()`
#' @param workerId see `workerId` parameter in `runApp()`
#' @param quiet see `quiet` parameter in `runApp()`
#' @param display.mode see `display.mode` parameter in `runApp()`
#' @param test.mode see `test.mode` parameter in `runApp()`
#'
#' @return
#' @export
#'
#' @examples
hostWin <- function(
    appDir = getwd(),
    port = getOption("shiny.port"),
    launch.browser = getOption("shiny.launch.browser", interactive()),
    host = getOption("shiny.host", "127.0.0.1"),
    workerId = "",
    quiet = FALSE,
    display.mode = c("auto", "normal", "showcase"),
    test.mode = getOption("shiny.testmode", FALSE)){

  ip_host = tolower(host)
  if(ip_host == "public") launch.browser = TRUE
  ip = ifelse(
    ip_host == "public",
    {
      ipconfig <- system("ipconfig", intern=TRUE)
      grep_ip <- ipconfig[grep("IPv4", ipconfig)]
      ipv4 <- gsub(".*? ([[:digit:]])", "\\1", grep_ip)
      ipv4
    },
    host
  )
  print(paste0("the Shiny Web application runs on: http://", ip,":",port))
  shiny::runApp(
    appDir = appDir,
    port = port,
    launch.browser = launch.browser,
    host = ip,
    workerId = workerId,
    quiet = quiet,
    display.mode = display.mode,
    test.mode = test.mode)
}
