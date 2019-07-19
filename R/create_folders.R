#' Create folders
#'
#' Create set of project folders.
#'
#' @importFrom rstudioapi getActiveProject
#' @export
create_folders <- function() {
  proj_path <- rstudioapi::getActiveProject()

  dir_list <- getOption("projdirs.folders",default = NULL)
  if (is.null(dir_list)){
    dir_list <- c("r","data","figures")
  }

  if (length(dir_list) == 0 || any(is.na(dir_list)) || !is.character(dir_list)){
    stop("Invalid folders specified in 'projdirs.folders' option.")
  }

  for (i in seq_along(dir_list)){
    dir_path <- file.path(proj_path,dir_list[i])
    if (!dir.exists(dir_path)) dir.create(dir_path)
  }

  invisible(NULL)
}


