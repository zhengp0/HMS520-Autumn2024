# call a function
a <- "bakka"
substring(a, first=1, last=3)
args <- list(
  a, first = 1, last = 3
)

# define a function
add_2 <- function(x = 0) {
  x + 2
}
add_2("a")

# improve function call
add_2 <- function(x = 0) {
  if (!is.numeric(x)) {
    stop("x is not a numeric value, cannot add 2")
  }
  x + 2
}

# missing values
plot_x_y <- function(x, y) {
  if (missing(y)) {
    y <- x
    x <- seq_along(y)
  }
  plot(x, y)
}

plot_x_y(seq(1, 5))
# this will break the code, what to do?
# plot_x_y(y = seq(1, 5))

# ellipses, ...
to_list <- function(a = 1, b = 2, ...) {
  print(paste0("a = ", a))
  print(paste0("b = ", b))
  list(...)
}

# file_path
# combine all the arguments together
file_path <- function(..., fsep = .Platform$file.sep) {
  path <- file.path(..., fsep = fsep)
  path <- gsub(paste0(fsep, "{1,}"), fsep, path)
  path
}
file_path("a/", "/b")

