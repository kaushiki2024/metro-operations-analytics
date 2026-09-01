# Metro Operations & Passenger Demand Analytics

## Project Overview

This project analyzes metro passenger ridership data to understand passenger demand patterns, identify high-demand stations and peak travel periods, and generate insights that can support metro operational planning.

The project follows an end-to-end data analytics workflow using Python for data cleaning and exploratory analysis, MySQL for data storage and SQL analysis, and Power BI for interactive dashboard development.

## Objectives

- Analyze passenger demand across metro stations.
- Identify high-ridership stations.
- Identify peak passenger hours.
- Analyze ridership patterns by day of week.
- Compare weekday and weekend passenger demand.
- Analyze ridership across different time periods.
- Identify station-specific peak hours.
- Measure ridership concentration across stations.
- Generate insights that can support metro operational planning.

## Dataset

The dataset contains hourly passenger ridership information across metro stations.

Key columns include:

- `Date` — Date of observation
- `Hour` — Hour of observation
- `Station` — Metro station
- `Ridership` — Passenger ridership
- `Day_Name` — Day of the week
- `Is_Weekend` — Weekend indicator
- `Time_Period` — Categorized time period

### Dataset Summary

- **Total Records:** 92,280
- **Total Stations:** 83
- **Observed Days:** 48
- **Total Ridership:** 33,837,882
- **Date Range:** August 1, 2025 – September 30, 2025

## Project Workflow

### 1. Data Cleaning & Exploratory Data Analysis

Python and Pandas were used to:

- Inspect the dataset.
- Handle and validate data types.
- Create derived columns.
- Analyze ridership by station, hour, day, and time period.
- Identify high- and low-ridership days.
- Analyze weekday vs weekend demand.
- Analyze station-level demand patterns.

Visualizations were created using Matplotlib and Seaborn.

### 2. SQL Analysis

The cleaned dataset was loaded into MySQL for structured analysis.

SQL analysis includes:

- Top stations by total ridership.
- Average daily ridership by station.
- Ridership by hour.
- Average daily ridership by day of week.
- Weekday vs weekend ridership.
- Ridership by time period.
- Busiest station within each time period.
- Busiest hour for each station.
- Highest and lowest ridership days.
- Station ridership contribution.
- Top 5 and Top 10 station concentration.
- Weekday ridership dependence by station.
- Monthly ridership comparison.
- Network-level KPI validation.

SQL techniques used include:

- `GROUP BY`
- `ORDER BY`
- `CASE`
- Aggregate functions
- Subqueries
- CTEs
- Window functions
- `RANK()`
- `PARTITION BY`
- Date functions

### 3. Power BI Dashboard

Power BI will be used to create an interactive dashboard covering:

- Overall ridership KPIs
- Station performance
- Hourly demand patterns
- Day-of-week trends
- Weekday vs weekend comparison
- Time-period analysis
- Station-level demand patterns

**Status:** Upcoming

## Key Insights

Some findings from the analysis include:

- **Total network ridership:** 33,837,882
- **Highest-ridership station:** Nadaprabhu Kempegowda Station, Majestic
- **Highest-ridership hour:** 18:00
- **Highest-ridership day:** August 14, 2025
- **Lowest-ridership day:** August 10, 2025
- **Highest average-ridership day:** Wednesday
- **Lowest average-ridership day:** Sunday
- **Evening Peak** is the highest-ridership time period.
- **Weekday average daily ridership** is higher than weekend average daily ridership.
- The **top 5 stations account for 17.32%** of total network ridership.
- The **top 10 stations account for 27.70%** of total network ridership.

## Tools & Technologies

- Python
- Pandas
- Matplotlib
- Seaborn
- MySQL
- SQL
- Power BI

## Project Structure

```text
Metro-Operations-Analytics/
│
├── data/
│   └── station-hourly.csv
│
├── notebook/
│   └── 01_data_cleaning_and_eda.ipynb
│
├── sql/
│   └── metro_analysis.sql
│
├── visuals/
│
├── powerBi/
│
├── .gitignore
└── README.md