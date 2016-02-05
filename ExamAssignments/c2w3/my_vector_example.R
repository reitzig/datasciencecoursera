makeVector <- function(x = numeric()) {
  list(val = x, mean = NULL)
}

# Doesn't work! This only updates the function-local (copy of?) x
cachedMean <- function(x, ...) {
  if ( is.null(x$mean) ) {
    message("computing mean")
    x$mean <- mean(x$val, ...)
  }
  
  x$mean
}