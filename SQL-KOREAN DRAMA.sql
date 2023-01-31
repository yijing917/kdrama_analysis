SELECT *
FROM dbo.kdrama

ALTER TABLE dbo.kdrama
DROP COLUMN Synopsis

--separate the date and standardize the format 
SELECT *
FROM dbo.kdrama
 
SELECT PARSENAME(REPLACE(Aired_Date,'-','.'),1) as end_airdate, 
PARSENAME(REPLACE(Aired_Date,'-','.'),2) as start_airdate
FROM dbo.kdrama

ALTER TABLE dbo.kdrama 
Add start_airdate DATE ;

update dbo.kdrama
SET start_airdate =PARSENAME(REPLACE(Aired_Date,'-','.'),2)  

ALTER TABLE dbo.kdrama 
Add end_airdate DATE ;

update dbo.kdrama
SET end_airdate =PARSENAME(REPLACE(Aired_Date,'-','.'),1)  

SELECT start_airdate, end_airdate
FROM dbo.kdrama

--replace the null value to same end_airdate to standardize 

SELECT CASE WHEN start_airdate IS NULL THEN end_airdate ELSE start_airdate END as start_airdate_updated, end_airdate
FROM dbo.kdrama

UPDATE dbo.kdrama
SET start_airdate = CASE WHEN start_airdate IS NULL THEN end_airdate ELSE start_airdate END


SELECT *
FROM dbo.kdrama

-- trim the column "Aired_on" to remove the empty space 

SELECT Aired_On, TRIM(Aired_On) as trimmed
FROM dbo.kdrama

UPDATE dbo.kdrama
SET Aired_On = TRIM(Aired_On)




--split genre into different columns. Treat the first 2 genre as main 

SELECT PARSENAME(REPLACE(Aired_Date,',','.'),) as end_airdate, 
PARSENAME(REPLACE(Aired_Date,'-','.'),2) as start_airdate
FROM dbo.kdrama

SELECT Genre, SUBSTRING(Genre,1,CHARINDEX(',',Genre)-1) as Genre1,
TRIM(SUBSTRING(Genre, CHARINDEX(',',Genre)+1,LEN(Genre))) as Genre2
FROM dbo.kdrama

ALTER TABLE dbo.kdrama 
ADD genre1 VARCHAR(50)

UPDATE dbo.kdrama
SET genre1 = TRIM(SUBSTRING(Genre,1,CHARINDEX(',',Genre)-1))

--ALTER TABLE dbo.kdrama 
--ADD genre2 VARCHAR(255)

--UPDATE dbo.kdrama
--SET genre2 = TRIM(SUBSTRING(Genre, CHARINDEX(',',Genre)+1,LEN(Genre)))

--SELECT genre2, TRIM(PARSENAME(REPLACE(genre2,',','.'),2)) as genre3,
--PARSENAME(REPLACE(genre2,',','.'),1) as genre4
--FROM dbo.kdrama

--SELECT Year_of_release, Content_Rating, COUNT(*) as no_of_drama
--FROM dbo.kdrama
--WHERE Original_Network LIKE '%Netflix%'
--GROUP BY Year_of_release,Content_Rating
--ORDER BY Year_of_release
 
--Data Cleaning, use Case When function standardize the category and Trim to remove the space ( For the column - Original Network) 

 SELECT Original_Network, CASE WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%tvN%' THEN 'Netflix, tvN'
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%SBS%' THEN 'Netflix, SBS' 
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%jTBC%' THEN 'Netflix, jTBC'
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%OCN%' THEN 'Netflix, OCN'
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%KBS2%' THEN 'Netflix, KBS2'
  WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%MBC%' THEN 'Netflix, MBC'
  WHEN Original_Network LIKE '%jTBC%' AND Original_Network LIKE '%Viki%' THEN 'jTBC, Viki'
 ELSE Original_Network END as modified 
 FROM dbo.kdrama

 UPDATE dbo.kdrama
 SET Original_Network = TRIM(CASE WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%tvN%' THEN 'Netflix, tvN'
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%SBS%' THEN 'Netflix, SBS' 
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%jTBC%' THEN 'Netflix, jTBC'
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%OCN%' THEN 'Netflix, OCN'
 WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%KBS2%' THEN 'Netflix, KBS2'
  WHEN Original_Network LIKE '%Netflix%' AND Original_Network LIKE '%MBC%' THEN 'Netflix, MBC'
  WHEN Original_Network LIKE '%jTBC%' AND Original_Network LIKE '%Viki%' THEN 'jTBC, Viki'
 ELSE Original_Network END)


 -- Analysis from here 

 -- count the number of drama group by year 

 SELECT Year_of_release, count(*) as drama_release 
 FROM dbo.kdrama
 GROUP BY Year_of_release
 ORDER BY Year_of_release DESC;


 -- identify the network has highest number of drama, Average rating of drama and max rating 
 SELECT Original_Network,count(*) as number_of_drama, ROUND(AVG(rating),1) as average_rating, ROUND(MAX(rating),1) AS max_rating
 FROM dbo.kdrama
 WHERE Year_of_release >= 2012
 GROUP BY Original_Network
 ORDER BY number_of_drama DESC, average_rating DESC 

 --Group drama by days 

 SELECT Aired_On, count(*) as number_of_drama, ROUND(AVG(rating),1) AS average_rating
 FROM dbo.kdrama
 GROUP BY Aired_On
 ORDER BY  average_rating DESC

 --difference in average rating for weekend drama and weekday drama 


 SELECT Aired_days, Count(*) as Num_of_dramas, ROUND(AVG(Rating),1) as Average_rating
 FROM (SELECT Aired_On, CASE WHEN Aired_on LIKE '%Saturday%' THEN 'Weekend' 
 WHEN Aired_on LIKE '%Sunday%' THEN 'Weekend'
 ELSE 'Weekdays' END AS Aired_days, Rating FROM dbo.kdrama) AS Air_day 
 GROUP BY Aired_days



