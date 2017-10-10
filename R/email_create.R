#' Email create
#'
#' @param To
#' @param From
#' @param Subject
#' @param body
#' @param attachment
#'
#' @import gmailr
#' @imoprt
#'
#' @return
#' @export
#'
email_create = function(To, From, Subject, body, attachment){

  mime() %>%
    to(To) %>%
    from(From) %>%
    subject(Subject) %>%
    html_body(body) %>%
    attach_part(body) %>%
    attach_file(filename = attachment)

}
