# This one works. Imho, nicer than the provided example
# since it's harder to misuse.

makeVector <- function(x = numeric()) {
  m <- NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  mean <- function() {
    if ( is.null(m) ) {
      # Note that mean(x) would not work -- then the function would
      # call itself!
      m <<- base::mean(x)
    }
    m
  }
  
  list(set = set, get = get, mean = mean)
}