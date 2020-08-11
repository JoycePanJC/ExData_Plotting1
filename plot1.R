data<-read.table("./household_power_consumption.txt",header = TRUE,sep=";")
data$newdate<-strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")
data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")
selected_data <- subset(data ,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

selected_data$Global_active_power<-as.numeric(selected_data$Global_active_power)

png("plot1.png", width = 480, height = 480)
par(mfrow=c(1,1))
plot(hist(selected_data$Global_active_power),xlab="Global Active Power (kilowatts)",ylab="Frequency",main ="Global Active Power",col="red")
dev.off()

