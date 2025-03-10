# Strategic-Insights-from-Walmart-Sales-Data-Analysis
In the scope of this project, our objective is to delve into the Walmart Sales data, investigating the performance of key branches and products, analyzing sales trends across various product categories, and examining customer behavior. The primary goal is to gain insights into potential enhancements and optimizations for sales strategies.
<p align="center">  
	<br>
	<a href="https://www.walmart.com/">
        <img width=70% src="https://i5.walmartimages.com/dfw/63fd9f59-b3e1/7a569e53-f29a-4c3d-bfaf-6f7a158bfadd/v1/walmartLogo.svg"> 
    </a>
    <br>
    <br>
</p>
## Recommended Analysis 

1. `Product Analysis` - Perform an in-depth analysis of the data to gain insights into various product lines, identify top-performing product lines, and pinpoint areas where improvement is needed for specific product lines.

2. `Sales Analysis` - The objective of this analysis is to explore the sales trends of products, providing valuable insights into the effectiveness of each applied sales strategy. The findings will guide us in identifying necessary modifications to enhance sales performance.

3. `Customer Analysis` - The purpose of this analysis is to reveal distinct customer segments, identify purchasing trends, and assess the profitability associated with each customer segment.



## Approach 

`Data Preparation`

- The initial step involves scrutinizing the data to identify and address NULL or missing values.

- A database is built, tables are created, and data is inserted into the database.

- Setting each field as NOT NULL during table creation ensures the absence of NULL values.


`Feature Engineering` 

New columns are generated from existing ones to enhance the dataset.

- The `"time_of_day"` column categorizes sales into Morning, Afternoon, and Evening, providing insights into peak sales periods.

- The `"day_name"` column captures the day of the week for each transaction (Mon, Tue, Wed, Thur, Fri), aiding in identifying the busiest days for each branch.

- The `"month_name"` column highlights the month of the year for each transaction (Jan, Feb, Mar), facilitating the analysis of monthly sales and profits.


`Exploratory Data Analysis (EDA)` 
The EDA process is undertaken to address the specified questions and achieve the outlined objectives in this project.



## List of Questions

### `A. Generic Questions`

1. How many unique cities does the data have?

2. In which city is each branch?


### `B. Product-related questions`


1. How many unique product lines does the data have?

2. What is the most common payment method?

3. What is the most selling product line?

4. What is the total revenue by month?

5. What month had the largest COGS?

6. What product line had the largest revenue?

7. What is the city with the largest revenue?

8. What product line had the largest VAT?

9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

10. Which branch sold more products than average product sold?

11. What is the most common product line by gender?

12. What is the average rating of each product line?


### `C. Customer-related questions`


1. How many unique customer types does the data have?

2. How many unique payment methods does the data have?

3. What is the most common customer type?

4. Which customer type buys the most?

5. What is the gender of most of the customers?

6. What is the gender distribution per branch?

7. Which time of the day do customers give most ratings?

8. Which time of the day do customers give most ratings per branch?

9. Which day fo the week has the best avg ratings?

10. Which day of the week has the best average ratings per branch?


### `D. Sales-related questions`


1. Number of sales made in each time of the day per weekday

2. Which of the customer types brings the most revenue?

3. Which city has the largest tax percent/ VAT (Value Added Tax)?

4. Which customer type pays the most in VAT?
