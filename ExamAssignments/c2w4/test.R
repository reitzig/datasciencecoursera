source("assignment.R")

print("Part Two")
print(best("TX", "heart attack"))
print(best("TX", "heart failure"))
print(best("MD", "heart attack"))
print(best("MD", "pneumonia"))

tryCatch(best("BB", "heart attack"), error = function(e) print(e))
tryCatch(best("NY", "hert attack"), error = function(e) print(e))

print("Part Three")
print(rankhospital("TX", "heart failure", 4))
print(rankhospital("MD", "heart attack", "worst"))
print(rankhospital("MN", "heart attack", 5000))

print("Part Four")
print(head(rankall("heart attack", 20), 10))
print(tail(rankall("pneumonia", "worst"), 3))
print(tail(rankall("heart failure"), 10))
