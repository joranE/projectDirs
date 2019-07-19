#' Move files
#'
#' Move files into folders.
#'
#' @importFrom tools list_files_with_exts
#' @export
move_files <- function(){
  proj_path <- rstudioapi::getActiveProject()

  file_ext_map <- getOption("projdirs.file_ext_map",default = NULL)
  file_regex <- getOption("projdirs.file_regex",default = NULL)

  if (!is.null(file_ext_map)){
    nms <- names(file_ext_map)

    if (is.null(nms) || length(nms) == 0){
      stop("File extension to directory mapping should be a named list.")
    }

    for (i in seq_along(nms)){
      dir_path <- file.path(proj_path,nms[i])
      if (dir.exists(dir_path)){
        to_move <- tools::list_files_with_exts(dir = proj_path,
                                               exts = file_ext_map[[i]],
                                               full.names = FALSE)
        file.rename(from = file.path(proj_path,to_move),
                    to = file.path(proj_path,nms[i],to_move))
      }
    }
  }

  if (!is.null(file_regex)){
    nms <- names(file_regex)

    if (is.null(nms) || length(nms) == 0){
      stop("File regex mapping should be a named list.")
    }

    for (i in seq_along(nms)){
      dir_path <- file.path(proj_path,nms[i])
      if (dir.exists(dir_path)){
        to_move <- list.files(path = dir_path,
                              pattern = file_regex[i],
                              full.names = FALSE)
        file.rename(from = file.path(proj_path,to_move),
                    to = file.path(proj_path,nms[i],to_move))
      }
    }
  }

  invisible(NULL)
}
