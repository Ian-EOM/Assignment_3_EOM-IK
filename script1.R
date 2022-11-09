###############

restData <- read.csv("C:/Users/Ian EOM/Desktop/mydir/price_index_Feb20201.csv")

restData

install.packages("tidyr")
library(tidyr)

head(restData)
dim(restData)

class(restData$Series_title_1)

str(restData)

restData$DATA_VAL <- c(as.numeric(restData$DATA_VAL))
# change type of DATA_VAL as Numeric 
str(restData)

unite(data = restData, col = "DATA_VAL", TIME_REF, DATA_VAL, sep = "")
# and unite TIME_REF & DATA_VAL into DATA_VAL

install.packages("reshape2")
library(reshape2)

head(restData)
dim(restData)

melt_index <- melt(restData, id.vars = c("Series_title_1", "Series_title_2"), measure.vars = "Series_title_3")
head(melt_index)
# Convert Wide Format to Long Format

dcast(restData,Series_title_1~Series_title_3)
# convert data to pivot type

install.packages("plyr")
library(plyr)

adply(restData, 1 , function(row){ row$DATA_VA >= 1012 & row$Series_title_1 == "Auckland"})
# Split array, apply function, and return results in a data frame

