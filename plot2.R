# Load the Source Classification Code Table data
NEI <- readRDS("summarySCC_PM25.rds")

# Load the PM2.5 Emissions Data 
SCC <- readRDS("Source_Classification_Code.rds")

# Narrow the results to just the baltimore emissions
baltimore <- NEI[NEI$fips=="24510",]

# calculate the sum of emissions for each year
total.emissions <- aggregate(Emissions ~ year, baltimore, sum)

# create a png file
png('plot2.png')

# Create a bar plot of the data for each year in Baltimore
barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
        xlab="years", ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total Annual PM'[2.5]*' emissions - Baltimore'))


dev.off()