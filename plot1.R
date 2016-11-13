setwd("Z:/Data Science/Exploratory Data Analysis/week1/project")

# Reading the data from the txt file, totalData represents power cosumption 
# of a household over one minute sampling for 4 years.
totalData <- read.table("household_power_consumption.txt",sep=';',
                        header = TRUE, stringsAsFactors = FALSE)

# subsetting to read only two days power consumption. Here I am comparing
# Date as a string.
 twoDaysData<- subset(totalData, Date == "1/2/2007" | Date == "2/2/2007")
 
# Removing totalData as we don't need them anymore for this part of the
# assignment.
rm(totalData)

# Subsetting only the Global_active_power form twoDaysData and converting it 
# into the numeric type as the type of the global_active_power is in character.
class(twoDaysData$Global_active_power)

# Plotting to png deivce
png(file="plot1.png", height=480,width=480)

# Constructing histogram from the available data
hist(as.numeric(twoDaysData$Global_active_power), 
     col="red", 
     xlab="Global Active Power (Killowatts)",
     main = "Global Active Power")
dev.off()

