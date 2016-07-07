source("loadData.R")

png(filename = "plot1.png")

with(NEI, {
  sums <- tapply(Emissions, year, sum);
  plot(names(sums), sums, type="n", ylab="Total emissions (tons)", xlab="Year", main="Question 1");
  points(names(sums), sums);
  lines(names(sums), sums)
})

dev.off() 
