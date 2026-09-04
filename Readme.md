# Metro Operations & Passenger Demand Analytics

## Project Overview

This project analyzes metro passenger ridership data to understand passenger demand patterns, identify high-demand stations and peak travel periods, and generate insights that can support metro operational planning.

The project follows an end-to-end data analytics workflow using Python for data cleaning and exploratory analysis, MySQL for data storage and SQL analysis, and Power BI for interactive dashboard development.

## Business Problem

Metro operators need to understand how passenger demand varies across stations, hours, days, and time periods in order to support effective operational planning and resource allocation.

This project analyzes historical ridership data to identify demand patterns and answer key business questions around station performance, peak travel periods, and passenger demand concentration.

## Objectives

* Analyze passenger demand across metro stations.
* Identify high-ridership stations.
* Identify peak passenger hours.
* Analyze ridership patterns by day of week.
* Compare weekday and weekend passenger demand.
* Analyze ridership across different time periods.
* Identify station-specific peak hours.
* Measure ridership concentration across stations.
* Generate insights that can support metro operational planning.

## Dataset

The dataset contains hourly passenger ridership information across metro stations.

### Key Variables

| Column        | Description             |
| ------------- | ----------------------- |
| `Date`        | Date of observation     |
| `Hour`        | Hour of observation     |
| `Station`     | Metro station           |
| `Ridership`   | Passenger ridership     |
| `Day_Name`    | Day of the week         |
| `Is_Weekend`  | Weekend indicator       |
| `Time_Period` | Categorized time period |

### Dataset Summary

* **Total Records:** 92,280
* **Total Stations:** 83
* **Observed Days:** 48
* **Total Ridership:** 33,837,882
* **Date Range:** August 1, 2025 – September 30, 2025

## Project Workflow

```text
Raw Metro Ridership Data
        ↓
Data Cleaning
        ↓
Feature Engineering
        ↓
Exploratory Data Analysis
        ↓
SQL Business Analysis
        ↓
KPI Development
        ↓
Power BI Dashboard
        ↓
Insights
        ↓
Operational Recommendations
```

## 1. Data Cleaning & Exploratory Data Analysis

Python and Pandas were used to prepare and analyze the ridership dataset.

The analysis includes:

* Dataset structure and data-type validation
* Missing-value analysis
* Duplicate-record checks
* Ridership validation
* Date and time validation
* Date coverage analysis
* Station coverage analysis
* Feature engineering
* Station-level ridership analysis
* Hourly demand analysis
* Day-of-week analysis
* Weekday vs weekend comparison
* Time-period analysis

Visualizations were created using Matplotlib and Seaborn to identify passenger demand patterns.

## 2. SQL Analysis

The cleaned dataset was loaded into MySQL for structured business analysis.

SQL analysis includes:

* Top stations by total ridership
* Average daily ridership by station
* Ridership by hour
* Average daily ridership by day of week
* Weekday vs weekend ridership
* Ridership by time period
* Busiest station within each time period
* Busiest hour for each station
* Highest and lowest ridership days
* Station ridership contribution
* Top 5 and Top 10 station concentration
* Weekday ridership dependence by station
* Monthly ridership comparison
* Network-level KPI validation

### SQL Techniques Used

* `GROUP BY`
* `ORDER BY`
* `CASE`
* Aggregate functions
* Subqueries
* CTEs
* Window functions
* `RANK()`
* `PARTITION BY`
* Date functions

## 3. Power BI Dashboard

An interactive Power BI dashboard is used to analyze metro passenger demand from multiple perspectives.

The dashboard covers:

### Network Performance

* Total ridership
* Station count
* Overall demand patterns
* Key network-level KPIs

### Station Analysis

* Top stations by ridership
* Station contribution to total ridership
* Station-level demand patterns
* Station-specific peak hours

### Time Analysis

* Hourly ridership
* Day-of-week trends
* Weekday vs weekend demand
* Time-period performance
* Peak travel periods

## Key Insights

The analysis identified several important passenger demand patterns:

* **Total network ridership:** 33,837,882
* **Highest-ridership station:** Nadaprabhu Kempegowda Station, Majestic
* **Highest-ridership hour:** 18:00
* **Highest-ridership day:** August 14, 2025
* **Lowest-ridership day:** August 10, 2025
* **Highest average-ridership day:** Wednesday
* **Lowest average-ridership day:** Sunday
* **Evening Peak** is the highest-ridership time period.
* **Weekday average daily ridership** is higher than weekend average daily ridership.
* The **top 5 stations account for 17.32%** of total network ridership.
* The **top 10 stations account for 27.70%** of total network ridership.

## Business Recommendations

Based on the identified passenger demand patterns, the analysis can support operational decisions such as:

* Prioritizing operational resources during evening peak hours.
* Focusing capacity planning on high-ridership stations.
* Using station-specific peak hours to support targeted operational planning.
* Considering weekday and weekend demand differences when allocating resources.
* Monitoring high-concentration stations to manage passenger demand effectively.

## Tools & Technologies

* **Python**
* **Pandas**
* **Matplotlib**
* **Seaborn**
* **MySQL**
* **SQL**
* **Power BI**
* **Jupyter Notebook**

## Project Structure

```text
Metro-Operations-Analytics/
│
├── README.md
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
│
└── README.md
```

## Project Status

* ✅ Data Cleaning
* ✅ Feature Engineering
* ✅ Exploratory Data Analysis
* ✅ SQL Analysis
* 🔄 Power BI Dashboard

## Author

**Kaushiki Mishra**

Computer Science & Engineering Graduate | Aspiring Data Analyst
