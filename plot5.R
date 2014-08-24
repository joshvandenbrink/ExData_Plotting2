# Load the Source Classification Code Table data
NEI <- readRDS("summarySCC_PM25.rds")

# Load the PM2.5 Emissions Data 
SCC <- readRDS("Source_Classification_Code.rds")

# Get Baltimore emissions from motor vehicle sources
baltimore <- NEI[NEI$fips=="24510",] & (NEI$type=="ON-ROAD"),]
baltimore2 <- aggregate(Emissions ~ year, data=baltimore, FUN=sum)

# plot the baltimore motor vehicle sources
library(ggplot2)
png("plot5.png")
ggplot(baltimore2, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")
dev.off()




