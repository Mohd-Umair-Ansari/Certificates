Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer. 



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000
vi. Checkin = 493
vii. Photo = 10000
viii. Tip = 537 (user_id)
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer: 

select * from user 
	where   id is null or
		name is null or
		review_count is null or
		yelping_since is null or
		useful is null or
		funny is null or
		cool is null or
		fans is null or
		average_stars is null or
		compliment_hot is null or
		compliment_more is null or
		compliment_profile is null or
		compliment_cute is null or
		compliment_list is null or
		compliment_note is null or
		compliment_plain is null or
		compliment_cool is null or
		compliment_funny is null or
		compliment_writer is null or
		compliment_photos is null 	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0	max: 5.0	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer: 

SELECT 
    city, SUM(review_count) AS Reviews
FROM
    business
GROUP BY city
ORDER BY Reviews DESC
	
	
	Copy and Paste the Result Below:

+-----------------+---------+
| city            | Reviews |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+
(Output limit exceeded, 25 of 362 total rows shown)

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT 
    stars, count
FROM
    (SELECT 
        stars, city, COUNT(stars) AS count
    FROM
        business
    GROUP BY stars , city
    HAVING city = 'Avon')


Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+-------+-------+
| stars | count |
+-------+-------+
|   1.5 |     1 |
|   2.5 |     2 |
|   3.5 |     3 |
|   4.0 |     2 |
|   4.5 |     1 |
|   5.0 |     1 |
+-------+-------+


ii. Beachwood

SQL code used to arrive at answer:

SELECT 
    stars, count
FROM
    (SELECT 
        stars, city, COUNT(stars) AS count
    FROM
        business
    GROUP BY stars , city
    HAVING city = 'Beachwood')


Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+-------+-------+
| stars | count |
+-------+-------+
|   2.0 |     1 |
|   2.5 |     1 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.0 |     1 |
|   4.5 |     2 |
|   5.0 |     5 |
+-------+-------+
		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

SELECT 
    name, SUM(review_count) AS Total_Reviews
FROM
    user
GROUP BY name
ORDER BY Total_Reviews DESC
LIMIT 3
	
		
	Copy and Paste the Result Below:

+--------+---------------+
| name   | Total_Reviews |
+--------+---------------+
| Nicole |          2397 |
| Sara   |          2253 |
| Gerald |          2034 |
+--------+---------------+
		


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:

As table below illustrates, posing more reviews does not necessarily correlate with more fans. For example, although, Nicole has posed the most reviews, she has fewer fans in comparison with Amy (who has the maximum fans - 519). Therefore, sorting the users in descending order based on their total number of reviews does not sort the fans in the same order, meaning that there is not a correlation between the total number of reviews and number of fans.

SELECT 
    name,
    SUM(review_count) AS Total_reviews,
    SUM(fans) AS Total_fans
FROM
    user
GROUP BY name
ORDER BY Total_reviews DESC

+-----------+---------------+------------+
| name      | Total_reviews | Total_fans |
+-----------+---------------+------------+
| Nicole    |          2397 |        200 |
| Sara      |          2253 |         72 |
| Gerald    |          2034 |        256 |
| Lisa      |          2021 |        207 |
| Mark      |          1945 |        156 |
| Jennifer  |          1862 |         86 |
| Jen       |          1744 |        148 |
| Michelle  |          1737 |        133 |
| Melissa   |          1678 |        104 |
| William   |          1639 |        142 |
| Karen     |          1625 |        123 |
| Justin    |          1572 |         78 |
| Rachel    |          1519 |         79 |
| Daniel    |          1441 |         75 |
| Sarah     |          1436 |        100 |
| Chris     |          1419 |         52 |
| Jeff      |          1410 |         45 |
| Mike      |          1400 |        119 |
| Yuri      |          1341 |         76 |
| Dan       |          1333 |         44 |
| Christine |          1309 |        187 |
| John      |          1264 |         46 |
| Jessica   |          1248 |        116 |
| .Hon      |          1246 |        101 |
| Matt      |          1239 |         62 |
+-----------+---------------+------------+
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There are more reviews containing the word love


	
	SQL code used to arrive at answer:

