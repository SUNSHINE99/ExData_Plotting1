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


# Creating POSIXct format from two fields(Date and Time)
dt <- paste(as.Date(twoDaysData$Date,"%d/%m/%Y"), twoDaysData$Time, "%H:%M:%S")
twoDaysData$DT <- as.POSIXct(dt)


# Plotting to png deivce
png(file="plot3.png", height=480,width=480)

# Constructing plot from the available data

# In this plot we are plotting Sub_metering against 
# DateTime(1 minute sampling for 2 days). The type is line 
# instead of default open circle. As base plotting is incremental
# We are adding Sub_metering_2 and Sub_metering_3 on top of the
# Sub_metering_1.
with(twoDaysData, plot(DT, as.numeric(Sub_metering_1), type="l",
                       col = "black",
                       xlab= "",
                       ylab="Energy Sub Metering "))
with(twoDaysData, lines(DT, Sub_metering_2, type="l", col="red"))
with(twoDaysData, lines(DT, Sub_metering_3, type="l", col="blue"))
  
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()

