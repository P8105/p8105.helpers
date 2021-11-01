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
  file = stringr::str_c("emails/p8105_", assignment, "/comments/", uni, ".csv")
  write_csv(data, file)
  return(NULL)
}
