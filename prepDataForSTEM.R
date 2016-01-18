######################################
# Maria Stalteri
# 27/12/2014
# prepDataForSTEM.R
######################################
# prepare data to use with the STEM
# software for analysis of time-course data
#
# need to put replicates one at a time,
# so make time-course file of six time-points
# with one replicate each;
# so have 3 files for Induced,
# and 3 files for Uninduced;
#####################################
# the files printed with write.table() have
# 1. row numbers, stem can use these as IDs
# 2. gene names as the second column
#
# 3. not sure if column headers will be a problem
#######################################
# make a data.frame wih the 6 time points
# for cng induced replicate 1,
# print it with write.table,
# try running stem on it
######################################
# use the gene counts as fractions of lane totals data
# BUT the data was normalised, not log2 converted
#####################################
# what to do,
# data is PLNF normalised, background corrected,
# and coorected by lane totals
#
# 2 options:
# 1. use the data as fraction of lane totals
# 2. use background corrected data without dividing by lane totals
 
##########################################
# 1. use lane totals
# A. make data.frame

cng.time.course.as.fract.ind.rep1<- 
    data.frame(cng.time.course.endog.as.fraction.of.tot.df$genes,
       cng.time.course.endog.as.fraction.of.tot.df$I1h01,
       cng.time.course.endog.as.fraction.of.tot.df$I3h01,
       cng.time.course.endog.as.fraction.of.tot.df$I5h01,
       cng.time.course.endog.as.fraction.of.tot.df$I7h01,
       cng.time.course.endog.as.fraction.of.tot.df$I9h01,
       cng.time.course.endog.as.fraction.of.tot.df$I12h01)

# to check that it is OK

# should be data.frame
class(cng.time.course.as.fract.ind.rep1)

# should be 386 rows, 7 cols
dim(cng.time.course.as.fract.ind.rep1)

colnames(cng.time.course.as.fract.ind.rep1)

# unfortunately these come out as great big long names
# [1] "cng.time.course.endog.as.fraction.of.tot.df.genes" 
# [2] "cng.time.course.endog.as.fraction.of.tot.df.I1h01" 

# want to make shorter colnames
colnames(cng.time.course.as.fract.ind.rep1) <-
   c("genes", "I1h01", "I3h01", "I5h01", "I7h01", "I9h01", "I12h01")

# check again
colnames(cng.time.course.as.fract.ind.rep1)   
cng.time.course.as.fract.ind.rep1[1:5, 1:7]

# write it to a file
write.table(cng.time.course.as.fract.ind.rep1,
  file="cng_time_course_as_fract_Induced_rep1.txt",
   sep="\t", row.names=TRUE, col.names=NA, quote=FALSE)

################################################
# this worked with STEM, so do the second replicate

cng.time.course.as.fract.ind.rep2<-
    data.frame(cng.time.course.endog.as.fraction.of.tot.df$genes,
       cng.time.course.endog.as.fraction.of.tot.df$I1h02,
       cng.time.course.endog.as.fraction.of.tot.df$I3h02,
       cng.time.course.endog.as.fraction.of.tot.df$I5h02,
       cng.time.course.endog.as.fraction.of.tot.df$I7h02,
       cng.time.course.endog.as.fraction.of.tot.df$I9h02,
       cng.time.course.endog.as.fraction.of.tot.df$I12h02)

# to check that it is OK

# should be data.frame
class(cng.time.course.as.fract.ind.rep2)

# should be 386 rows, 7 cols
dim(cng.time.course.as.fract.ind.rep2)

colnames(cng.time.course.as.fract.ind.rep2)

# assign shorter colnames
colnames(cng.time.course.as.fract.ind.rep2) <-
   c("genes", "I1h02", "I3h02", "I5h02", "I7h02", "I9h02", "I12h02")

write.table(cng.time.course.as.fract.ind.rep2,
  file="cng_time_course_as_fract_Induced_rep2.txt",
   sep="\t", row.names=TRUE, col.names=NA, quote=FALSE)

##############################################
# 3rd replicate

