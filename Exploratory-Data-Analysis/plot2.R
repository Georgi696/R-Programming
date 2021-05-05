library(plyr)
library(ggplot2)
library(data.table)
library(grid)
library(scales)
library(httr)

dataLoad2 <- readRDS("./Source_Classification_Code.rds")
NEI <- readRDS("./data/NEI_data/summarySCC_PM25.rds")

BaltimoreData <- NEI[NEI$fips == "24510",]
png(filename = './Plot2.png', width = 480, height = 480, units = "px")
totalEmisionBaltimore <- aggregate(BaltimoreData$Emissions, list(BaltimoreData$year), FUN ="sum")


plot(totalEmisionBaltimore, type = "b", pch=13, col = "red", xlab = "Year", 
     main = expression('Total PM'[2.5]*" Emissionen in Baltimore City from 1999 2018"), 
     ylab = expression('Total PM'[2.5]*" Emissionen in tons"))

dev.off()

