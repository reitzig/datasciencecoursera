source("loadData.R")

png(filename = "plot3.png")

# Prepare data for plotting
data <- filter(NEI, fips == "24510")  %>%
        group_by(type, year)          %>% 
        summarize(sum = sum(Emissions))

ggplot(data, aes(year, sum)) +
  geom_point(color = "blue") +
  geom_line(color = "gray")  +
  facet_grid( . ~ type)      +
  labs(x = "Year", y = "Total emissions Baltimore City, Maryland (tons)", title = "Question 3")

dev.off() 
