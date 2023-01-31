# Korean drama_analysis

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
5)	Identify the count of drama with content rating 
6)	Deeper analysis – Netflix’s drama analysis by year and rating 
7)	Is there a trend for drama rated as “18+Restricted (violence % Profanity) 
8)	Identify max rating in 2022 vs Original Network 
9)	Identify the most common genre combination and max rating.
10)	List out the latest year 2022 to identify the drama that airing in same month and rank the drama to find out the drama rank 1 for each month.


:strawberry: **Findings**



Analysis are as follow: 

:tv: **What are the count of drama release in each year?**

![Query_1 1](https://user-images.githubusercontent.com/123582571/215842331-74addb92-d0b3-4c17-ae20-00e39f8dd2fc.png)

![Query_1 ](https://user-images.githubusercontent.com/123582571/215820342-11f78132-f396-4324-af0d-9a24b9f548c7.png)


:tv: **The highest count of drama group by Original network and average rating/ max rating**
 
![Query_2 1](https://user-images.githubusercontent.com/123582571/215842709-984785cf-7a95-4ca4-ba7c-68569be25619.png)

![Query_2](https://user-images.githubusercontent.com/123582571/215824742-771bdc18-cd55-44e3-91c5-4f298c85960e.png)

:tv: **Does weekend drama have higher rating compared to weekdays?**

![Query_3 2](https://user-images.githubusercontent.com/123582571/215842894-fe83fc35-65b3-48a6-8ea5-a32cf0f33ff7.png)

![Query_3](https://user-images.githubusercontent.com/123582571/215828338-2b9de7a6-8788-445e-ad81-5a02e33674ce.png)

Thus I had another query by grouping into weekdays and weekend to see if there is any difference in rating between weekends and weekdays drama. 

![Query_3 1](https://user-images.githubusercontent.com/123582571/215830705-0a45f8b0-1147-4407-9a49-5ca893750908.png)


:tv: **Highest rating of drama by Year**

![Query_4 1](https://user-images.githubusercontent.com/123582571/215843017-04a232e5-1838-43c9-a79b-217160be51f5.png)

![Query_4](https://user-images.githubusercontent.com/123582571/215832971-c22a555e-425a-4f3a-aef7-2319a7e9ff21.png)

:tv: **Identify the count of drama with content rating**

![Query_5 1](https://user-images.githubusercontent.com/123582571/215843223-7123046f-69d7-47bf-8d3b-248da47f2d34.png)

![Query_5](https://user-images.githubusercontent.com/123582571/215836773-3ebeaf1a-94a3-4856-85f5-5a39049c2312.png)

:tv: **Deeper analysis – Netflix’s drama analysis by year and rating** 

![Query_6 1](https://user-images.githubusercontent.com/123582571/215843682-e886cb49-c591-455c-bd4d-d33790f08183.png)

![Query_6](https://user-images.githubusercontent.com/123582571/215843751-42953715-eb99-424b-a8e4-e12ae45ac347.png)


:tv: **Is there a trend for drama rated as “18+Restricted (violence % Profanity)**

![Query_7 1](https://user-images.githubusercontent.com/123582571/215846125-9d781ecc-f6c3-4f34-a8ef-753725d9eeb6.png)

![Query_7](https://user-images.githubusercontent.com/123582571/215836184-806f3151-cf99-4f56-b7a7-58e8dfb02c06.png)

:tv: **Identify max rating in 2022 vs Original Network**

![Query_8 1](https://user-images.githubusercontent.com/123582571/215846160-967597fe-2107-44da-92c0-3fbc1c5a7cab.png)

![Query_8](https://user-images.githubusercontent.com/123582571/215838077-e599cfad-db14-48eb-a149-a8485169db77.png)

:tv: **Identify the most common genre combination and max rating**

![Query_9 1](https://user-images.githubusercontent.com/123582571/215838737-9ada3c38-fd86-408d-b63e-823285b61a9b.png)

![Query_9](https://user-images.githubusercontent.com/123582571/215838733-3604303e-498a-4a36-8368-053a5cd0d31d.png)

**List out the latest year 2022 to identify the drama that airing in same month and rank the drama to find out the drama rank 1 for each month.**

![Query_10 1](https://user-images.githubusercontent.com/123582571/215840467-22afbf35-ab52-4ce6-b39e-acd5a5a97d3b.png)

![Query_10](https://user-images.githubusercontent.com/123582571/215840466-acc182b2-d772-4105-b223-9d037eb5507a.png)




