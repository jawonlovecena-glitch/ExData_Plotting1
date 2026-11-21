Sys.setlocale("LC_TIME", "C")
zipFile <- "exdata_data_household_power_consumption.zip"
txtFile <- "household_power_consumption.txt"
if (!file.exists(txtFile)) {
    if (!file.exists(zipFile)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = zipFile, method = "curl")
    }
    unzip(zipFile)
}
data <- read.table(txtFile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subData <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
subData$Datetime <- strptime(paste(subData$Date, subData$Time), format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(subData$Datetime, subData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subData$Datetime, subData$Sub_metering_2, col = "red")
lines(subData$Datetime, subData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
