library(plyr)
library(ggplot2)
library(data.table)
library(grid)
library(scales)
library(httr)

SCC <- readRDS("./Source_Classification_Code.rds")
NEI <- readRDS("./data/NEI_data/summarySCC_PM25.rds")

baltimore <- NEI[NEI$fips == "24510",]
baltimore <- aggregate(Emissions ~ year, data = baltimore, FUN ="sum")
losangeles <- NEI[NEI$fips == "06037",]
losangeles <- aggregate(Emissions ~ year,data = losangeles, FUN ="sum")
baltimore$County <- "Baltimore"
losangeles$County <- "Los Angeles"

data <- rbind(baltimore,losangeles)

png(filename = './Plot6.png', width = 500, height = 480, units = "px")

ggplot(data, aes(x=factor(year), y=Emissions, fill=County)) + geom_bar(aes(fill = County), position = "dodge", stat="identity") + labs(x = "Year") + labs(y = expression("Total Emissions (in log scale) of PM"[2.5])) + xlab("year") + ggtitle(expression("Motor vehicle emission in Baltimore and Los Angeles")) + scale_y_continuous(trans = log_trans())
dev.off()