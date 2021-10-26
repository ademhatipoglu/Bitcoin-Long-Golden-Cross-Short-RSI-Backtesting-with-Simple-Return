library(quantmod)
library(PerformanceAnalytics)

today=Sys.Date()

getSymbols("BTC-USD",from='2019-01-01',to=today)

btc= `BTC-USD`

n<- 14
delta<-0.005
price<- na.omit(Cl(btc))
S <- 10
L <- 50
r<- EMA(price,S)/EMA(price,L) - 1
rsi <- RSI(price, n)
signal <-c() # Ilk sinyali yoksay
signal[1:n] <-0

# Al sat sinyallerini belirle
for (i in (n+1):length(price)){
  if (isTRUE(r[i] > delta)){
    signal[i]<- 1
  } else if (rsi[i]>70){
    signal[i]<- -1
  } else
    signal[i]<- 0
}
signal<-reclass(signal,price)

trade <- Lag(signal)
ret2<-dailyReturn(btc)*trade
names(ret2) <- 'EMA + RSI'

# Performans analizi
windows()
charts.PerformanceSummary(ret2,main= "Buy Golden Cross and Sell RSI for Bitcoin")