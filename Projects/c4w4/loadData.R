# Download https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# and unzip

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library("dplyr")
library("ggplot2")
