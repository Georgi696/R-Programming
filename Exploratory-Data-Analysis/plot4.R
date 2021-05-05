NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
Coal <- NEI[grep("Coal.*Comb", SCC$Short.Name),"SCC"]
CoalNei <- NEI[NEI$SCC %in% Coal,]
Tdata <- ddply(CoalNei, .(year), summarize, totalEmision = sum(Emissions))

png(filename = './Plot4.png', width = 500, height = 480, units = "px")

ggplot(Tdata, aes(year, totalEmision)) + geom_line(color = " red") + geom_point() + 
  labs(title = "Total Emissions from Coal Combustion-Related Sources",
       x = "Year", y = "Total Emissions")

dev.off()