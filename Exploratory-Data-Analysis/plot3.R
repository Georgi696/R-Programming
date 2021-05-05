
dataLoad2 <- readRDS("./Source_Classification_Code.rds")
NEI <- readRDS("./data/NEI_data/summarySCC_PM25.rds")

BaltimoreData <- NEI[NEI$fips == "24510",]
BData <- ddply(BaltimoreData, .(type,year), summarize, totalEmision = sum(Emissions))

png(filename = './Plot3.png', width = 500, height = 480, units = "px")

ggplot(BData, aes(year, totalEmision, colour = type)) + geom_line() + geom_point() + 
      labs(title = expression('Total PM'[2.5]*"Emmision in Baltimore City, Maryland from 1999-2008"),
           x = "Year", y = expression('Total PM'[2.5]*"Emmissions in tons"))

dev.off()