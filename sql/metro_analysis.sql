/*
============================================================
Metro Operations & Passenger Demand Analytics
SQL Analysis
============================================================

Database: metro_operations
Table: station_hourly

Purpose:
Analyze passenger demand patterns across stations,
hours, days, and time periods.

Key business questions:
1. Which stations have the highest ridership?
2. What are the busiest hours?
3. How does demand vary by day of week?
4. How does weekday demand compare with weekend demand?
5. Which stations are busiest during different time periods?
6. What are the peak hours for major stations?
7. How concentrated is ridership across stations?

============================================================
*/

-- ============================================================
-- Query 1: Top 10 Stations by Total Ridership
-- ============================================================

SELECT
    Station,
    SUM(Ridership) AS Total_Ridership
FROM station_hourly
GROUP BY Station
ORDER BY Total_Ridership DESC
LIMIT 10;

-- ============================================================
-- Query 2: Average Daily Ridership by Station
-- ============================================================

WITH daily_station_ridership AS (
    SELECT
        Station,
        Date,
        SUM(Ridership) AS Daily_Ridership
    FROM station_hourly
    GROUP BY Station, Date
)

SELECT
    Station,
    ROUND(AVG(Daily_Ridership), 2) AS Average_Daily_Ridership
FROM daily_station_ridership
GROUP BY Station
ORDER BY Average_Daily_Ridership DESC
LIMIT 10;

-- ============================================================
-- Query 3: Total Ridership by Hour
-- ============================================================

SELECT
    Hour,
    SUM(Ridership) AS Total_Ridership
FROM station_hourly
GROUP BY Hour
ORDER BY Total_Ridership DESC;

-- ============================================================
-- Query 4: Average Daily Ridership by Day of Week
-- ============================================================

WITH daily_ridership AS (
    SELECT
        Date,
        Day_Name,
        SUM(Ridership) AS Daily_Ridership
    FROM station_hourly
    GROUP BY Date, Day_Name
)

SELECT
    Day_Name,
    ROUND(AVG(Daily_Ridership), 2) AS Average_Daily_Ridership
FROM daily_ridership
GROUP BY Day_Name
ORDER BY Average_Daily_Ridership DESC;

-- ============================================================
-- Query 5: Weekday vs Weekend Average Daily Ridership
-- ============================================================

WITH daily_ridership AS (
    SELECT
        Date,
        Is_Weekend,
        SUM(Ridership) AS Daily_Ridership
    FROM station_hourly
    GROUP BY Date, Is_Weekend
)

SELECT
    CASE
        WHEN Is_Weekend = 1 THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    ROUND(AVG(Daily_Ridership), 2) AS Average_Daily_Ridership,
    ROUND(SUM(Daily_Ridership), 2) AS Total_Ridership
FROM daily_ridership
GROUP BY Is_Weekend
ORDER BY Average_Daily_Ridership DESC;

-- ============================================================
-- Query 6: Total Ridership by Time Period
-- ============================================================

SELECT
    Time_Period,
    SUM(Ridership) AS Total_Ridership
FROM station_hourly
GROUP BY Time_Period
ORDER BY Total_Ridership DESC;

-- ============================================================
-- Query 7: Busiest Station in Each Time Period
-- ============================================================

WITH station_period_ridership AS (
    SELECT
        Time_Period,
        Station,
        SUM(Ridership) AS Total_Ridership
    FROM station_hourly
    GROUP BY Time_Period, Station
),

ranked_stations AS (
    SELECT
        Time_Period,
        Station,
        Total_Ridership,
        RANK() OVER (
            PARTITION BY Time_Period
            ORDER BY Total_Ridership DESC
        ) AS Station_Rank
    FROM station_period_ridership
)

SELECT
    Time_Period,
    Station,
    Total_Ridership
FROM ranked_stations
WHERE Station_Rank = 1
ORDER BY Total_Ridership DESC;

-- ============================================================
-- Query 8: Busiest Hour for Each Station
-- ============================================================

WITH station_hour_ridership AS (
    SELECT
        Station,
        Hour,
        SUM(Ridership) AS Total_Ridership
    FROM station_hourly
    GROUP BY Station, Hour
),

ranked_hours AS (
    SELECT
        Station,
        Hour,
        Total_Ridership,
        RANK() OVER (
            PARTITION BY Station
            ORDER BY Total_Ridership DESC
        ) AS Hour_Rank
    FROM station_hour_ridership
)

SELECT
    Station,
    Hour,
    Total_Ridership
FROM ranked_hours
WHERE Hour_Rank = 1
ORDER BY Total_Ridership DESC;

-- ============================================================
-- Query 9: Top 10 Stations by Average Daily Ridership
-- ============================================================

WITH daily_station_ridership AS (
    SELECT
        Station,
        Date,
        SUM(Ridership) AS Daily_Ridership
    FROM station_hourly
    GROUP BY Station, Date
)

