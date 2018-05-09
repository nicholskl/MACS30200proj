daily_data = read.csv("C:\\Users\\knich\\Desktop\\Initial_Results.csv", header=TRUE, stringsAsFactors = FALSE)

daily_data$Date1 = as.Date(daily_data$Date)


ggplot(daily_data, aes(Date1, Total.Weather.Events)) + 
  geom_line() + 
  scale_x_date('month')  + 
  labs(title = "Time Series Plot by each Month",
       y = "Extreme Weath Events",
       x = "Month",
       subtitle = "All Years Collapsed")


count_ts = ts(daily_data[, c('Total.Weather.Events')])

daily_data$clean_cnt = tsclean(count_ts)

ggplot() +
  geom_line(data = daily_data, aes(x = Date1, y = clean_cnt)) + ylab('Extreme Weather Count')


daily_data$cnt_ma = ma(daily_data$clean_cnt, order=7) # using the clean count with no outliers
daily_data$cnt_ma30 = ma(daily_data$clean_cnt, order=30)


ggplot() +
  geom_line(data = daily_data, aes(x = Date1, y = clean_cnt, colour = "Counts")) +
  geom_line(data = daily_data, aes(x = Date1, y = cnt_ma,   colour = "Weekly Moving Average"))  +
  geom_line(data = daily_data, aes(x = Date1, y = cnt_ma30, colour = "Monthly Moving Average"))  +
  ylab('Bicycle Count')

count_ma = ts(na.omit(daily_data$cnt_ma), frequency=12)
decomp = stl(count_ma, s.window="periodic")
deseasonal_cnt <- seasadj(decomp)

plot(decomp, 
     main = "Deseazonialzed Timer Series: Extreme Weather Events")

table25 <- adf.test(count_ma, alternative = "stationary")

table26 <- pander(table25)
kable(table26)

Acf(count_ma, main='')

Pacf(count_ma, main='')

Count_Diff2 = diff(deseasonal_cnt, differences = 3)
plot(Count_Diff2,
     main = "Differenced Graph: d=4")
adf.test(Count_Diff2, alternative = "stationary")

Acf(Count_Diff2, main='ACF for Differenced Series')
Pacf(Count_Diff2, main='PACF for Differenced Series')

auto_arima22 <- auto.arima(deseasonal_cnt, seasonal=TRUE)
autoarima23 <- summary(auto_arima22)

kable(autoarima23)

fit<-auto.arima(deseasonal_cnt, seasonal=FALSE)
tsdisplay(residuals(fit), lag.max=45, main='(1,1,0) Model Residuals')

fcast <- forecast(fit, h=12)
plot(fcast)

mod1 <- auto.arima(x)
refit <- Arima(y, model=mod1)
>accuracy(refit)