#' Process assignment for courseworks
#'
#' For a single assignment, process the google spreadsheet to submit assignment grades to courseworks
#'
#' @param assignment character; homework to process (e.g. "HW1")
#'
#' @import tidyverse
#' @importFrom janitor clean_names
#' @importFrom readxl read_excel
#' @export
#'
process_assignment_for_courseworks = function(assignment = NULL) {

  ## should the grades be downloaded each time this is run?

  grades = read_excel("data_science_grades.xlsx", sheet = assignment)

  grades

}
