# Load the Source Classification Code Table data
NEI <- readRDS("summarySCC_PM25.rds")

# Load the PM2.5 Emissions Data 
SCC <- readRDS("Source_Classification_Code.rds")

# Narrow the results to just the baltimore emissions
baltimore <- NEI[NEI$fips=="24510",]

# Group data by year and type of the source
baltimore2 <- aggregate(Emissions ~ year + type, data=baltimore, FUN=sum)

# Plot the new baltimore data
library(ggplot2)
png("plot3.png", height=480, width=480)
ggplot(baltimore2, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ", "City by various sources", sep="")))


dev.off()