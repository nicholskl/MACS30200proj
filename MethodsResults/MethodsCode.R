top_climate_terms <- read.csv("C:/Users/knich/Desktop/climate+change-phrase_fullsearch-us.csv")
CCES_2012<- readRDS("C:\\Users\\knich\\Desktop\\CCES12_Common_VV.RData")
CCES_2012 <- x
View(CCES_2011)


top_climate_terms1 %>%
  ggplot(aes(Keyword, Search.Volume)) +
  geom_col() +
  theme(axis.text.x = element_text(angle=90)) +
  labs(x = "Search Term", y = "Volume", title = "Top Search Terms Inolving Climate Change")

top_climate_terms1 <- top_climate_terms[-c(1), ]

myData[-c(2, 4, 6), ]

CCES_2011_Cleaned <- CCES_2011[,c("V401","V402","CC350", "V206", "CC342A")]

CCES_2011_Cleaned # done. 

CCES_2010_Cleaned <- CCES_2010[,c("V401","V402","CC321", "V206", "CC334A")]

CCES_2010_Cleaned # done

CCES_2012_Cleaned <- CCES_2012[,c("starttime","endtime","CC321", "inputstate", "CC334A")]

CCES_2012 # done
##########################################

install.packages("reshape2")

Storm_Events_Details2010 <- read.csv("C:\\Users\\knich\\Desktop\\StormEvents_details-ftp_v1.0_d2010_c20170726.csv.gz")
Storm_Events_Details2011 <- read.csv("C:\\Users\\knich\\Desktop\\StormEvents_details-ftp_v1.0_d2011_c20170519.csv.gz")
Storm_Events_Details2012 <- read.csv("C:\\Users\\knich\\Desktop\\StormEvents_details-ftp_v1.0_d2012_c20170519.csv.gz")

StormEvents_2010_Cleaned <- Storm_Events_Details2010[,c("END_YEARMONTH","STATE","EVENT_TYPE", "DEATHS_DIRECT")]
StormEvents_2011_Cleaned <- Storm_Events_Details2011[,c("END_YEARMONTH","STATE","EVENT_TYPE", "DEATHS_DIRECT")]
StormEvents_2012_Cleaned <- Storm_Events_Details2012[,c("END_YEARMONTH","STATE","EVENT_TYPE", "DEATHS_DIRECT")]


########################################################## 
# Months
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201001] <- "1/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201002] <- "2/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201003] <- "3/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201004] <- "4/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201005] <- "5/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201006] <- "6/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201007] <- "7/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201008] <- "8/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201009] <- "9/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201010] <- "10/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201011] <- "11/2010"
StormEvents_2010_Cleaned$END_YEARMONTH[StormEvents_2010_Cleaned$END_YEARMONTH==201012] <- "12/2010"

StormEvents_2010_Cleaned$Month <- NA

StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="1/2010"] <- "January"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="2/2010"] <- "February"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="3/2010"] <- "March"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="4/2010"] <- "April"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="5/2010"] <- "May"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="6/2010"] <- "June"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="7/2010"] <- "July"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="8/2010"] <- "August"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="9/2010"] <- "September"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="10/2010"] <- "October"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="11/2010"] <- "November"
StormEvents_2010_Cleaned$Month[StormEvents_2010_Cleaned$END_YEARMONTH=="12/2010"] <- "December"
#################################################################################################
#2011

StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201101] <- "1/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201102] <- "2/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201103] <- "3/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201104] <- "4/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201105] <- "5/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201106] <- "6/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201107] <- "7/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201108] <- "8/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201109] <- "9/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201110] <- "10/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201111] <- "11/2011"
StormEvents_2011_Cleaned$END_YEARMONTH[StormEvents_2011_Cleaned$END_YEARMONTH==201112] <- "12/2011"

StormEvents_2011_Cleaned$Month <- NA

StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="1/2011"] <- "January"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="2/2011"] <- "February"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="3/2011"] <- "March"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="4/2011"] <- "April"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="5/2011"] <- "May"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="6/2011"] <- "June"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="7/2011"] <- "July"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="8/2011"] <- "August"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="9/2011"] <- "September"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="10/2011"] <- "October"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="11/2011"] <- "November"
StormEvents_2011_Cleaned$Month[StormEvents_2011_Cleaned$END_YEARMONTH=="12/2011"] <- "December"

#################################################################################################
#2012

StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201201] <- "1/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201202] <- "2/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201203] <- "3/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201204] <- "4/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201205] <- "5/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201206] <- "6/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201207] <- "7/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201208] <- "8/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201209] <- "9/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201210] <- "10/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201211] <- "11/2012"
StormEvents_2012_Cleaned$END_YEARMONTH[StormEvents_2012_Cleaned$END_YEARMONTH==201212] <- "12/2012"

StormEvents_2012_Cleaned$Month <- NA

StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="1/2012"] <- "January"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="2/2012"] <- "February"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="3/2012"] <- "March"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="4/2012"] <- "April"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="5/2012"] <- "May"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="6/2012"] <- "June"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="7/2012"] <- "July"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="8/2012"] <- "August"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="9/2012"] <- "September"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="10/2012"] <- "October"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="11/2012"] <- "November"
StormEvents_2012_Cleaned$Month[StormEvents_2012_Cleaned$END_YEARMONTH=="12/2012"] <- "December"


####################################################################################
# 2010 Extreme Weather Frequency

