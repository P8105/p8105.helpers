#' Process assignment for courseworks
#'
#' For a single assignment, process the google spreadsheet to submit assignment grades to courseworks
#'
#' @param path character; path to file containing all grades
#' @param assignment character; homework to process (e.g. "hw1")
#'
#' @import tidyverse
#' @importFrom janitor clean_names
#' @importFrom readxl read_excel
#' @export
#'
process_assignment_for_courseworks = function(path = "p8105_grades.xlsx", assignment = NULL) {

  ## should the grades be downloaded each time this is run?

  grades = read_excel(path = path, sheet = assignment)

  grades

}
