To fulfill your requests, I'll provide SQL queries for each scenario:

1. Display all the data of customers:
sql
SELECT * FROM CUSTOMER;


2. Display the product_name and category for products which their price is between 5000 and 10000:
sql
SELECT product_name, category FROM PRODUCT WHERE price BETWEEN 5000 AND 10000;


3. Display all the data of products sorted in descending order of price:
sql
SELECT * FROM PRODUCT ORDER BY price DESC;


4. Display the total number of orders, the average amount, the highest total amount, and the lower total amount:
sql
SELECT 
    COUNT(*) AS TotalOrders,
    AVG(amount) AS AverageAmount,
    MAX(amount) AS HighestTotalAmount,
    MIN(amount) AS LowerTotalAmount
FROM ORDERS;


5. For each product_id, display the number of orders:
sql
SELECT product_id, COUNT(*) AS NumberOfOrders FROM ORDERS GROUP BY product_id;


6. Display the customer_id which has more than 2 orders:
sql
SELECT customer_id FROM ORDERS GROUP BY customer_id HAVING COUNT(*) > 2;


7. For each month of the 2020 year, display the number of orders:
sql
SELECT EXTRACT(MONTH FROM order_date) AS Month, COUNT(*) AS NumberOfOrders 
FROM ORDERS 
WHERE EXTRACT(YEAR FROM order_date) = 2020 
GROUP BY EXTRACT(MONTH FROM order_date);


8. For each order, display the product_name, the customer_name, and the date of the order:
sql
SELECT o.order_id, p.product_name, c.customer_name, o.order_date
FROM ORDERS o
JOIN PRODUCT p ON o.product_id = p.product_id
JOIN CUSTOMER c ON o.customer_id = c.customer_id;


9. Display all the orders made three months ago:
sql
SELECT * 
FROM ORDERS 
WHERE order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH) 
AND order_date < CURRENT_DATE();


10. Display customers (customer_id)