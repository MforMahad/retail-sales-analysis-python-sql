Create database ecommerce_analysis;

use ecommerce_analysis;


CREATE TABLE online_retal(
	InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate varchar(30),
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(50)
);


-- ***************** The Sanitization Steps ***************** -- 

-- to confirm every thing is good -- 

select count(*)
from online_retal;

-- ********* To check the rows ********** -- 
select * from 
online_retal limit 5;


select
InvoiceNo,
Quantity,
UnitPrice,
Quantity * UnitPrice As Revenue
From online_retal 
limit 10;


select
Country,
round(SUM(Quantity * UnitPrice), 2) As total_revenue
from online_retal
group by Country
order by total_revenue desc;


select
	date_format(InvoiceDate, '%d-%m-%Y') as month,
    round(SUM(Quantity * UnitPrice), 2) as monthly_revenue
from online_retal
group by month
order by month;


select *
from online_retal limit 5;


select CustomerID,
	round(sum(Quantity * UnitPrice), 2) as total_spent
from online_retal
where CustomerID is not null
group by CustomerID
order by total_spent desc
limit 10;
