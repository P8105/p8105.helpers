#' Initialize assignment
#'
#' @param assignment
#'
#' @return
#' @export
#'
#' @examples
initialize_assignment = function(grade_spreadsheet = "p8105_grades.xlsx", assignment) {
  assignment_name = paste0("emails/p8105_", assignment)

  dir.create(paste0("./emails/", assignment_name))
  dir.create(paste0("./emails/", assignment_name, "/comments"))

  sheet = read_excel(grade_spreadsheet, sheet = assignment) %>%
    filter(!is.na(ID)) %>%
    mutate(assignment = assignment) %>%
    select(assignment, everything())

  sheet

}
