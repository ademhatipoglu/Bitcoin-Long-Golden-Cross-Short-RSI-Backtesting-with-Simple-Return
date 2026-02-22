# Algorithmic Trading: EMA Crossover & RSI Hybrid Strategy Backtester

## Executive Summary
This repository provides a quantitative backtesting script developed in R. It is designed to evaluate a hybrid algorithmic trading strategy on Bitcoin (BTC-USD), combining trend-following momentum with mean-reversion indicators. By utilizing historical market data from 2019 to the present, the model assesses the viability and risk-adjusted performance of the strategy.

## Strategy Methodology & Logic

### 1. Signal Generation
The core logic of the algorithm relies on two primary technical indicators to capture upside momentum and mitigate downside risk:

* **Entry Signal (Long):** The model identifies bullish momentum utilizing a modified Golden Cross approach. A buy signal is generated when the short-term Exponential Moving Average (10-day EMA) exceeds the long-term EMA (50-day EMA) by a defined momentum threshold (0.5% delta).
  
  $$Signal_{Buy} = \left( \frac{EMA_{10}}{EMA_{50}} - 1 \right) > 0.005$$

* **Exit Signal (Short/Neutral):** To prevent holding the asset during severe market corrections, the strategy uses the Relative Strength Index (RSI, 14-period) as a mean-reversion exit trigger. A sell or neutral signal is executed when the asset enters extreme overbought territory.
  
  $$Signal_{Exit} = RSI_{14} > 70$$

### 2. Backtesting & Performance Analytics
* **Execution:** The algorithm translates the logical conditions into actionable daily trading signals, applying a one-day lag to prevent look-ahead bias.
* **Evaluation:** Strategy returns are computed by multiplying the daily logarithmic returns of Bitcoin by the respective signal vectors. 
* **Visualization:** Comprehensive performance metrics and cumulative wealth curves are generated utilizing the `PerformanceAnalytics` package to rigorously benchmark the strategy against market beta.

## Technical Infrastructure
* **Core Language:** R
* **Financial Libraries:** `quantmod` (Financial data extraction and indicator computation), `PerformanceAnalytics` (Econometric and performance evaluation)
* **Domain:** Quantitative Finance, Algorithmic Trading, Crypto Market Microstructure, Backtesting
