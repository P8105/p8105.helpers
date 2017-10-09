#' Initialize assignment
#'
#' @param assignment
#'
#' @return
#' @export
#'
#' @examples
initialize_assignment = function(grade_spreadsheet = "data_science_grades.xlsx", assignment) {
  assignment_name = paste0("p8105_", assignment)

  dir.create(paste0("./", assignment_name))
  dir.create(paste0("./", assignment_name, "/comments"))

  sheet = read_excel(grade_spreadsheet, sheet = assignment) %>%
    filter(!is.na(ID)) %>%
    mutate(assignment = assignment) %>%
    select(assignment, everything())

  sheet

}
