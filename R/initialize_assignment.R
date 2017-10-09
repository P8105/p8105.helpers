#' Initialize assignment
#'
#' @param assignment
#'
#' @return
#' @export
#'
#' @examples
initialize_assignment = function(assignment) {
  assignment_name = paste0("p8105_", assignment)

  dir.create(paste0("./", assignment_name))
  dir.create(paste0("./", assignment_name, "/comments"))

  sheet = read_excel("data_science_grades.xlsx", sheet = assignment) %>%
    filter(!is.na(ID)) %>%
    mutate(assignment = assignment) %>%
    select(assignment, everything())

  sheet

}
