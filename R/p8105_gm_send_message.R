
p8105_send_message = function(message) {

  safe_gm_send_message = safely(gm_send_message)

  message_sent = FALSE

  while (!message_sent) {

    send_output = safe_gm_send_message(message)

    if (is.null(send_output$error)) {
      message_sent == TRUE
    } else {
      Sys.sleep(runif(1))
    }

  }

  send_output

}


