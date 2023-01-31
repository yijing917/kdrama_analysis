# kdrama_analysis

:strawberry: **About dataset** 
This dataset contains top-ranked 250 Korean dramas as per MyDramaList website. 

The CSV file contain columns as below: 

| Column Name          | Description                               |
|----------------------|-------------------------------------------|
| Name                 | Name of drama                             |
| Aired Date           | Aired date (from start date to end date)  |
| Year of release      | Release year                              |
| Original Network     | Original Network / Distributor            |
| Aired On             | Days on Air                               |
| Number of Episodes   | Episodes per drama                        |
| Duration             | Duration of drama per episode             |
| Content Rating       | Age limit for content                     |
| Rating               | Drama rating from MyDramaList             |
| Synopsis             | Summary of the drama                      |
| Genre                | Genre of the drama                        |
| Tags                 | Related theme/topic                       |
| Director             | Director of drama                         |
| Screenwriter         | Screenwriter                              |
| Cast                 | Main leads                                |
| Production Companies | Production                                |
Dataset credit to. 

:strawberry: **Fact about KOrean Drama:**

Usually they only premiere 2 episodes per week unless some of them are produced by Netflix. Thus we usually categorized them as below: 
*Monday-Tuesday 월화드리마 
*Wednesday- Thursday  수목드라마 
*Friday -Saturday 금토드라마 

:strawberry: **About the analysis and me:**

This would be my self-initiated SQL analysis by searching a dataset on Kaggle. I decided to start with something that I have passion personally to start with which is Korean drama. I started with understanding the whole dataset, cleaning the dataset in order to analyze what are the trends and analyze the findings accordingly. 
It was a great learning process as I was able to start from scratch to clean the data( I have attached the sql file for my data cleaning process) and analyze accordingly. However, the dataset is limited to only 250 dramas thus more analysis would be needed in order to identify the trend. 

:strawberry: **Task**
To identify the k-drama trend and summarize the popular genre by using SQL. 

:strawberry: **My approach**
1)	What are the count of drama release in each year? 
2)	The highest count of drama group by Original network and average rating/ max rating 
3)	Does weekend drama have higher rating compared to weekdays?
4)	Highest rating of drama by Year 
5)	What are the common episides available in Korean drama? 
6)	Identify the count of drama with content rating 
7)	Deeper analysis – Netflix’s drama analysis by year and rating 
8)	Is there a trend for drama rated as “18+Restricted (violence % Profanity) 
9)	Identify max rating in 2022 vs Original Network 
10)	Any drama with ratings more or equal to 9? 
11)	Identify the most common genre combination and max rating.
12)	List out the latest year 2022 to identify the drama that airing in same month and rank the drama to find out the drama rank 1 for each month.
