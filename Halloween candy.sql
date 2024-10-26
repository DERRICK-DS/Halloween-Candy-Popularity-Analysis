SELECT*
FROM candy_table

--1. General Candy Performance
--Which candy has the highest win percentage?

SELECT TOP 1
   competitorname, winpercent 
FROM candy_table 
ORDER BY winpercent DESC 


--Which candy has the lowest win percentage?
SELECT TOP 1
   competitorname, winpercent 
FROM candy_table 
ORDER BY winpercent ASC 

--2. Ingredient Impact on Performance
--How does chocolate impact the win percentage?

SELECT chocolate, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY chocolate

--Do candies with peanuts or almonds have a higher win percentage than those without?

SELECT peanutyalmondy, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY peanutyalmondy

--How does the presence of caramel affect win percentage?

SELECT caramel, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY caramel

--What is the win percentage for candies containing nougat?

SELECT nougat, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY nougat

--3. Price vs Popularity
--What is the average price percentile of the top 10 candies by win percentage?

SELECT TOP 10 competitorname, pricepercent 
FROM candy_table 
ORDER BY winpercent DESC 

--Is there a correlation between price and win percentage?
SELECT competitorname,pricepercent, winpercent 
FROM candy_table;

--Which candies have the highest price percentile but low win percentage?

SELECT competitorname, pricepercent, winpercent 
FROM candy_table 
WHERE winpercent < 50 
ORDER BY pricepercent DESC

--4. Candy Characteristics and Popularity
--Do candy bars perform better than non-bars?

SELECT bar, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY bar

--How do hard candies perform compared to non-hard candies?

SELECT hard, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY hard

--How does the sugar content affect candy win percentage?

SELECT competitorname,sugarpercent, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY competitorname,sugarpercent

--5. Candy Ingredients Combinations
--Which combination of ingredients (chocolate, caramel, peanutyalmondy) results in the highest average win percentage?

SELECT chocolate, caramel, peanutyalmondy, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY chocolate, caramel, peanutyalmondy 
ORDER BY avg_win_percent DESC

--How do candies with both chocolate and nougat perform compared to those with only one or neither?

SELECT chocolate, nougat, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY chocolate, nougat;

--6. Top Candies by Specific Ingredient
--What are the top 5 candies that contain caramel?

SELECT TOP 5 competitorname, winpercent 
FROM candy_table 
WHERE caramel = 1 
ORDER BY winpercent DESC 

--What are the top 5 fruity candies?

SELECT TOP 5  competitorname, winpercent 
FROM candy_table 
WHERE fruity = 1 
ORDER BY winpercent DESC 

--What are the top 5 Chocolate candies?

SELECT TOP 5  competitorname, winpercent 
FROM candy_table 
WHERE chocolate = 1 
ORDER BY winpercent DESC

----What are the top 5 peanutAlmondy candies?

SELECT TOP 5  competitorname, winpercent 
FROM candy_table 
WHERE peanutyalmondy = 1 
ORDER BY winpercent DESC

--7. Candy Characteristics and Distribution
--How many candies in the dataset contain chocolate?

SELECT COUNT(*) 
FROM candy_table 
WHERE chocolate = 1

--How many candies are hard candies vs non-hard candies?

SELECT hard, COUNT(*) AS candy_count 
FROM candy_table 
GROUP BY hard

--8. Candy Types and Bag Distribution
--Do candies that come in a bag or box (pluribus) perform better than individual ones?

SELECT pluribus, AVG(winpercent) AS avg_win_percent 
FROM candy_table 
GROUP BY pluribus

--How many candies are included in bags or boxes (pluribus)?

SELECT COUNT(*) 
FROM candy_table 
WHERE pluribus = 1






























