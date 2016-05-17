## World Development Indicators

# install.packages("tidyr")
library(tidyr)

indicators <- read.csv("indicators.csv")
head(indicators)

# Values: Mammals, agriculatural land, forest, aid from US, electricy from coal, PM 2.5 exposure, 
# population density, index for bio diversity, water withdrawls
use <- c('EN.MAM.THRD.NO', 
         'AG.LND.AGRI.K2', 
         'AG.LND.FRST.K2', 
         'DC.DAC.USAL.CD', 
         'EG.ELC.COAL.ZS', 
         'EN.ATM.PM25.MC.M3',
         'EN.POP.DNST',
         'ER.BDV.TOTL.XQ',
         'ER.H2O.INTR.K3')

# Only pull in relevant columns; eliminate IndicatorName and CountryCode
ind_trunc <- subset(indicators, select = c(CountryName, IndicatorCode, Year, Value))

# Subset for the Indicators in my selected list
ind_1 <- subset(ind_trunc, IndicatorCode %in% use)

# Create a wide dataset from the tidy dataset
ind <- spread(ind_1, IndicatorCode, Value)
write.csv(ind, file = "Indicators_Clean.csv")

# Nate - question for you. Based on looking at the data, there's a lot of 
# missing values in this dataset. For example, there's only 2015 data for the endangered mammals
# but 2015 values are not available for any of the other indicators. 

# What's the best way to handle this? Should I scrap the analysis and pick something else that has
# better data, or is there some good way to estimate what the values for the other variables are? 

# If so...1) what is the best way to do that? and 2) how do I do that in R? 
