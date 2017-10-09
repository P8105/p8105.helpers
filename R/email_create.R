#' Email create
#'
#' @param To
#' @param From
#' @param Subject
#' @param body
#' @param attachment
#'
#' @return
#' @export
#'
#' @examples
email_create = function(To, From, Subject, body, attachment){
  mime() %>%
    from(From) %>%
    to(To) %>%
    subject(Subject) %>%
    html_body(body) %>%
    attach_part(body) %>%
    attach_file(filename = attachment)
}
