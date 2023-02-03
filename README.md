# Korean drama_analysis

![image_kdrama](https://user-images.githubusercontent.com/123582571/216664334-bdf22ff1-5d52-4e72-b5bb-4e057ae0ffc9.jpg)


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


Dataset credit to : Please click for the [original dataset](https://www.kaggle.com/datasets/ahbab911/top-250-korean-dramas-kdrama-dataset?select=kdrama.csv) shared in Kaggle. 

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

* The original network that has the highest count of drama is tvN. 
* Weekend drama shows higher average rating but more analysis needed to carry out further to have more accurate result. 
* Analysis demonstrated a increasing number of restricted-content dramas from 2014 to 2022. 
* The genres that gained the most popularity were thriller and mystery, followed by the combination of romance and comedy. Nevertheless, the genres that received the highest ratings were life and drama which is 9.2. 
* Dramas released by both tvN and Netflix have gained popularity since 2015. ( by observing the drama ranking in year) 


:tv: **What are the count of drama release in each year?**

![Query_1 1](https://user-images.githubusercontent.com/123582571/215842331-74addb92-d0b3-4c17-ae20-00e39f8dd2fc.png)

![Query_1 ](https://user-images.githubusercontent.com/123582571/215820342-11f78132-f396-4324-af0d-9a24b9f548c7.png)


:tv: **The highest count of drama group by Original network and average rating/ max rating**
 
![Query_2 1](https://user-images.githubusercontent.com/123582571/215842709-984785cf-7a95-4ca4-ba7c-68569be25619.png)

![Query_2](https://user-images.githubusercontent.com/123582571/215824742-771bdc18-cd55-44e3-91c5-4f298c85960e.png)

Based on the results, tvN is the original network that produced the greatest number of dramas in the dataset, a total of 49 from 2012. The average rating for tvN dramas was 8.5, with a maximum rating of 9.1. 

As we can observe from the table, some of the drama productions involved collaboration with another network such as Netflix or OCN. I counted those as another category as they could be either the distributor or part of the production team. We can observe that the collaboration between tvN and Netflix resulted in higher average ratings. 



:tv: **Does weekend drama have higher rating compared to weekdays?**

![Query_3 2](https://user-images.githubusercontent.com/123582571/215842894-fe83fc35-65b3-48a6-8ea5-a32cf0f33ff7.png)

![Query_3](https://user-images.githubusercontent.com/123582571/215828338-2b9de7a6-8788-445e-ad81-5a02e33674ce.png)

Another point to investigate would be how aired days affect ratings. It can be observed that the top 5 categories are mainly composed of weekend dramas and have demonstrated high average ratings. (ordered by average rating). It shows that weekend dramas, in general, have higher ratings compared to weekdays dramas. This is probably because most of the target audiences are young working adults and their leisure time is limited to weekends, so they are more likely to watch weekend dramas instead of weekdays dramas.

Thus I had another query by grouping into weekdays and weekend to see if there is any difference in rating between weekends and weekdays drama. As a result, there is a significant difference in terms of the proportion of drama count, however , the average ratings remain relatively consistent in both categories. 

![Query_3 1](https://user-images.githubusercontent.com/123582571/215830705-0a45f8b0-1147-4407-9a49-5ca893750908.png)


:tv: **Highest rating of drama by Year**

![Query_4 1](https://user-images.githubusercontent.com/123582571/215843017-04a232e5-1838-43c9-a79b-217160be51f5.png)

![Query_4](https://user-images.githubusercontent.com/123582571/215832971-c22a555e-425a-4f3a-aef7-2319a7e9ff21.png)

Next, we would like to identify the highest-rating drama of each year. I used the window function to partition the year of release and return those dramas with ranking 1. 

:paperclip:*Difference between Dense Rank and Rank.*

Dense rank gives the ranking based on the partition, but the ranks are consecutive, and it does not skip any rank even if there is the same ranking with multiple items (e.g. 1, 2, 2, 3). 

Rank works the same way, but if there are two items sharing the same rank, then the next rank will be skipped (e.g. 1, 2, 2, 4).



:tv: **Identify the count of drama with content rating**

![Query_5 1](https://user-images.githubusercontent.com/123582571/215843223-7123046f-69d7-47bf-8d3b-248da47f2d34.png)

![Query_5](https://user-images.githubusercontent.com/123582571/215836773-3ebeaf1a-94a3-4856-85f5-5a39049c2312.png)



:tv: **Deeper analysis – Netflix’s drama analysis by year and rating** 

![Query_6 1](https://user-images.githubusercontent.com/123582571/215843682-e886cb49-c591-455c-bd4d-d33790f08183.png)

![Query_6](https://user-images.githubusercontent.com/123582571/215843751-42953715-eb99-424b-a8e4-e12ae45ac347.png)

:tv: **Is there a trend for drama rated as “18+Restricted (violence % Profanity)**

![Query_7 1](https://user-images.githubusercontent.com/123582571/215846125-9d781ecc-f6c3-4f34-a8ef-753725d9eeb6.png)

![Query_7](https://user-images.githubusercontent.com/123582571/215836184-806f3151-cf99-4f56-b7a7-58e8dfb02c06.png)

Next, I would like to conduct a deeper analysis of dramas produced by Netflix to investigate the trend of content rating, as Netflix is known for producing a lot of 18+ restricted content. Analysis revealed a trend of increasing number of restricted-content dramas from 2014 to 2022 . A portion of the audience preferred to watch a range of genres rather than conventional romantic Korean dramas. 


:tv: **Identify max rating in 2022 vs Original Network**

![Query_8 1](https://user-images.githubusercontent.com/123582571/215846160-967597fe-2107-44da-92c0-3fbc1c5a7cab.png)

![Query_8](https://user-images.githubusercontent.com/123582571/215838077-e599cfad-db14-48eb-a149-a8485169db77.png)

We would like to focus on drama production in 2022. Among all networks, Netflix emerged as the biggest. Including collaborations with both tvN and ENA, Netflix managed to achieve great drama ratings. Based on the trend nowadays, we could look forward to more collaboration/distribution of dramas in other channels, that expected to achieve better ratings compared to others. 

:tv: **Identify the most common genre combination and max rating**

![Query_9 1](https://user-images.githubusercontent.com/123582571/215838737-9ada3c38-fd86-408d-b63e-823285b61a9b.png)

![Query_9](https://user-images.githubusercontent.com/123582571/215838733-3604303e-498a-4a36-8368-053a5cd0d31d.png)

The genre that garnered the greatest popularity and received the highest ratings was demonstrated in the analysis. It showed that there were 47 dramas with similar genres, such as thriller and mystery, which topped the list. The second most popular genre was a blend of comedy and romance, a combination that is widely accepted by the audience.

:tv:**List out the latest year 2022 to identify the drama that airing in same month and rank the drama to find out the drama rank 1 for each month.**

![Query_10 1](https://user-images.githubusercontent.com/123582571/215840467-22afbf35-ab52-4ce6-b39e-acd5a5a97d3b.png)

![Query_10](https://user-images.githubusercontent.com/123582571/215840466-acc182b2-d772-4105-b223-9d037eb5507a.png)

The last query was to identify the dramas airing in the same month and the drama that ranked number 1 in each month. I used the datepart function to extract the month name and month number, and then used the rank function to identify the highest-ranking drama of each month."



Thank you for viewing! 
