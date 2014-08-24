# Load the Source Classification Code Table data
NEI <- readRDS("summarySCC_PM25.rds")

# Load the PM2.5 Emissions Data 
SCC <- readRDS("Source_Classification_Code.rds")

# Find coal combustion-related sources
combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]

# Find emissions from coal combustion-related sources
emissions <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

# group by year
emissions.by.year <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

# plot
library(ggplot2)
png("plot4.png")
ggplot(emissions.by.year, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from coal-related sources")
dev.off()