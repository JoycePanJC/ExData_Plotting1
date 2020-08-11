data<-read.table("./household_power_consumption.txt",header = TRUE,sep=";")
data$newdate<-strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")
data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")
selected_data <- subset(data ,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

selected_data$Global_active_power<-as.numeric(selected_data$Global_active_power)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(y=(selected_data$Global_active_power),x=selected_data$newdate,ylab="Global Active Power",xlab="",col="black",type="l",lwd=1)

with(selected_data,plot(newdate,Voltage,type="l",xlab="datetime"))
with(selected_data,plot(newdate,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(selected_data$newdate,selected_data$Sub_metering_2,col="red")

lines(selected_data$newdate,selected_data$Sub_metering_3,col="blue")
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
with(selected_data,plot(newdate,Global_reactive_power,type="l",xlab="datetime"))

dev.off()