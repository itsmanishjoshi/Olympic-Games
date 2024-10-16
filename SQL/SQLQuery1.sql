--Atheletes Event Table--

SELECT [ID]
      ,[Name] AS 'Comptetior Name'
      ,CASE WHEN [Sex] = 'M' THEN 'Male' ELSE 'Female' END AS Sex      -- Gender
      ,[Age]
	  , CASE WHEN  [Age] < 18 THEN 'Under 18'
			 WHEN  [Age] BETWEEN 18 AND 25 THEN '18-25'
			 WHEN  [Age] BETWEEN 25 AND 30 THEN '25-30'
			 WHEN  [Age] >30 THEN 'Over 30' 
		END AS 'Age Grouping'              -- Age Grouping
      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Nation Code'           -- Nation Code
--	  , CHARINDEX(' ', Games)-1 AS COL1
--	  , CHARINDEX(' ',REVERSE(Games))-1 AS COL2
	  , LEFT(Games, CHARINDEX(' ', Games)-1) AS 'Year'                       -- Games
	  , RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) AS 'Season'           -- Season
      ,[Games]
      ,[City]
      ,[Sport]
      ,[Event]
	  , CASE WHEN Medal = 'NA' THEN '-' ELSE Medal END AS Medal     -- View Medal 
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) = 'Summer'   -- Summer Season Games
