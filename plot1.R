## read data
source_data_file <- "data/household_power_consumption.txt"
source_data <- read.table(source_data_file,header=TRUE,sep=";",stringsAsFactors = FALSE)
working_dataset <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007"),]

## create hist 
global_active_power<-as.numeric(working_dataset$Global_active_power)
png("plot1.png",width=480,height=480)
hist(global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
