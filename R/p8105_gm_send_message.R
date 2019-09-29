#' p8105_send_message
#'
#' This is a wrapper for `gm_send_message` that addresses a specific
#' issue: when mailing out grades to a long list of students, some
#' issues with the gmail API are invariably encountered. This wrapper
#' detects those errors (using `safely`); when an error is encountered,
#' the system waits a random interval between 0 and 1 second and tries
#' again.
#'
#' @param message message passed into `gm_send_message`. In this
#' package, the message is constructed from an organized tibble
#' in `send_emails_to_students()`.
#'
#' @return Output of the final `safe_gm_send_message`
#'
#' @export
#'
#' @examples
#'
#' gm_mime() %>%
#' gm_to("ajg2202@cumc.columbia.edu") %>%
#'   gm_from("bst.p8105@gmail.com") %>%
#'   gm_subject("test") %>%
#'   gm_text_body("body") %>%
#'   p8105_send_message
#'
p8105_send_message = function(message) {

  safe_gm_send_message = safely(gm_send_message)

  message_sent = FALSE

  while (!message_sent) {

    send_output = safe_gm_send_message(message)

    if (is.null(send_output$error)) {
      message_sent = TRUE
      cat(".")
    } else {
      Sys.sleep(runif(1))
    }

  }

  send_output

}


