use pizza_DB

select * from dbo.pizza_sales

exec sp_columns "pizza_sales"

select sum(total_price) as Total_Revenue from dbo.pizza_sales

select sum(total_price)*1.0/count(distinct(order_id)) as Average_Order_Value  from dbo.pizza_sales

select sum(quantity) as Total_Quantity from dbo.pizza_sales

select count(distinct(order_id)) as Total_No_Orders from dbo.pizza_sales

select cast(sum(quantity)*1.0 / count(distinct(order_id)) as decimal(10,2) )as Average_Pizzas_Per_Order from dbo.pizza_sales

select DATEName(DW,order_date) as order_day , count(distinct order_id) as Total_orders from dbo.pizza_sales group by DATEName(DW,order_date) 

select DATEName(MONTH,order_date) as order_month , count(distinct order_id) as Total_orders from dbo.pizza_sales group by DATEName(MONTH,order_date) order by Total_orders DESC

select pizza_category, sum(total_price)*100 / (select sum(total_price) from dbo.pizza_sales) from dbo.pizza_sales group by pizza_category

select pizza_category, sum(total_price)*100 / (select sum(total_price) from dbo.pizza_sales ) as PCT
from dbo.pizza_sales 
group by pizza_category

select pizza_size, sum(total_price)*100 / (select sum(total_price) from dbo.pizza_sales ) as PCT
from dbo.pizza_sales 
group by pizza_size


--select * from dbo.pizza_sales

-- Top 5 & Bottom 5 Pizza's BY Revenue

select top 5 pizza_name, sum(total_price)as Total_Revenue from dbo.pizza_sales
group by pizza_name
order by Total_Revenue DESC

select top 5 pizza_name, sum(total_price)as Total_Revenue from dbo.pizza_sales
group by pizza_name
order by Total_Revenue 

-- Top 5 & Bottom 5 Pizza's By Quantity

select top 5 pizza_name, sum(quantity)as Total_Quantity from dbo.pizza_sales
group by pizza_name
order by Total_Quantity DESC

select top 5 pizza_name, sum(quantity)as Total_Quantity from dbo.pizza_sales
group by pizza_name
order by Total_Quantity 

select top 5 pizza_name, count(distinct order_id)as Total_Orders from dbo.pizza_sales
group by pizza_name
order by Total_Orders DESC
