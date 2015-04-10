
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table('household_power_consumption.txt', 
	header=TRUE,
	sep=';', 
	colClasses = c('myDate','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric'),
	na.strings='?');
	
data <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),];
	
data$DateAndTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S");

png('plot4.png', width = 480, height = 480);

old.par <- par(mfrow=c(2,2)); #2 rows, 2 col


#global active power plot
plot(data$DateAndTime,
	 data$Global_active_power, 
	 type='l',
	 xlab="", 
	 ylab="Global Active Power (killowatts)");

#voltage plot
plot(data$DateAndTime,
	 data$Voltage, 
	 type='l',
	 xlab="datetime", 
	 ylab="Voltage");

# energy sub metering
plot(data$DateAndTime,
	data$Sub_metering_1, 
	type='l',
	xlab="", 
	ylab="energy sub metering", 
	ylim=(c(0.0, max(data$Sub_metering_1))));
 
par(new=T); # the next plot is part of the same graph
plot(data$DateAndTime,
	data$Sub_metering_2, 
	type='l',
	xlab="", 
	ylab="energy sub metering", 
	col='red', 
	ylim=(c(0.0, max(data$Sub_metering_1))));

par(new=T); # the next plot is part of the same graph
plot(data$DateAndTime,
	data$Sub_metering_3, 
	type='l',
	xlab="", 
	ylab="energy sub metering", 	
	col='blue', 
	ylim=(c(0.0, max(data$Sub_metering_1))));

#place the ledgends for the graph
legend("topright",
	c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
	lty=c(1,1,1), 
	col=c('black','red','blue'));

par(new=F); # a new graph
plot(data$DateAndTime, 
		data$Global_reactive_power, 
		type='l', 
		xlab='datatime', 
		ylab='Global_reactive_pwoer');
 
#reset parameters to what they were before we started
par(old.par);
 
dev.off();