-- highest rating of drama every year
SELECT * 
FROM (SELECT Year_of_release, Name, Original_Network,Content_Rating, ROUND(Rating,2) as ratings,
DENSE_RANK() OVER (PARTITION BY Year_of_release ORDER BY Rating DESC ) as ranking 
FROM dbo.kdrama) drama_rank
WHERE ranking= 1
ORDER BY Year_of_release DESC;

 
 
-- episodes of drama 

SELECT Number_of_Episodes, count(*) as episodes
FROM dbo.kdrama 
GROUP BY Number_of_Episodes
ORDER BY episodes DESC 


-- based on content rating 

SELECT Content_Rating, count(*) as Rating_of_15_18
FROM dbo.korean
GROUP BY Content_Rating;

-- Drama produced by netflix analysis 

SELECT Year_of_release, Content_Rating, COUNT(*) as no_of_drama, ROUND(AVG(Rating),1) as average_Rating
FROM dbo.kdrama
WHERE Original_Network LIKE '%Netflix%'
GROUP BY Year_of_release,Content_Rating
ORDER BY Year_of_release

-- identify the increase trend of 18-rated drama 
SELECT Year_of_release, Content_Rating, COUNT(*) as num_of_drama
FROM dbo.kdrama 
WHERE Content_Rating LIKE '%18+%'
GROUP BY Year_of_release,Content_Rating
ORDER BY Year_of_release DESC;


-- Original_network production vs year 2022 comparing max rating accordingly 

SELECT Original_Network, count(*) as number_of_drama, round(max(Rating),1) as max_rating 
FROM dbo.kdrama
WHERE Year_of_release = 2022 
GROUP BY Original_Network
HAVING max(Rating) >=8.5
ORDER BY number_of_drama DESC;


-- Identify the drams with rating equal or more than 9 
SELECT *
FROM dbo.kdrama 
WHERE Rating >=9
ORDER BY Year_of_release DESC; 


-- Favourite genre 


-- proportion of genre in the dataset 

SELECT (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Romance%') as Romance_drama_Count,
       (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Romance%')/
        CAST(count(*) as numeric)*100 as Percentage_of_genre
FROM dbo.kdrama

SELECT (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Thriller%') as Thriller_drama_Count,
       (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Thriller%')/
        CAST(count(*) as numeric)*100 as Percentage_of_genre
FROM dbo.kdrama


SELECT (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Comedy%') as Thriller_drama_Count,
       (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Comedy%')/
        CAST(count(*) as numeric)*100 as Percentage_of_genre
FROM dbo.kdrama


SELECT (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Mystery%') as Thriller_drama_Count,
       (SELECT count (*) FROM dbo.kdrama WHERE Genre LIKE '%Mystery%')/
        CAST(count(*) as numeric)*100 as Percentage_of_genre
FROM dbo.kdrama

-- find the most common genre vs rating 
SELECT genre1, genre3, count(*) as count_of_drama, ROUND(MAX(Rating),1) as Max_rating 
FROM dbo.kdrama
GROUP BY genre1, genre3 
ORDER BY count_of_drama DESC,Max_rating

-- split the genre to do more detailed analysis. 
-- use the previous column genre2 which was separated column from genre1, genre3 +genre4 is the combination of genre2. Since its repeated column, it has been deleted. 

SELECT genre2, TRIM(SUBSTRING(genre2, CHARINDEX(',',genre2)+1,LEN(genre2))) as genre4,
SUBSTRING(genre2,1,ABS(CHARINDEX(',',genre2)-1)) as genre3
FROM dbo.kdrama

ALTER TABLE dbo.kdrama
ADD genre3 NVARCHAR(50) 

UPDATE dbo.kdrama
SET genre3= SUBSTRING(genre2,1,ABS(CHARINDEX(',',genre2)-1))

ALTER TABLE dbo.kdrama
ADD genre4 NVARCHAR(50) 

UPDATE dbo.kdrama
SET genre4= TRIM(SUBSTRING(genre2, CHARINDEX(',',genre2)+1,LEN(genre2)))


-- solve the error of some rows not reflected 

SELECT genre3, CASE WHEN genre3='L' then genre4
WHEN genre3='R' then genre4 
WHEN genre3='M' then genre4 
WHEN genre3='D' then genre4 
ELSE genre3 END AS modified
FROM dbo.kdrama

-- update the table by modifying column genre3 

UPDATE dbo.kdrama
SET genre3 = CASE WHEN genre3='L' then genre4
WHEN genre3='R' then genre4 
WHEN genre3='M' then genre4 
WHEN genre3='D' then genre4 
ELSE genre3 END


--ALTER TABLE dbo.kdrama
--DROP COLUMN genre2

-- List out the latest year 2020 to identify the drama that airing in the same month 
-- rank the drama by rating partition by month 

WITH ranking_cte (Name, Original_Network, Aired_On, Airing_month, Airing_monthname, start_airdate, Rating, genre1) 
AS (
SELECT Name, Original_Network, Aired_On,
DATEPART(MONTH, start_airdate) as Airing_month,
DATENAME(MONTH, start_airdate) AS Airing_monthname, 
start_airdate,Rating, genre1
FROM dbo.kdrama
WHERE Year_of_release = 2022 
 )

SELECT *, RANK() OVER (PARTITION BY Airing_monthname ORDER BY Rating DESC)  as rank_by_month
FROM ranking_cte
ORDER BY Airing_month


