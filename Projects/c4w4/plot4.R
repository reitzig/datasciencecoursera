source("loadData.R")

png(filename = "plot4.png")

coal_scc <- filter(SCC, grepl("Coal", Short.Name))$SCC
coal_nei <- filter(NEI, SCC %in% coal_scc)

with(coal_nei, {
  sums <- tapply(Emissions, year, sum);
  plot(names(sums), sums, type="n", ylab="Total coal-related emissions (tons)", xlab="Year", main="Question 4");
  points(names(sums), sums);
  lines(names(sums), sums)
})

dev.off() 
