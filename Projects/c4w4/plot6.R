source("loadData.R")

png(filename = "plot6.png")

motor_scc <- filter(SCC, grepl("Motor", Short.Name))$SCC
motor_nei <- filter(NEI, SCC %in% motor_scc & (fips == "24510" | fips == "06037")) %>%
              group_by(fips, year) %>%
              summarize(sum = sum(Emissions)) 

ggplot(motor_nei, aes(year, sum)) +
  geom_point(aes(color = fips)) +
  geom_line(aes(color = fips)) +
  labs(x = "Year", y = "Total motor-related emissions (tons)", title = "Question 6") +
  scale_color_discrete(name="Area", 
                       breaks = c("24510", "06037"),
                       labels = c("Baltimore City, Maryland", "Los Angeles County, California")) +
  theme(legend.position="bottom")

dev.off() 