cng.time.course.as.fract.ind.rep3<-
    data.frame(cng.time.course.endog.as.fraction.of.tot.df$genes,
       cng.time.course.endog.as.fraction.of.tot.df$I1h03,
       cng.time.course.endog.as.fraction.of.tot.df$I3h03,
       cng.time.course.endog.as.fraction.of.tot.df$I5h03,
       cng.time.course.endog.as.fraction.of.tot.df$I7h03,
       cng.time.course.endog.as.fraction.of.tot.df$I9h03,
       cng.time.course.endog.as.fraction.of.tot.df$I12h03)


colnames(cng.time.course.as.fract.ind.rep3) <-
   c("genes", "I1h03", "I3h03", "I5h03", "I7h03", "I9h03", "I12h03")

write.table(cng.time.course.as.fract.ind.rep3,
  file="cng_time_course_as_fract_Induced_rep3.txt",
   sep="\t", row.names=TRUE, col.names=NA, quote=FALSE)

#############################################
# do the 3 files for the uninduced

cng.time.course.as.fract.un.rep1<-
    data.frame(cng.time.course.endog.as.fraction.of.tot.df$genes,
       cng.time.course.endog.as.fraction.of.tot.df$U1h01,
       cng.time.course.endog.as.fraction.of.tot.df$U3h01,
       cng.time.course.endog.as.fraction.of.tot.df$U5h01,
       cng.time.course.endog.as.fraction.of.tot.df$U7h01,
       cng.time.course.endog.as.fraction.of.tot.df$U9h01,
       cng.time.course.endog.as.fraction.of.tot.df$U12h01)

colnames(cng.time.course.as.fract.un.rep1) <-
   c("genes", "U1h01", "U3h01", "U5h01", "U7h01", "U9h01", "U12h01")

write.table(cng.time.course.as.fract.un.rep1,
  file="cng_time_course_as_fract_Uninduced_rep1.txt",
   sep="\t", row.names=TRUE, col.names=NA, quote=FALSE)


cng.time.course.as.fract.un.rep2<-
    data.frame(cng.time.course.endog.as.fraction.of.tot.df$genes,
       cng.time.course.endog.as.fraction.of.tot.df$U1h02,
       cng.time.course.endog.as.fraction.of.tot.df$U3h02,
       cng.time.course.endog.as.fraction.of.tot.df$U5h02,
       cng.time.course.endog.as.fraction.of.tot.df$U7h02,
       cng.time.course.endog.as.fraction.of.tot.df$U9h02,
       cng.time.course.endog.as.fraction.of.tot.df$U12h02)

colnames(cng.time.course.as.fract.un.rep2) <-
   c("genes", "U1h02", "U3h02", "U5h02", "U7h02", "U9h02", "U12h02")

write.table(cng.time.course.as.fract.un.rep2,
  file="cng_time_course_as_fract_Uninduced_rep2.txt",
   sep="\t", row.names=TRUE, col.names=NA, quote=FALSE)

cng.time.course.as.fract.un.rep3<-
    data.frame(cng.time.course.endog.as.fraction.of.tot.df$genes,
       cng.time.course.endog.as.fraction.of.tot.df$U1h03,
       cng.time.course.endog.as.fraction.of.tot.df$U3h03,
       cng.time.course.endog.as.fraction.of.tot.df$U5h03,
       cng.time.course.endog.as.fraction.of.tot.df$U7h03,
       cng.time.course.endog.as.fraction.of.tot.df$U9h03,
       cng.time.course.endog.as.fraction.of.tot.df$U12h03)

colnames(cng.time.course.as.fract.un.rep3) <-
   c("genes", "U1h03", "U3h03", "U5h03", "U7h03", "U9h03", "U12h03")

write.table(cng.time.course.as.fract.un.rep3,
  file="cng_time_course_as_fract_Uninduced_rep3.txt",
   sep="\t", row.names=TRUE, col.names=NA, quote=FALSE)


###############################################
# save commands and R environment

savehistory(file="printedTablesForSTEM_20141230.Rhistory")
save.image(file="printedTablesForSTEM_20141230.RData")
