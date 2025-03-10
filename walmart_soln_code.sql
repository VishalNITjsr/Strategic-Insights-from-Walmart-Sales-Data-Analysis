-- A. Generic Questions
-- How many unique cities does the data have?
SELECT DISTINCT city
FROM   wm_sales_data ;

-- In which city is each branch?
SELECT DISTINCT city, branch
FROM   wm_sales_data ;

-- B. Product-related questions
-- How many unique product lines does the data have?
SELECT COUNT(DISTINCT product_line) as count
FROM   wm_sales_data ;

-- What is the most common payment method?
SELECT   payment_method,
         Count(payment_method) as count
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC 
LIMIT    1;

-- What is the most selling product line?
SELECT   product_line,
         Count(product_line)
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC ;

-- What is the total revenue by month?
SELECT   month_name,
         SUM(total) AS total_sum
FROM     wm_sales_data
GROUP BY 1
ORDER BY 1 DESC; 

-- What month had the largest COGS?
SELECT   month_name AS month,
         SUM(cogs)  AS total_cogs
FROM     wm_sales_data
GROUP BY 1
ORDER BY 1 DESC
LIMIT    1; 

-- What product line had the largest revenue?
SELECT   product_line,
         SUM(total) AS total_revenue
FROM     wm_sales_data
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT    1;

-- What is the city with the largest revenue?
SELECT   city,
         SUM(total) AS total_revenue
FROM     wm_sales_data
GROUP BY city
ORDER BY total_revenue DESC
LIMIT    1;

-- What product line had the largest VAT?
SELECT   product_line,
         ROUND(SUM(VAT), 2) AS total_VAT
FROM     wm_sales_data
GROUP BY product_line
ORDER BY total_VAT DESC
LIMIT    1;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if it's greater than average sales.
SELECT DISTINCT product_line,
                total AS sales,
                CASE
                  WHEN total > Avg(total)THEN 'Good'
                  ELSE 'Bad'
                END   AS sales_category
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC; 

-- Which branch sold more products than average products sold?
SELECT   branch,
         Sum(quantity) AS total_qty
FROM     wm_sales_data
GROUP BY 1
HAVING   Sum(quantity) > Avg(quantity); 

-- What is the most common product line by gender?
WITH CTE
     AS (SELECT   product_line,
                  gender,
                  Count(*) AS line_count
         FROM     sales
         GROUP BY 1, 2)

SELECT gender,
       product_line,
       line_count
FROM   (SELECT gender,
               product_line,
               line_count,
               Row_number()
                 OVER (
                   partition BY gender
                   ORDER BY 3 DESC) AS rn
        FROM   CTE) AS ranked
WHERE  rn = 1; 

-- What is the average rating of each product line?
SELECT   product_line,
         ROUND(AVG(rating), 2) AS avg_rating
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC;

-- C. Customer-related questions
-- How many unique customer types does the data have?
SELECT DISTINCT (customer_type)
FROM            wm_sales_data; 

-- How many unique payment methods does the data have?
SELECT DISTINCT (payement_method)
FROM             wm_sales_data; 

-- What is the most common customer type?
SELECT   customer_type,
         Count(*) AS count
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT    1;

-- Which customer type buys the most?
SELECT   customer_type,
         Round(Sum(total), 2) AS total
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT    1;

-- What is the gender of most of the customers?
SELECT   gender,
         Count(*) AS gender_count
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC;

-- What is the gender distribution per branch?
 SELECT   gender,
         branch,
         Count(*) AS gender_count
FROM     wm_sales_data
GROUP BY 1,
         2; 
         
-- Which time of the day do customers give most ratings?
SELECT   time_of_day,
         ROUND(AVG(rating), 2) avg_rating
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC; 

-- Which time of the day do customers give most ratings per branch?
SELECT   time_of_day,
         branch,
         ROUND(AVG(rating), 2) avg_rating
FROM     wm_sales_data
GROUP BY 1, 2
ORDER BY 2, 3 DESC; 


WITH cte
     AS (SELECT   branch,
                  time_of_day,
                  Round(Avg(rating), 2) AS average_rating,
                  Row_number()
                   OVER (
                     partition BY branch
                     ORDER BY Avg(rating) DESC) AS rn
         FROM     wm_sales_data
         GROUP BY branch,
                  time_of_day)
SELECT branch,
       time_of_day,
       average_rating
FROM   cte
WHERE  rn = 1; 

-- Which day of the week has the best average ratings?
SELECT   day_name,
         Round(Avg(rating), 2) AS avg_rating
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC; 

-- Which day of the week has the best average ratings per branch?
SELECT   day_name,
         branch,
         Round(Avg(rating), 2) AS avg_rating
FROM     wm_sales_data
GROUP BY 1, 2
ORDER BY 2, 3 DESC; 

-- D. Sales-related questions
-- Number of sales made in each time of the day per weekday.
SELECT   day_name,
         time_of_day,
         Count(*) AS sales_count
FROM     wm_sales_data
GROUP BY 1,
         2
ORDER BY 2,
         3; 

-- Which of the customer types brings the most revenue?
SELECT   customer_type,
         Round (Sum(total), 2) AS total_revenue
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC; 

-- Which city has the largest tax percent/VAT (Value Added Tax)?
SELECT   city,
         Round(Avg(vat), 2) AS value_added_tax
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC;

-- Which customer type pays the most in VAT?
SELECT   customer_type,
         Round(Avg(vat), 2) AS value_added_tax
FROM     wm_sales_data
GROUP BY 1
ORDER BY 2 DESC;