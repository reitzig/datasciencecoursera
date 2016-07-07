source("loadData.R")

png(filename = "plot2.png")

with(NEI[NEI$fips == "24510",], {
  sums <- tapply(Emissions, year, sum);
  plot(names(sums), sums, type="n", ylab="Total emissions Baltimore City, Maryland (tons)", xlab="Year", main="Question 2");
  points(names(sums), sums);
  lines(names(sums), sums)
})

dev.off() 
