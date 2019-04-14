## read data
source_data_file <- "data/household_power_consumption.txt"
source_data <- read.table(source_data_file,header=TRUE,sep=";",stringsAsFactors = FALSE)
working_dataset <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007"),]

## create plot
date_time <- strptime(paste(working_dataset$Date,working_dataset$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(working_dataset$Global_active_power)
png("plot2.png",width=480,height=480)
plot(date_time,global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()