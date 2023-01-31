# kdrama_analysis

:strawberry: **About dataset** 
This dataset contains top-ranked 250 Korean dramas as per MyDramaList website. 
The CSV file contains 17 columns as below: 

| Column Name             | Category     | Description                                                       |                                                                                                                                                                         |
|-------------------------|--------------|-------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Age                     | Numeric      | The age of the patient.                                           |                                                                                                                                                                         |
| Sex                     | Categorical  | The gender of the patient.                                        | 1= male , 0 = female                                                                                                                                                    |
| Chest Pain Type         | Categorical  | The type of chest pain experienced by the patient.                | 1= typical angina  2= atypical angina  3= non-anginal pain  4= asymptomatic                                                                                             |
| BP                      | Numeric      | The blood pressure level of the patient.                          | resting blood pressure (in mmgHg on admission to hospital)                                                                                                              |
| Cholesterol             | Numeric      | The cholesterol level of the patient.                             | serum cholesterol in mg/dl                                                                                                                                              |
| FBS over 120            | Numeric      | The fasting blood sugar test results over 120 mg/dl.              | 1= true, 0= false                                                                                                                                                       |
| EKG Results             | Categorical  | The electrocardiogram results of the patient.                     | 0= normal  1= having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of 0.05mV) 2= showing probable or definite left ventricular hypertrophy |
| Max HR                  | Numeric      | The maximum heart rate levels achieved during exercise testing.   |                                                                                                                                                                         |
| Exercise angina         | Categorical  | The angina experienced during exercise testing.                   | 1= yes, 0= no                                                                                                                                                           |
| ST depression           | Numeric      | The ST depression on an Electrocardiogram.                        | ST depression induced by exercise relative to rest                                                                                                                      |
| Slope of ST             | Categorical  | The slope of ST segment electrocardiogram readings.               | (mg                                                                                                                                                                     |
| Number of vessels fluro | Numeric      | The amount vessels seen in Fluoroscopy images.                    | number of major vessels colored by fluoroscopy                                                                                                                          |
| Thallium                | Categorical  | The Thallium Stress test findings.                                | 3= normal, 6= fixed defect , 7= reversible defect                                                                                                                       |
| Heart Disease           | Categorical  | Whether or not the patient has been diagnosed with Heart Disease. | Presence/ Absent                                                                                                                                                        |




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
