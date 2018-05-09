ggplot(extreme_counts_low_ideology, aes(x=reorder(STATE, sum), y = sum, fill = Conservative.Liberal)) +
  geom_bar(stat = "identity") +
  labs(x = "State", 
       y = "Number of Extreme Weather Events",
       title = "States with the Least Extreme Weather Events: 2010-2012",
       subtitle = "Extreme Weather Event Defined as: Excessive Heat, Flash Flood, Flood, Heat, Heavy Rain, Drought, Hurricane, and Flood") +
  scale_fill_manual("Political Ideology", values = c("Liberal" = "blue", "Swing" = "purple", "Conservative" = "red")) +
  theme(axis.text.x = element_text(angle=90))



ggplot(extreme_counts_high_ideology, aes(x=reorder(STATE, -sum), y = sum, fill = Conservative.Liberal)) +
  geom_bar(stat = "identity") +
  labs(x = "State", 
       y = "Number of Extreme Weather Events",
       title = "States with the Most Extreme Weather Events: 2010-2012",
       subtitle = "Extreme Weather Event Defined as: Excessive Heat, Flash Flood, Flood, Heat, Heavy Rain, Drought, Hurricane, and Flood") +
  scale_fill_manual("Political Ideology", values = c("Liberal" = "blue", "Swing" = "purple", "Conservative" = "red")) +
  theme(axis.text.x = element_text(angle=90))

top_global_terms %>%
  ggplot(aes(Keyword, Search.Volume)) +
  geom_col() +
  theme(axis.text.x = element_text(angle=90)) +
  labs(x = "Search Term", y = "Volume", title = "Top Search Terms Inolving Global Warming")

top_climate_terms1 %>%
  ggplot(aes(x = reorder(Keyword, Search.Volume), y = Search.Volume)) +
  geom_col() +
  theme(axis.text.x = element_text(angle=90)) +
  labs(x = "Search Term", y = "Volume", title = "Top Search Terms Inolving Climate Change")


extreme_countslol %>%
  ggplot(aes(x = reorder(EVENT_TYPE, -sum), y = sum)) +
  geom_bar(stat = "identity") +
  labs(x = "Weather Event",
       y = "Count",
       title = "Most Weather Events: 2010-2012"
       )

ggplot(daily_data, aes(Date1, Total.Weather.Events)) + 
  geom_line() + 
  scale_x_date('month')  + 
  labs(title = "Time Series Plot by each Month",
       y = "Extreme Weath Events",
       x = "Month",
       subtitle = "All Years Collapsed")

extreme_countsmonth %>%
  ggplot(aes(x = reorder(Month, -sum), y = sum)) +
  geom_bar(stat = "identity") +
  labs(x = "Month",
       y = "Count",
       title = "Most Weather Events by Month: 2010-2012"
  )

library(zoo)

climate <- xts(extreme_countsresults[,-1], order.by=as.Date(extreme_countsresults[,1], "%m/%Y"))
