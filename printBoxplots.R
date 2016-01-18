#########################################
# Maria Stalteri
# 23/12/2014
# printBoxPlots.R
#########################################
# fifth script in series to process
# Nanostring data;
#########################################
# print boxplots of 
# 1. the raw data,
# 2. data after normalizing by PLNF
#    and subtracting negative controls
# 3. data as fraction of lane totals
#
# R supports figures in the following formats:
# bmp, jpeg, png, and tiff
#
# not sure what format was previously used in the lab,
# I previously used png,
# this time will use tiff 
#########################################
# data for the cng time course, 3 cartridges
#
# 1. raw data 

cng.time.course.labels<-colnames(cng.raw.endog.time.course.df)[2:37]

tiff(file="boxplots_cng_time_course_raw_data.tiff")

# this gives warnings about 'outlier(-Inf) not drawn',
# because there are counts of zero, and log(0) is -Inf,
# but it produces the plot anyway;

# plot notes from:
# http://www.statmethods.net/advgraphs/axes.html

# to put axes labels perpendicular you need an
# axis() command following the boxplot command,
# so need to suppress the automatic axis generation,
# axes=FALSE in the boxplot() command suppresses both x and y axes
# xaxt="n" suppresses x-axis only

# problem: sample names overlap with the x-axis label,
# so leave out x-axis label until I figure out how
# to place it lower down in the plot

boxplot(log2(cng.raw.endog.time.course.df[,2:37]),
      main = "Cng Time Course - Boxplots of Raw Data",
#     xlab = "Sample Name",
      ylab="Log2 raw counts",
      xaxt="n")

# the axis() command
# first parameter, side, an integer,  
# 1=bottom
# this gives sample numbers 1 to 36
# 'axis(1, las=2)'
# can't get it to work,
# axis(1, las=2, labels=cng.time.course.labels)

# getting error msg
# Error in axis(1, las = 2, labels = cng.time.course.labels) : 
#  'labels' is supplied and not 'at'

# sorted
axis(1, las=2, at=1:36, labels=cng.time.course.labels)

dev.off()

##########################################################
# 2. PLNF normalised and neg cts subtracted data

tiff(file="boxplots_cng_time_course_PLNF_neg_ctrl_norm_data.tiff")

# Problem, Plot is cutting off very long plot title at edges;
# tiff plots are being printed larger than the png plots;

# Check data, this should be after adding 1 to everything,
# but graph is showing outliers at 0;
# it's fine log2(1) is zero.

boxplot(log2(cng.norm.plus.one.endog.time.course.round.df[,2:37]),
      main = "Cng Time Course - Boxplots of Data After PLNF Normalisation and Subtraction of Neg Ctrls",
#     xlab = "Sample Name",
      ylab="Log2  counts",
      xaxt="n")

axis(1, las=2, at=1:36, labels=cng.time.course.labels)
dev.off()

###########################################################
# 3. Counts as fraction of lane totals
tiff(file="boxplots_cng_time_course_as_fraction_of_lane_tot2.tiff")

# when  printing file as tiff it cuts off the edges of the plot
# title, so give it a shorter name
boxplot(log2(cng.time.course.endog.as.fraction.of.tot.df[,2:37]),
      main = "Cng Time Course - Counts as Fractions of Lane Totals",
#     main = "Cng Time Course - Boxplots of Data Normalised as Fractions of Lane Totals",
#     xlab = "Sample Name",
      ylab="Log2  counts",
      xaxt="n")

axis(1, las=2, at=1:36, labels=cng.time.course.labels)
dev.off()
############################################################
# save R commands
savehistory(file="boxplotsOfFinalData_20141223.Rhistory")

# save R environment (the R data objects)
save.image(file="boxplotsOfFinalData_20141223.RData")
############################################################
 
