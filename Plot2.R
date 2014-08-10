# Read the data from the unzipped file. I include this lines in all four R scripts

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")

# Assign the correct date and time formats to the variables in the data frame

fecha <- data$Date
hora <- data$Time
fechahora <- paste(fecha, hora)
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Time <- strptime (fechahora, "%d/%m/%Y %H:%M:%S")

# Subsetting the data frame with the correct dates. Alternatively
# we could have skipped initial rows and subset a number of rows (2880)

data2 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Open the png device and plot the graph - do not forget to call dev.off() !!!

png(filename = 'Plot2.png', width = 480, height = 480, units = 'px')
# background could be set to transparent as in dir 'figure' with par(bg="transparent")
# but it is not straightforward to see in the github directory so I leave it in "white"


plot( data2$Time,data2$Global_active_power,type="l" , xlab = "",
      ylab = "Global Active Power (kilowatts)" )

dev.off()