SELECT
    Station,
    ROUND(AVG(Daily_Ridership), 2) AS Avg_Daily_Ridership,
    COUNT(DISTINCT Date) AS Days_Observed
FROM daily_station_ridership
GROUP BY Station
ORDER BY Avg_Daily_Ridership DESC
LIMIT 10;

-- ============================================================
-- Query 10: Highest and Lowest Ridership Days
-- ============================================================

WITH daily_ridership AS (
    SELECT
        Date,
        SUM(Ridership) AS Daily_Ridership
    FROM station_hourly
    GROUP BY Date
)

SELECT
    'Highest Ridership Day' AS Metric,
    Date,
    Daily_Ridership
FROM daily_ridership
ORDER BY Daily_Ridership DESC
LIMIT 1;

-- ============================================================
-- Query 11: Lowest Ridership Day
-- ============================================================

WITH daily_ridership AS (
    SELECT
        Date,
        SUM(Ridership) AS Daily_Ridership
    FROM station_hourly
    GROUP BY Date
)

SELECT
    'Lowest Ridership Day' AS Metric,
    Date,
    Daily_Ridership
FROM daily_ridership
ORDER BY Daily_Ridership ASC
LIMIT 1;

-- ============================================================
-- Query 12: Station Ridership Contribution
-- ============================================================

SELECT
    Station,
    SUM(Ridership) AS Total_Ridership,
    ROUND(
        SUM(Ridership) * 100.0 /
        (SELECT SUM(Ridership) FROM station_hourly),
        2
    ) AS Ridership_Share_Percent
FROM station_hourly
GROUP BY Station
ORDER BY Total_Ridership DESC
LIMIT 10;

-- ============================================================
-- Query 13: Top 5 Stations Ridership Share
-- ============================================================

WITH station_ridership AS (
    SELECT
        Station,
        SUM(Ridership) AS Total_Ridership
    FROM station_hourly
    GROUP BY Station
),

ranked_stations AS (
    SELECT
        Station,
        Total_Ridership,
        RANK() OVER (
            ORDER BY Total_Ridership DESC
        ) AS Station_Rank
    FROM station_ridership
)

SELECT
    ROUND(
        SUM(Total_Ridership) * 100.0 /
        (SELECT SUM(Ridership) FROM station_hourly),
        2
    ) AS Top_5_Ridership_Share_Percent
FROM ranked_stations
WHERE Station_Rank <= 5;

-- ============================================================
-- Query 14: Top 10 Stations Ridership Share
-- ============================================================

WITH station_ridership AS (
    SELECT
        Station,
        SUM(Ridership) AS Total_Ridership
    FROM station_hourly
    GROUP BY Station
),

ranked_stations AS (
    SELECT
        Station,
        Total_Ridership,
        RANK() OVER (
            ORDER BY Total_Ridership DESC
        ) AS Station_Rank
    FROM station_ridership
)

SELECT
    ROUND(
        SUM(Total_Ridership) * 100.0 /
        (SELECT SUM(Ridership) FROM station_hourly),
        2
    ) AS Top_10_Ridership_Share_Percent
FROM ranked_stations
WHERE Station_Rank <= 10;

-- ============================================================
-- Query 15: Weekday vs Weekend Ridership by Station
-- ============================================================

SELECT
    Station,
    SUM(CASE
        WHEN Is_Weekend = 0 THEN Ridership
        ELSE 0
    END) AS Weekday_Ridership,
    
    SUM(CASE
        WHEN Is_Weekend = 1 THEN Ridership
        ELSE 0
    END) AS Weekend_Ridership

FROM station_hourly
GROUP BY Station
ORDER BY Weekday_Ridership DESC
LIMIT 10;

-- ============================================================
-- Query 16: Monthly Ridership Trend
-- ============================================================

SELECT
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(Ridership) AS Total_Ridership
FROM station_hourly
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY Month;

-- ============================================================
-- Query 17: Weekday Ridership Dependence by Station
-- ============================================================

SELECT
    Station,
    SUM(Ridership) AS Total_Ridership,

    SUM(
        CASE
            WHEN Is_Weekend = 0 THEN Ridership
            ELSE 0
        END
    ) AS Weekday_Ridership,

    ROUND(
        SUM(
            CASE
                WHEN Is_Weekend = 0 THEN Ridership
                ELSE 0
            END
        ) * 100.0 / SUM(Ridership),
        2
    ) AS Weekday_Share_Percent

FROM station_hourly
GROUP BY Station
ORDER BY Weekday_Share_Percent DESC
LIMIT 10;

-- ============================================================
-- Query 18: Network KPI Summary
-- ============================================================

SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Station) AS Total_Stations,
    COUNT(DISTINCT Date) AS Total_Days,
    SUM(Ridership) AS Total_Ridership,
    ROUND(AVG(Ridership), 2) AS Average_Hourly_Ridership,
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date
FROM station_hourly;