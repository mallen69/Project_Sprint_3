# The start of working with Dirty Data and making it tidy.  
# The data is "real" Excel End of Course Survey data from Survey Monkey from the dates of
# February 2016 through August 2016

#Getting my working Directory Info
getwd()

#Setting my working Directory in order to be in the folder where my Dirty Excel file is.
setwd("C:/Users/micha/Desktop/DevLeague Begins Nov 7 2017/Project_Sprint_3/")

#confirming my working directory is correct
getwd()

#reading my Dirty Excel file into R and then viewing it.
read.csv("Real_CSV_EOC_Survey.csv")

#creating the variable "Aug_2016" to represent the "Real_CSV_EOC_Survey.CSV" which is my 
#existing Excel Dirty Data
Aug_2016 <- read.csv("Real_CSV_EOC_Survey.csv")


#To remove the first column name try this
Aug_2016 <- subset( Aug_2016, select = -Respondent.ID )

#To remove the next column name try this
Aug_2016 <- subset( Aug_2016, select = -Collector.ID )

#To remove this particular column name which isn't next do this
Aug_2016 <- subset(Aug_2016, select = -IP.Address )


#To remove this particular column name which isn't next do this
Aug_2016 <- subset(Aug_2016, select = -Email.Address )


#To remove this particular column name 
Aug_2016 <- subset(Aug_2016, select = -First.Name )

#To remove this particular column name  (This is an extra column added by Survey Monkey)
Aug_2016 <- subset(Aug_2016, select = -Last.Name )  

#To remove this particular column name (This is an extra column added by Survey Monkey)
Aug_2016 <- subset(Aug_2016, select = -Custom.Data.1 )

#To remove this particular column name (No need to display Student names for this purpose)
Aug_2016 <- subset(Aug_2016, select = -What.is.your.name..optional..)

#To remove this particular column name
Aug_2016 <- subset(Aug_2016, select = -Who.was.your.training.instructor.s..)

#To remove this particular column name (This was an extra column created by Survey Monkey,
#But this Instructor is no longer with the company)
Aug_2016 <- subset(Aug_2016, select = -X.2)

#To remove this particular column name (This was an extra column created by Survey Monkey,
#But this Instructor did not teach this particular collection period)
Aug_2016 <- subset(Aug_2016, select = -X.3)

#To remove this particular column name (This was an extra column created by Survey Monkey,
#But this Person no longer teaches)
Aug_2016 <- subset(Aug_2016, select = -X.5)

#To remove this particular column name (This was an extra column created by Survey Monkey,
#But this Instructor did not teach this particular collection period)
Aug_2016 <- subset(Aug_2016, select = -X.12)



