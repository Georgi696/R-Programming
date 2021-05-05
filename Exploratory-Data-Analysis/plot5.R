
SCC <- readRDS("./Source_Classification_Code.rds")
NEI <- readRDS("./data/NEI_data/summarySCC_PM25.rds")

BaltimoreData <- NEI[NEI$fips == "24510" $ NEI$Type == "ON-ROAD",]
Motor <- ddply(BaltimoreData, .(type,year), summarize, totalEmision = sum(Emissions))

png(filename = './Plot5.png', width = 500, height = 480, units = "px")

ggplot(Motor, aes(year, totalEmision)) + geom_line(color = "green") + geom_point() + 
  labs(title = "Total Emmision from Motor Vehicles in Baltimore CIty",
       x = "Year", y = "Total Emmissions")

dev.off()