source("loadData.R")

png(filename = "plot5.png")

motor_scc <- filter(SCC, grepl("Motor", Short.Name))$SCC
motor_nei <- filter(NEI, SCC %in% motor_scc & fips == "24510")

with(motor_nei, {
  sums <- tapply(Emissions, year, sum);
  plot(names(sums), sums, type="n", ylab="Total motor-related emissions in Baltimore City, Maryland (tons)", xlab="Year", main="Question 5");
  points(names(sums), sums);
  lines(names(sums), sums)
})

dev.off() 
