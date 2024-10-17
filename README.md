# Olympic Games

## Table of contents

- [Project overview](#Projectoverview)
- [Business Demand Letter](#)
- [Tools used](#)
- [Data Preperation](#)
- [Data Cleaning & Transformation](#)
- [Data Modeling](#)
- [Data Visualisation](#)
- [Data Source](#)
- [Results/Findings](#)
- [Conclusion](#)

## Project Overview

This Data Analysis Project aims to provide insights into the performance of athletes and countries in the Olympic Games over the years. By analyzing historical Olympic data, we seek to identify trends in medal distribution, participation rates, and performance metrics across different sports and nations. The project utilizes data visualization techniques to enhance understanding and facilitate data-driven decisions related to sports development and athlete performance. Ultimately, this analysis aims to highlight the evolution of the Olympics and contribute valuable knowledge to sports enthusiasts and policymakers alike.

## Business Demand Letter [view](https://github.com/itsmanishjoshi/Olympic-Games/blob/main/2.%20Busines%20Request/Business%20Problem.png) 

Hi Team,

As a data analyst at our news company, I have been tasked with visualizing data to help our readers gain insights into the historical performance of countries in the Summer Olympic Games. The primary goal is to present a clear and engaging overview of how various nations have fared over the years.

In addition to showcasing overall performance, there is significant interest in providing detailed information about individual competitors. If I come across any intriguing insights regarding athletes or notable performances, I will certainly incorporate that into the visualizations.

The main focus will be on displaying historical performance metrics for different countries, with an interactive feature that allows users to select and view data specific to their country of interest.

I look forward to creating compelling visualizations that will enhance our readers' understanding of the Olympic Games' history and its athletes.

Best regards,

Paul
Data Analyst


## Tools Used

- SQL - Data Cleaning/Preperation
- Power BI - Creating Reports

## Data Preperation
In the initial data preperation phase, we performed the following tasks:

1. Data loading and inspection.
2. Handling Missing Data.
3. Data cleaning and preperation.


## Data Cleansing & Transformation (SQL)
To create the necessary data model for doing data analysis and fulfilling the business needs defined in the user stories the following tables were extracted using SQL.

Below are some SQL statements for cleansing and transforming necessary data.

1. Cleansed Athelete Event Table

``` SQL
SELECT 
  [ID], 
  [Name] AS 'Comptetior Name', 
  CASE WHEN [Sex] = 'M' THEN 'Male' ELSE 'Female' END AS Sex -- Gender
  , 
  [Age], 
  CASE WHEN [Age] < 18 THEN 'Under 18' WHEN [Age] BETWEEN 18 
  AND 25 THEN '18-25' WHEN [Age] BETWEEN 25 
  AND 30 THEN '25-30' WHEN [Age] > 30 THEN 'Over 30' END AS 'Age Grouping' -- Age Grouping
  , 
  [Height], 
  [Weight], 
  [NOC] AS 'Nation Code' -- Nation Code
  --    , CHARINDEX(' ', Games)-1 AS COL1
  --    , CHARINDEX(' ',REVERSE(Games))-1 AS COL2
  , 
  LEFT(
    Games, 
    CHARINDEX(' ', Games)-1
  ) AS 'Year' -- Games
  , 
  RIGHT(
    Games, 
    CHARINDEX(
      ' ', 
      REVERSE(Games)
    )-1
  ) AS 'Season' -- Season
  , 
  [Games], 
  [City], 
  [Sport], 
  [Event], 
  CASE WHEN Medal = 'NA' THEN '-' ELSE Medal END AS Medal -- View Medal 
FROM 
  [olympic_games].[dbo].[athletes_event_results] 
WHERE 
  RIGHT(
    Games, 
    CHARINDEX(
      ' ', 
      REVERSE(Games)
    )-1
  ) = 'Summer' -- Summer Season Games
```

## Data Modeling

This screenshot showcases the structured data model created in Power BI.

![Data Model](https://github.com/itsmanishjoshi/Olympic-Games/blob/main/4.%20Power%20BI/Data%20Model.png)


## Data Visualisation

After loading the processed data and constructing a comprehensive data model, I developed an in-depth data analysis report. The following screenshot presents the visualized data within Power BI, highlighting key insights derived from dynamic and interactive dashboards.

![Dashboard](https://github.com/itsmanishjoshi/Olympic-Games/blob/main/4.%20Power%20BI/Dashboard%20-%20img.png)



## Data Source

### Athelete Data
The primary dataset used for this analysis is the 'Olympic Games.bak' containing detailed information about the Atheletes, Country, Sports and Medals won by them.

![Excel Data](https://github.com/itsmanishjoshi/Olympic-Games/blob/main/1.%20Data/Data%20-%20img.png)

### Updating the data
Download and execute the script in SQL to update the database.

## Results / Findings
