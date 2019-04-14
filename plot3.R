## read data
source_data_file <- "data/household_power_consumption.txt"
source_data <- read.table(source_data_file,header=TRUE,sep=";",stringsAsFactors = FALSE)
working_dataset <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007"),]

## create plot
date_time <- strptime(paste(working_dataset$Date,working_dataset$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(working_dataset$Global_active_power)
sub_metering1 <- as.numeric(working_dataset$Sub_metering_1)
sub_metering2 <- as.numeric(working_dataset$Sub_metering_2)
sub_metering3 <- as.numeric(working_dataset$Sub_metering_3)

png("plot3.png",width=480,height=480)
plot(date_time,sub_metering1,type="l", ylab="Energy Submetering", xlab="")
lines(date_time,sub_metering2,type="l",col="red")
lines(date_time,sub_metering3,type="l",col="blue")
legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()