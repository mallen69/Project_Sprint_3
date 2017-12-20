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


#creating the variable "Aug_2016" to represent the "Real_CSV_EOC_Survey.CSV" which is my 
#existing Excel Dirty Data
Aug_2016 <- read.csv("Real_CSV_EOC_Survey.csv")

View(Aug_2016)




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

#To remove this particular column name (This was an extra column created by Survey Monkey,
#But this Instructor did not teach this particular collection period)
Aug_2016 <- subset(Aug_2016, select = -X.16)

#To Combine all the Instuctor Columns into one single column
Aug_2016$Instructor <- paste(Aug_2016$X.4,Aug_2016$X.6, Aug_2016$X.7, Aug_2016$X.8,Aug_2016$X.9,Aug_2016$X.10,Aug_2016$X.11,Aug_2016$X.13,
Aug_2016$X.14,Aug_2016$X.15,Aug_2016$X.17,Aug_2016$X.18) 

#To remove all the original Instructor columns.  And note it takes two closed parenthesis at the end
#and not one as the documentation showed
Aug_2016 <- subset( Aug_2016, select = -c( X.18 : X.4))

#To combine the columns of "where did you attend the training course" and X "Other" into a single column "Location" 
Aug_2016$Location <- paste(Aug_2016$Where.did.you.attend.the.training.course.,Aug_2016$X)

#To remove the original column "X" which was "Other" meaning not a defined training location  
Aug_2016 <- subset(Aug_2016, select = -X)

#To remove the original column "Where did you attend the training course" 
Aug_2016 <- subset(Aug_2016, select = -Where.did.you.attend.the.training.course.)

#To Copy the original column "What.training.course.did.you.attend" and "X.1" that Survey Monkey created for "Other"
#into a single Column "Course". 
Aug_2016$Course <- paste(Aug_2016$What.training.course.did.you.attend.,Aug_2016$X.1)

#To Remove the original column "What.training.course.did.you.attend" 
Aug_2016 <- subset(Aug_2016, select = -What.training.course.did.you.attend.)

#And to Remove the "X.1" Column that Survey Monkey created for "Other" courses attended
Aug_2016 <- subset(Aug_2016, select = -X.1)

#To Copy the original column "The.technical.details.in.the.course.were.appropriate.for.my.learning.
#.If.you.Disagree.or.Strongly.Disagree..please.also.mark.if.it.was.Too.Much.or.Too.Little.." and "X.21", "X.22", and "X.23"
#that Survey Monkey created for the answers into a single Column "Technical_Details".
Aug_2016$Technical_Details <- paste(Aug_2016$The.technical.details.in.the.course.were.appropriate.for.my.learning..If.you.Disagree.or.Strongly.Disagree..please.also.mark.if.it.was.Too.Much.or.Too.Little..,
Aug_2016$X.21,Aug_2016$X.22,Aug_2016$X.23)

#To delete the original column "The.technical.details.in.the.course.were.appropriate.for.my.learning.
#.If.you.Disagree.or.Strongly.Disagree..please.also.mark.if.it.was.Too.Much.or.Too.Little.." 
Aug_2016 <- subset(Aug_2016, select = -The.technical.details.in.the.course.were.appropriate.for.my.learning..If.you.Disagree.or.Strongly.Disagree..please.also.mark.if.it.was.Too.Much.or.Too.Little..)

#Delete Columns "X.21", "X.22", and "X.23" that Survey Monkey created for the answers.
Aug_2016 <- subset( Aug_2016, select = -c( X.23 : X.21))

#Delete Columns X.24, X.25, X.26 for Too Little and Comments
Aug_2016 <- subset( Aug_2016, select = -c( X.26 : X.24))


#Renaming first Column to Start_Date
names(Aug_2016)[1] <- "Start_Date"

#Renaming second Column to End_Date  (This column is being kept in case I want to calculate time for the actual survey to complete)
names(Aug_2016)[2] <- "End_Date"

#Renaming third Column to Company
names(Aug_2016)[3] <- "Company"

