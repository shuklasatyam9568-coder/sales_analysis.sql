--find all row and column
select * from superstore_sales;

-- find only specific column
select sales  from superstore_sales;

--find unique value with catogical data
select  distinct city  from superstore_sales;

--where condition 
select * from superstore_sales
where region = 'West';

--find negetive profit 
select * from superstore_sales
where profit <= 0;


-- find discount where > 0.17
select * from superstore_sales
where Discount >= 0.17;

--multiple condition 
-- find all the order from west rgion where sales < 500

select * from superstore_sales
where region = 'West' and  sales < 500;

--also count the how many total rows we have
select count(*) from superstore_sales
where region = 'West' and  sales < 500;

-- find all the order where fon is not avilable 

select * from superstore_sales
where not  sub_category = 'Phones';

-- multiple condition from same column 

select * from superstore_sales
where region in ('East','West');


-- between oprator 
select * from superstore_sales
where order_date
between '2023-01-01' and '2023-01-31';

-- can you fetch first 5 rows 'limit'
select * from superstore_sales where sub_category = 'Phones'
limit 10;


-- order by o sort our data ase dse 
 select * from superstore_sales order by sales desc limit 5;


-- find top 3 higest sales releted to west region reletd to phone 

select * from superstore_sales where region = 'West' and  sub_category = 'Phones'
 order by sales limit 3;


--except order from east west 
select * from superstore_sales where  region != 'West' and  region != 'East';


/* start with something imp 
aggreate 
group by 
having
sub query
joins */

--now aggregate function of sql 
/* now if youn wanna find 
total of sales 
max sales 
min sales 
avg sales 
that time put agg function */

-- total of sales( sum of all the sales )
select sum(sales) from superstore_sales;

--max sales  
select max(sales) from superstore_sales;


--min sales 
select min(sales) from superstore_sales;

-- for multiple agg function if you wanna find with put alias name
SELECT
    MIN(sales) AS min_sales,
    MAX(sales) AS max_sales,
    AVG(sales) AS avg_sales,
    SUM(sales) AS total_sales
FROM superstore_sales;


-- find the max sales releted to phons from west region

SELECT
    max(sales) AS higest_sales from superstore_sales
	where sub_category= 'Phones' and region = 'West';


-- now can you find rgion wise max sales 

select region,max(sales) from superstore_sales
group by region;

-- now can you find rgion wise max sales  and which is the highest region got a sles

select region,max(sales) from superstore_sales
group by region order by max(sales) desc ;

-- find category wise avg profit higest to lowest profit  

select category , avg (profit)from superstore_sales
group by category  order by avg(profit) desc ;

-- can you find city wise order 

select city,count(*) from superstore_sales
group by city  ;

-- can you find category or region wise max profit
select  category ,region , max (profit) from superstore_sales
group by category ,region;

-- find region wise max sales where city is chiago
select  region ,  max(sales) from superstore_sales
where city= 'Chicago'  group by region;


-- having 

-- findn the region wise sum of sales whiuch is greatr tahn 6000
select  region ,  sum(sales) from superstore_sales
 group by region having  sum(sales)> 60000 ;

 -- find the city where order is more than 100
 select city,count(*)  from superstore_sales
 group by city  having  count(*)>100  ;

 -- 
 select sub_category,avg(sales)  
 from superstore_sales
 where region = 'West'
 group by sub_category 
 having avg(sales)> 500 
 order by avg(sales) desc limit 3   



 --now we have to perfrom join

 -- Create employees table
CREATE TABLE emp_data (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department_id INT
);
-- Create departments table
CREATE TABLE department_data (
department_id INT PRIMARY KEY,
department_name VARCHAR(50);


  
