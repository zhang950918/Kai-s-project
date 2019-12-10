# Class Project

hivdata1<-read.csv("hiv data.csv")

data(hivdata1)
# Import data into Rstudio
# The data consists of different category
# It is better to divide data into 4 tables

str(hivdata1)
# know the structure of data

Age<-hivdata1[1:105,]
Gender<-hivdata1[106:140,]
race<-hivdata1[141:196,]
transmission<-hivdata1[197:315,]
# Now that dataset has been divided into 4
# smaller tables, we can do some analysis

Age2011<-Age[1:15,]
Age2012<-Age[16:30,]
Age2013<-Age[31:45,]
Age2014<-Age[46:60,]
Age2015<-Age[61:75,]
Age2016<-Age[76:90,]
Age2017<-Age[91:105,]

str(Age2011)

p1<-sum(Age2011$Count, na.rm = FALSE)
# [1] 118487

p2<-sum(Age2012$Count, na.rm = FALSE)
# [1] 121587

p3<-sum(Age2013$Count, na.rm = FALSE)
# [1] 124235

p4<-sum(Age2014$Count, na.rm = FALSE)
# [1] 126376

p5<-sum(Age2015$Count, na.rm = FALSE)
# [1] 129316

p6<-sum(Age2016$Count, na.rm = FALSE)
# [1] 132908

p7<-sum(Age2017$Count, na.rm = FALSE)
# [1] 135082

population<-matrix(c(p1,p2,p3,p4,p5,p6,p7), ncol = 7, byrow = TRUE)
rownames(population)<-c("total count")
colnames(population)<-c(2011, 2012, 2013, 2014, 2015, 2016, 2017)
population
# Create a matrix showing total count for each year

populationdf<-as.data.frame(population)

plot(populationdf)

plot(Age2011$Group,Age2011$Count,xlab="age group",ylab="number of people diagnosed")
plot(Age2012$Group,Age2012$Count,xlab="age group",ylab="number of people diagnosed")
plot(Age2013$Group,Age2013$Count,xlab="age group",ylab="number of people diagnosed")
plot(Age2014$Group,Age2014$Count,xlab="age group",ylab="number of people diagnosed")
plot(Age2015$Group,Age2015$Count,xlab="age group",ylab="number of people diagnosed")
plot(Age2016$Group,Age2016$Count,xlab="age group",ylab="number of people diagnosed")
plot(Age2017$Group,Age2017$Count,xlab="age group",ylab="number of people diagnosed")

install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(Age$Year,Age$Group,Age$Count)

scatterplot3d(hivdata1$Year,hivdata1$Category,hivdata1$Count)

median(Age2017$Count)
# [1] 10726

pop01<-ifelse(Age2017$Count>10726, yes = 1, no=0)
popdf<-data.frame(Age2017,pop01)

boxplot(pop01~Group, data = Age2017)

plot(transmission$Group,transmission$Count)
