
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table('household_power_consumption.txt', 
	header=TRUE,
	sep=';', 
	colClasses = c('myDate','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric'),
	na.strings='?');
	
data <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),];
	
data$DateAndTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S");

png('plot3.png', width = 480, height = 480);


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
 
dev.off();

