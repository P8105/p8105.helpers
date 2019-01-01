#' Send emails to students
#'
#' @param sheet
#'
#' @return
#'
#' @export
#'
#' @examples
send_emails_to_students = function(sheet){

  response = readline("Type 'send' to send emails to students. ")

  path_to_export_csv = paste0("./emails/p8105_", unique(sheet$assignment), "/emails.csv")

  safe_send_message = safely(send_message)
  body = "Hello,

Your grade for %s is %s.

Points and comments for each problem are in the attached CSV.

If you have questions, please email Jeff directly (and soon) with a detailed description of your concern.

"

  ## how to handle return object?

  email_df = sheet %>%
    clean_names() %>%
    rename(uni = sis_login_id) %>%
    mutate(
      email = paste0(uni, "@cumc.columbia.edu"),
      To = email,
      From = "P8105 <bst.p8105@gmail.com>",
      Subject = sprintf('Grade for p8105_%s', assignment),
      body = sprintf(body, assignment, total),
      attachment = paste0("./p8105_", assignment, "/comments/", uni, ".csv")) %>%
    select(To, From, Subject, body, attachment)

  write_csv(email_df, path = path_to_export_csv)

  if (response != "send") {
    stop("Try again when you're ready! \n")
  }

  email_df %>%
    pmap(email_create) %>%
    map(safe_send_message)

}

