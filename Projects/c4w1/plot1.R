data <- read.csv("relevant_data.csv", sep=";")
png(file="plot1.png")


hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")


dev.off()
