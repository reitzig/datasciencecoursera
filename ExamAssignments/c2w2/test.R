# Cf https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fpollutantmean-demo.html
print("Testing Part 1")
source("pollutantmean.R")

# Run the examples
print(pollutantmean("specdata", "sulfate", 1:10))
print("Expected: 4.064")
print("- - -")
print(pollutantmean("specdata", "nitrate", 70:72))
print("Expected: 1.706")
print("- - -")
print(pollutantmean("specdata", "nitrate", 23))
print("Expected: 1.281")

print("- - - - - - - - - - - - - - - - - - - -")

# Cf https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fcomplete-demo.html
print("Testing Part 2")
source("complete.R")

# Run the examples
print(complete("specdata", 1))
ex <- data.frame(1,117)
names(ex) <- c("id", "nobs")
print("Expected: ")
print(ex)

print("- - -")

print(complete("specdata", c(2, 4, 8, 10, 12)))
ex <- data.frame(c(2,4,8,10,12), c(1041,474,192,148,96))
names(ex) <- c("id", "nobs")
print("Expected: ")
print(ex)

print("- - -")

print(complete("specdata", 30:25))
ex <- data.frame(c(30,29,28,27,26,25), c(932,711,475,338,586,463))
names(ex) <- c("id", "nobs")
print("Expected: ")
print(ex)

print("- - -")

print(complete("specdata", 3))
ex <- data.frame(3,243)
names(ex) <- c("id", "nobs")
print("Expected: ")
print(ex)


print("- - - - - - - - - - - - - - - - - - - -")

# Cf https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fcorr-demo.html
print("Testing Part 3")
source("corr.R")

# Run the examples
cr <- corr("specdata", 150)
print(head(cr))
print("Expected: [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589")
print(summary(cr))
print("Expected: -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630")

print("- - -")

cr <- corr("specdata", 400)
print(head(cr))
print("Expected: [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783")
print(summary(cr))
print("Expected: -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630")

print("- - -")

cr <- corr("specdata", 5000)
print(summary(cr))
print("Expected: ")
print(length(cr))
print("Expected: [1] 0")

print("- - -")

cr <- corr("specdata")
print(summary(cr))
print("Expected: -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000")
print(length(cr))
print("Expected: [1] 323")
