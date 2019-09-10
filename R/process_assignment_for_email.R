#' Process assignment for email
#'
#' For a single assignment, process the google spreadsheet to distribute grades to students via email
#'
#' @param assignment character; homework to process (e.g. "HW1")
#'
#' @import tidyverse
#' @importFrom janitor clean_names
#' @export
#'
process_assignment_for_email = function(sheet) {

  tidy_sheet =
    sheet %>%
    janitor::clean_names() %>%
    select(assignment, uni = sis_login_id, starts_with("problem")) %>%
    gather(key = problem, value = value, contains("problem")) %>%
    mutate(problem = stringr::str_replace(problem, "problem_", "")) %>%
    separate(problem, into = c("problem", "type"), "_") %>%
    mutate(problem = as_factor(problem),
           problem = fct_inorder(problem)) %>%
    spread(key = type, value = value) %>%
    mutate(comments = replace(comments, is.na(comments), ""),
           problem = paste0("problem_", problem)) %>%
    select(assignment, uni, problem, points, comments) %>%
    drop_na(points)

  nested_sheet =
    tidy_sheet %>%
    nest(-(assignment:uni))

  written_comments =
    nested_sheet %>%
    pmap(write_comment_csv)

  sheet

}