y = xtabs(~ STATE + EVENT_TYPE, StormEvents_2010_Cleaned)
extreme_counts_2010 = count(StormEvents_2010_Cleaned, c("EVENT_TYPE", "STATE"))



target <- c("Excessive Heat", "Heat", "Flash Flood", "Flood", "Heavy Rain", "Hurricane", "Drought", "Tropical Storm")
lol <- extreme_counts_2010 %>%
  filter(EVENT_TYPE %in% target)

lol$freq<-as.numeric(as.character(lol$freq))


state_aggregate2010 = aggregate(freq ~ STATE, data = lol, sum)


Event_aggregate2010 = aggregate(freq ~ EVENT_TYPE, data = lol, sum)

# REsults 2010
results_2010 = count(StormEvents_2010_Cleaned, c("EVENT_TYPE", "END_YEARMONTH"))
resultslol_2010 <- results_2010 %>%
  filter(EVENT_TYPE %in% target)

results2010_final = aggregate(freq ~ END_YEARMONTH, data = resultslol_2010, sum)



############################### Month 2010
extreme_month_counts_2010 = count(StormEvents_2010_Cleaned, c("EVENT_TYPE", "Month"))
month_2010 = aggregate(freq ~ Month, data = extreme_month_counts_2010, sum)


####################################################################################
# 2011

extreme_counts_2011 = count(StormEvents_2011_Cleaned, c("EVENT_TYPE", "STATE"))

lol <- extreme_counts_2011 %>%
  filter(EVENT_TYPE %in% target)

state_aggregate2011 = aggregate(freq ~ STATE, data = lol, sum)
View(state_aggregate2011)

Event_aggregate2011 = aggregate(freq ~ EVENT_TYPE, data = lol, sum)
## Month
extreme_month_counts_2011 = count(StormEvents_2011_Cleaned, c("EVENT_TYPE", "Month"))
month_2011 = aggregate(freq ~ Month, data = extreme_month_counts_2011, sum)

### Results 2011

results_2011 = count(StormEvents_2011_Cleaned, c("EVENT_TYPE", "END_YEARMONTH"))
resultslol_2011 <- results_2011 %>%
  filter(EVENT_TYPE %in% target)

results2011_final = aggregate(freq ~ END_YEARMONTH, data = resultslol_2011, sum)

#################################################################################
# 2012

extreme_counts_2012 = count(StormEvents_2012_Cleaned, c("EVENT_TYPE", "STATE"))

lol <- extreme_counts_2012 %>%
  filter(EVENT_TYPE %in% target)

state_aggregate2012 = aggregate(freq ~ STATE, data = lol, sum)
View(state_aggregate2012)

Event_aggregate2012 = aggregate(freq ~ EVENT_TYPE, data = lol, sum)
# Month
extreme_month_counts_2012 = count(StormEvents_2012_Cleaned, c("EVENT_TYPE", "Month"))
month_2012 = aggregate(freq ~ Month, data = extreme_month_counts_2012, sum)

### Results
results_2012 = count(StormEvents_2012_Cleaned, c("EVENT_TYPE", "END_YEARMONTH"))
resultslol_2012 <- results_2012 %>%
  filter(EVENT_TYPE %in% target)

results2012_final = aggregate(freq ~ END_YEARMONTH, data = resultslol_2012, sum)

############################################################
## Graph
# merge two data frames
extreme_counts <- state_aggregate2010 %>% #By state
  left_join(state_aggregate2011, by = "STATE") %>%
  left_join(state_aggregate2012, by = "STATE")

extreme_countslol <- Event_aggregate2010 %>% ##By event
  left_join(Event_aggregate2011, by = "EVENT_TYPE") %>%
  left_join(Event_aggregate2012, by = "EVENT_TYPE")

extreme_countsmonth <- month_2010 %>% #By month
  left_join(month_2011, by = "Month") %>%
  left_join(month_2012, by = "Month")

extreme_countsresults <- rbind(results2010_final, results2011_final, results2012_final) # Ready for results
write.csv(extreme_countsresults, file = "Initial_Results.csv")

extreme_counts$sum <- extreme_counts$freq.x + extreme_counts$freq.y + extreme_counts$freq
extreme_countslol$sum <- extreme_countslol$freq.x + extreme_countslol$freq.y + extreme_countslol$freq
extreme_countsmonth$sum <- extreme_countsmonth$freq.x + extreme_countsmonth$freq.y + extreme_countsmonth$freq

extreme_counts_graph_high <- extreme_counts[order(extreme_counts$sum, decreasing = TRUE),]
extreme_counts_graph_low <- extreme_counts[order(extreme_counts$sum),]

extreme_counts_graph_high <- extreme_counts_graph_high %>%
  slice(1:15)
extreme_counts_graph_low <- extreme_counts_graph_low %>%
  slice(1:30)

States_Conservative_Liberal <- read.csv("C:\\Users\\knich\\Desktop\\US 2008 and 2012 Coservativism States Values Only.csv")
extreme_counts_cleaned <- extreme_counts[, -2:-4]

extreme_counts_ideology <- extreme_counts_cleaned %>%
  left_join(States_Conservative_Liberal, by = "STATE")

extreme_counts_high_ideology <- extreme_counts_graph_high %>%
  inner_join(States_Conservative_Liberal, by = "STATE") 

extreme_counts_low_ideology <- extreme_counts_graph_low %>%
  inner_join(States_Conservative_Liberal, by = "STATE")

extreme_counts_low_ideology <- extreme_counts_low_ideology[!extreme_counts_low_ideology$STATE == "PUERTO RICO", ]
  
  
