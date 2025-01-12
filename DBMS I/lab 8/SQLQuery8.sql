
----------Group by with having and Order by----------

					-----PART-A-----
create table Sales_Data (
	rigion varchar(30),
	product varchar(30),
	sales_Amount int,
	year int,
)
insert into Sales_Data(rigion,product,sales_Amount,year) values
					('North America', 'Watch', 1500, 2023),
					('Europe', 'Mobile', 1200, 2023),
					('Asia', 'Watch', 1800, 2023),
					('North America', 'TV', 900, 2024),
					('Europe', 'Watch', 2000, 2024),
					('Asia', 'Mobile' ,1000, 2024),
					('North America', 'Mobile', 1600, 2023),
					('Europe', 'TV', 1500, 2023),
					('Asia', 'TV', 1100, 2024),
					('North America', 'Watch', 1700, 2024)

select * from Sales_Data

--1. Display Total Sales Amount by Region.
	select rigion,sum(sales_Amount) as Total_Sales_Amount
	from Sales_Data
	group by rigion

--2. Display Average Sales Amount by Product
	select product,avg(sales_Amount) as Average_Sales_Amount
	from Sales_Data
	group by product

--3. Display Maximum Sales Amount by Year
	select year,max(sales_Amount) as Maximum_Sales_Amount
	from Sales_Data
	group by year

--4. Display Minimum Sales Amount by Region and Year
	select rigion,year,min(sales_Amount) as Minimum_Sales_Amount
	from Sales_Data
	group by rigion,year

--5. Count of Products Sold by Region
	select rigion,count(product) as Products_Sold
	from Sales_Data
	group by rigion

--6. Display Sales Amount by Year and Product
	select year,product,sum(sales_Amount) as Sales_Amount
	from Sales_Data
	group by year,product

--7. Display Regions with Total Sales Greater Than 5000
	select rigion,sum(sales_Amount) as Total_Sales
	from Sales_Data
	group by rigion
	having sum(sales_Amount) > 5000

--8. Display Products with Average Sales Less Than 10000
	select product,avg(sales_Amount) as Average_Sales
	from Sales_Data
	group by product
	having avg(sales_Amount) < 10000

--9. Display Years with Maximum Sales Exceeding 500
	select year,max(sales_Amount) as Maximum_Sales
	from Sales_Data
	group by year
	having max(sales_Amount) > 500

--10. Display Regions with at Least 3 Distinct Products Sold.
	select rigion,count(distinct product) as Distinct_Products_Sold
	from Sales_Data
	group by rigion
	having count(distinct product) > 2

--11. Display Years with Minimum Sales Less Than 1000
	select year,min(sales_Amount) as Minimum_Sales
	from Sales_Data
	group by year
	having min(sales_Amount) < 1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
	select rigion,sum(sales_Amount) as Total_Sales_Amount
	from Sales_Data
	where year=2023
	group by rigion
	order by sum(sales_Amount)



						-----PART-B-----
--1. Display Count of Orders by Year and Region, Sorted by Year and Region
	select year,rigion,count(product) as Orders_Products
	from Sales_Data
	group by year,rigion
	order by year,rigion

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
	select rigion,max(sales_Amount) as Maximum_Sales 
	from Sales_Data
	group by rigion
	having max(sales_Amount) > 1000
	order by rigion

--3. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending
	select year,sum(sales_Amount) as Total_Sales_Amount
	from Sales_Data
	group by year
	having sum(sales_Amount) < 1000
	order by year desc

--4. Display Top 3 Regions by Total Sales Amount in Year 2024
	select top 3 rigion,sum(sales_Amount) as Total_Sales_Amount 
	from Sales_Data
	where year=2024
	group by rigion



						-----PART-C-----
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
	select product,avg(sales_Amount) as Average_Sales_Amount
	from Sales_Data
	group by product
	having avg(sales_Amount) between 1000 and 2000
	order by product

--2. Display Years with More Than 5 Orders from Each Region
	select rigion, year AS OrderYear, COUNT(product) AS OrderCount
	from Sales_Data
	group by rigion, year
	having COUNT(product) > 5

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
	select rigion, AVG(Sales_Amount) AS Average_Sales_Amount
	from Sales_Data
	where year = 2023
	group by rigion
	having AVG(Sales_Amount) > 1500
	order by Average_Sales_Amount DESC

--4. Find out region wise duplicate product.
	select rigion, Product, COUNT(*) AS DuplicateCount
	from Sales_Data
	group by rigion, Product
	having COUNT(*) > 1

--5. Find out region wise highest sales amount.
	select rigion, MAX(Sales_Amount) AS Highest_Sales_Amount
	from Sales_Data
	group by rigion
