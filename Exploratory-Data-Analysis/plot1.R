
library(plyr)
library(ggplot2)
library(data.table)
library(grid)
library(scales)
library(httr)

dataLoad1 <- readRDS("./summarySCC_PM25.rds")

png(filename = './Plot1.png', width = 480, height = 480, units = "px")
totalEmision <- aggregate(NEI$Emissions, list(NEI$year), FUN ="sum")

plot(totalEmision, type = "b", pch=13, col = "red", xlab = "Year", 
     main = expression('Total PM'[2.5]*" Emissionen in the USA from 1999 2018"), 
     ylab = expression('Total PM'[2.5]* " Emissionen in tons"))
dev.off()

