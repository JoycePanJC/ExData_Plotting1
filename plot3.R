data<-read.table("./household_power_consumption.txt",header = TRUE,sep=";")
data$newdate<-strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")
data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")
selected_data <- subset(data ,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

selected_data$Global_active_power<-as.numeric(selected_data$Global_active_power)


png("plot3.png", width = 480, height = 480)
plot(y=selected_data$Sub_metering_1 ,x=selected_data$newdate, type="l",ylab="Energy sub metering",xlab="")

lines(y=selected_data$Sub_metering_2,x=selected_data$newdate, type = "l", col = "red")
lines(y=selected_data$Sub_metering_3,x=selected_data$newdate, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2.5)
dev.off()