#Renaming fourth Column to Lecture
names(Aug_2016)[4] <- "Lecture"

#Renaming fifth Column to Lecture
names(Aug_2016)[5] <- "Lecture_Comments"

#Renaming sixth Column to Responsive 
names(Aug_2016)[6] <- "Responsive"

#Renaming seventh Column to Responsive_Comments
names(Aug_2016)[7] <- "Responsive_Comments"

#Renaming eighth Column to Student_Guide
names(Aug_2016)[8] <- "Student_Guide"

#Renaming ninth Column to Guide_Comment
names(Aug_2016)[9] <- "Guide_Comment"

#Renaming tenth Column to Lab_Exercises
names(Aug_2016)[10] <- "Lab_Exercises"

#Renaming eleventh Column to Lab_Comments
names(Aug_2016)[11] <- "Lab_Comments"

#Renaming twelfth Column to Classroom
names(Aug_2016)[12] <- "Classroom"

#Renaming thirteenth Column to Classroom_Comments
names(Aug_2016)[13] <- "Classroom_Comments"

#Renaming fourteenth Column to Computer 
names(Aug_2016)[14] <- "Computer"

#Renaming fifteenth Column to Computer_Comments 
names(Aug_2016)[15] <- "Computer_Comments"

#Renaming sixteenth Column to Network 
names(Aug_2016)[16] <- "Network"

#Renaming sixteenth Column to Network 
names(Aug_2016)[16] <- "Network"

#Renaming seventeenth Column to Network_Comments 
names(Aug_2016)[17] <- "Network_Comments"

#Renaming eighteenth Column to See_Hear  
names(Aug_2016)[18] <- "See_Hear"

#Renaming nineteenth Column to See_Hear_Comments  
names(Aug_2016)[19] <- "See_Hear_Comments"

#Renaming twentieth Column to Experience  
names(Aug_2016)[20] <- "Years_Experience"

#Renaming twenty first Column to IP_or_Telephony  
names(Aug_2016)[21] <- "Experience_Comments"

#Renaming twenty second Column to IP_or_Telephony_Background    
names(Aug_2016)[22] <- "IP_or_Telephony_Background"

#Renaming twenty third Column to Background_Comments    
names(Aug_2016)[23] <- "Background_Comments"

#Renaming twenty fourth Column to Had_Knowledge_Skills    
names(Aug_2016)[24] <- "Had_Knowledge_Skills"

#Renaming twenty fifth Column to Knowledge_Skills_Comments    
names(Aug_2016)[25] <- "Knowledge_Skills_Comments"

#Renaming twenty Sixth Column to Metaswitch_Experience    
names(Aug_2016)[26] <- "Metaswitch_Experience"

#Renaming twenty seventh Column to Metaswitch_Exp_Comments    
names(Aug_2016)[27] <- "Metaswitch_Exp_Comments"

#Renaming twenty eight Column to Attended_Appropriate_Time     
names(Aug_2016)[28] <- "Attended__Appropriate_Time"

#Renaming twenty ninth Column to Appropriate_Time_Comments     
names(Aug_2016)[29] <- "Appropriate_Time_Comments"

#Renaming thirtieth Column to Learned_What_I_Needed     
names(Aug_2016)[30] <- "Learned_What_I_Needed"

#Renaming thirty first Column to Learned_Comment     
names(Aug_2016)[31] <- "Learned_Comment"

#Renaming thirty second Column to Recommend_Class     
names(Aug_2016)[32] <- "Recommend_Class"

#Renaming thirty third Column to Recommend_Comments     
names(Aug_2016)[33] <- "Recommend_Comments"

#Renaming thirty fourth Column to Feedback     
names(Aug_2016)[34] <- "Feedback"


#Write the Cleaned Tidy Data from R back to a CSV File (named Tidy_Data_August_2016)
write.csv(Aug_2016, "Tidy_Data_Aug_2016.csv")

#View the Dataset (Data.frame / Table)
View(Aug_2016)


