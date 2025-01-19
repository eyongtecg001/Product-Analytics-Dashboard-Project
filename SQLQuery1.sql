 -- CTE Common Table Expression
WITH CTE AS (

SELECT
a.Product,
a.Category,
a.Brand,
a.Description,
a.Sale_Price,
a.Cost_Price,
a.Image_url,
b.date,
b.customer_Type,
b.Discount_Band,
b.Units_Sold,
(sale_price*Units_Sold )AS revenue,
(Cost_Price*Units_Sold )AS total_cost,
 FORMAT (date,'MMMM') AS month,
 FORMAT(date, 'yyyy') AS year
FROM Product_data   a
JOIN product_sales  b
ON a.Product_ID = b.Product)

SELECT
*
,
(1 - discount*1.0/100) * revenue AS discount_revenue
FROM CTE a
JOIN discount_data b
ON a.Discount_Band = b.Discount_Band AND a.month = b.Month;