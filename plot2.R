
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table('household_power_consumption.txt', 
	header=TRUE,
	sep=';', 
	colClasses = c('myDate','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric'),
	na.strings='?');
	
data <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),];
	
data$DateAndTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S");

png('plot2.png', width = 480, height = 480);

#global active power plot
plot(data$DateAndTime,
	 data$Global_active_power, 
	 type='l',
	 xlab="", 
	 ylab="Global Active Power (killowatts)");
 
dev.off();

