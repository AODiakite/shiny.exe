#' #' create_task
#' #'
#' #' @param task_name a character string with the name of the task. Defaults to the filename. Should not contain any spaces.See `?taskscheduler_create` for mor information.
#' #' @param script_path the full path to the .R script with the R code to execute. Should not contain any spaces.
#' #' @param schedule when to schedule the rscript. Either one of 'ONCE', 'MONTHLY', 'WEEKLY', 'DAILY', 'HOURLY', 'MINUTE', 'ONLOGON', 'ONIDLE'.
#' #' @param start_time  a timepoint in HH:mm format indicating when to run the script. Defaults to within 62 seconds.
#' #'
#' #' @return character(0)
#' #' @noRd
#' #'
#' #' @examples
#' #'
#'
#' create_task <- function(task_name, script_path, schedule = "ONCE", start_time = "00:00"){
#'   if (Sys.info()["sysname"] == "Windows"){
#'
#'     if(!requireNamespace("taskscheduleR", quietly = TRUE))
#'       utils::install.packages("taskscheduleR",dependencies = TRUE)
#'
#'     requireNamespace("taskscheduleR", quietly = TRUE)
#'     tryCatch(
#'       {
#'         # Delete an existing task with the same name
#'         taskscheduleR::taskscheduler_delete(taskname = task_name)
#'         taskscheduleR::taskscheduler_create(
#'           taskname = task_name,
#'           rscript = script_path,
#'           schedule = schedule,
#'           starttime = start_time
#'         )
#'       },
#'       error = function(e) {
#'         # Create a new task
#'         taskscheduleR::taskscheduler_create(
#'           taskname = task_name,
#'           rscript = script_path,
#'           schedule = schedule,
#'           starttime = start_time
#'         )
#'       }
#'     )
#'   }
#' }
#'
