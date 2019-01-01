#' Title
#'
#' @param assignment
#' @param uni
#' @param data
#'
#' @return
#' @export
#'
#' @examples
write_comment_csv = function(assignment, uni, data) {
  path = paste0("emails/p8105_", assignment, "/comments/", uni, ".csv")
  write_csv(data, path)
  return(NULL)
}
