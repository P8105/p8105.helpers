#' Initialize assignment
#'
#' @param assignment
#'
#' @return
#' @export
#'
#' @examples
initialize_assignment = function(grade_spreadsheet = "p8105_grades.xlsx", assignment) {

  fs::dir_create(here::here("emails", stringr::str_c("p8105_", assignment)))
  fs::dir_create(here::here("emails", stringr::str_c("p8105_", assignment), "comments"))

  sheet = read_excel(grade_spreadsheet, sheet = assignment) %>%
    filter(!is.na(ID)) %>%
    mutate(assignment = assignment) %>%
    select(assignment, everything())

  sheet

}
