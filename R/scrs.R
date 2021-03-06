scrs_bookdown <- function(path) {
    # ensure directory exists
    dir.create(path, recursive = TRUE, showWarnings = FALSE)
    # copy 'resources' folder to path
    resources <- system.file("rstudio", "templates", "project", "resources",
                            package = "scrsreport", mustWork = TRUE)
    files <- list.files(resources, recursive = FALSE, include.dirs = TRUE)
    source <- file.path(resources, files)
    target <- file.path(path)
    file.copy(source, target, recursive = TRUE)
    # add book_filename to _bookdown.yml and default to the base path name
    f <- file.path(path, "_bookdown.yml")
    x <- xfun::read_utf8(f)
    xfun::write_utf8(c(sprintf("book_filename: \"%s\"", basename(path)), x), f)

    TRUE
}
