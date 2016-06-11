data <- read.csv("relevant_data.csv", sep=";")

# Parse $Date and $Time together into an R date
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %T")

png(file="plot3.png")


with(data, {
    plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering");
    lines(datetime, Sub_metering_1, col="black");
    lines(datetime, Sub_metering_2, col="red");
    lines(datetime, Sub_metering_3, col="blue");
    legend("topright", 
           lwd=1,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"))
  }
)


dev.off()
