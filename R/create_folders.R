#' Create folders
#'
#' Create R, SQL and Output folders.
#'
#' @importFrom rstudioapi getActiveProject
#' @export
create_folders <- function() {
  proj_path <- rstudioapi::getActiveProject()

  r_path <- file.path(proj_path,"R")
  sql_path <- file.path(proj_path,"SQL")
  output_path <- file.path(proj_path,"Output")

  if (!dir.exists(r_path)) dir.create(r_path)
  if (!dir.exists(sql_path)) dir.create(sql_path)
  if (!dir.exists(output_path)) dir.create(output_path)
  invisible(NULL)
}