SELECT 
    COUNT(*) AS Number_of_Reviews_containing_love
FROM
    review
WHERE
    text LIKE '%love%'

+---------------------------------+
| Number_of_Reviews_containing_love |
+---------------------------------+
|                            1780 |
+---------------------------------+

SELECT 
    COUNT(*) AS Number_of_Reviews_containing_love
FROM
    review
WHERE
    text LIKE '%hate%'

+---------------------------------+
| Number_of_Reviews_containing_love |
+---------------------------------+
|                             232 |
+---------------------------------+

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
SELECT 
    name, SUM(fans) AS Total_fans
FROM
    user
GROUP BY name
ORDER BY Total_fans DESC
LIMIT 10
	
	Copy and Paste the Result Below:

+-----------+------------+
| name      | Total_fans |
+-----------+------------+
| Amy       |        519 |
| Mimi      |        498 |
| Harald    |        311 |
| Gerald    |        256 |
| Lisa      |        207 |
| Nicole    |        200 |
| Christine |        187 |
| Mark      |        156 |
| Jen       |        148 |
| Linda     |        148 |
+-----------+------------+

	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

City: Mesa        Category: Food 
	
i. Do the two groups you chose to analyze have a different distribution of hours?

Yes


ii. Do the two groups you chose to analyze have a different number of reviews?

Yes
         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

Based on the results, we can see that there seems to be a correlation between the location of the business and their rating. The business that are probably located in the same neighbor have close rating. Also they have similar working hours. Moreover, the business that have longer working hours usually have higher rating. 

SQL code used for analysis:

SELECT 
    b.name,
    b.city,
    c.category,
    b.stars,
    h.hours,
    b.review_count,
    b.postal_code
FROM
    business b
        INNER JOIN
    category c ON b.id = c.business_id
        INNER JOIN
    hours h ON h.business_id = c.business_id
WHERE
    business.city = 'Mesa'
GROUP BY business.stars

		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         
The business that are still open have higher rating.

ii. Difference 2:
         
The business that are still open have more reviews.
         
         
SQL code used for analysis:

SELECT 
    b.name,
    b.is_open,
    c.category,
    b.stars,
    h.hours,
    b.review_count,
    b.postal_code
FROM
    business
        INNER JOIN
    category ON business.id = category.business_id
        INNER JOIN
    hours ON hours.business_id = category.business_id
WHERE
    business.city = 'Mesa'
GROUP BY business.is_open;	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
    
Finding correlation between the likes with the given rates and using "like" in the reviews.     
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

I need two sources of data (tables). First, I join these two tables based on users and business. Then I sort them based on rating to see if there is a correlation between the number of stars and likes. 
The reason I chose this analysis and thus, the data sets is that psychologists have shown that how people think about something can completely change even after a few minutes and they think that how people think just after occurrence of an event is a better representative for the quality of that event compared to what they say after thinking about it. Because tip table is related to the occurrence of the event (shopping) and they write a review after hours or even days, comparing these two tables can help us to explore the validity what psychologists claim. As the result shows there is a slight correlation between the number of likes and stars, but this correlation is not strong. So what psychologists claim seems to be fairly valid.  
                           
                  
iii. Output of your finished dataset:

	
+-------+-------+
| stars | likes |
+-------+-------+
|     3 |     2 |
|     5 |     2 |
|     5 |     1 |
|     5 |     1 |
|     5 |     1 |
|     5 |     1 |
|     5 |     1 |
|     5 |     1 |
|     5 |     1 |
|     5 |     1 |
|     3 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
|     4 |     1 |
+-------+-------+
         
         
iv. Provide the SQL code you used to create your final dataset:

SELECT 
    r.stars, t.likes
FROM
    review r
        INNER JOIN
    tip t ON r.user_id = t.user_id
ORDER BY t.likes DESC;