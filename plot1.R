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
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
