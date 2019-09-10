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

  gm_mime() %>%
    gm_to(To) %>%
    gm_from(From) %>%
    gm_subject(Subject) %>%
    gm_text_body(body) %>%
#    attach_part(body) %>%
    gm_attach_file(filename = attachment)

}
