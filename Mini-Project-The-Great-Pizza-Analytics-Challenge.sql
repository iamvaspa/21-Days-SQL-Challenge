-- 1. Creating a Database IDC_Pizza.
CREATE DATABASE IDC_Pizza;

-- 2. Use a Database IDC_pizza.
USE IDC_Pizza;

-- 3. CREATE a TABLES (PIZZA_TYPES, PIZZAS, ORDERS, ORDER_DETAILS).
-- 1. Create The PIZZA_TYPES Table (No Foreign Keys)
CREATE TABLE PIZZA_TYPES (
    Pizza_Type_ID VARCHAR(50) PRIMARY KEY, -- e.g., 'bbq_ckn'
    NAME VARCHAR(100),                      -- e.g., 'The Barbecue Chicken Pizza'
    Category VARCHAR(50),                   -- e.g., 'Chicken'
    Ingredients TEXT                        -- e.g., 'Barbecued Chicken, Red Peppers, ...'
);

-- 2. Create The PIZZAS Table (FK to pizza_types)
CREATE TABLE PIZZAS (
    Pizza_ID VARCHAR(50) PRIMARY KEY,   -- e.g., 'bbq_ckn_s'
    Pizza_Type_ID VARCHAR(50) REFERENCES PIZZA_TYPES(Pizza_Type_ID),
    Size VARCHAR(10),                   -- e.g., 'S', 'M', 'L'
    Price NUMERIC(5, 2)                 -- e.g., 12.75
);

-- 3. Create The ORDERS Table (No Foreign Keys)
CREATE TABLE ORDERS (
    Order_ID INT PRIMARY KEY,
    Date DATE,
    Time TIME
);

-- 4. Create The ORDER_DETAILS Table (FK to orders and pizzas)
CREATE TABLE ORDER_DETAILS (
    Order_Details_ID INT PRIMARY KEY,
    Order_ID INT REFERENCES ORDERS(Order_ID),
    Pizza_ID VARCHAR(50) REFERENCES PIZZAS(Pizza_ID),
    Quantity INT
);

-- FETCH PIZZA_TYPES Table.
SELECT * FROM PIZZA_TYPES;

-- FETCH PIZZAS Table.
SELECT * FROM PIZZAS;

-- FETCH ORDERS Table.
SELECT * FROM ORDERS;

-- FETCH ORDER_DETAILS Table.
SELECT * FROM ORDER_DETAILS;

-- Task 1: List All Unique Pizza Categories (DISTINCT).		
SELECT
	DISTINCT(Category) AS Unique_Pizza_Categories
FROM PIZZA_TYPES;

-- Task 2: Display PIZZA_TYPE_ID, Name, and Ingredients, Replacing NULL Ingredients with "Missing Data". Show first 5 rows.
SELECT
	PIZZA_TYPE_ID,
    Name,
    IFNULL(Ingredients, 'Missing Data') AS Ingredients
FROM PIZZA_TYPES
LIMIT 5;

-- Task 3: Check for PIZZAS Missing a Price (IS NULL).		
SELECT *
FROM PIZZAS
WHERE PRICE IS NULL;

-- Task 4: Orders Placed on '2015-01-01'.
SELECT *
FROM ORDERS
WHERE Date = '2015-01-01';

-- Task 5: List PIZZAS With Price DESCENDING.
SELECT *
FROM PIZZAS
ORDER BY PRICE DESC;

-- Task 6: PIZZAS Sold in Sizes 'L' or 'XL'.
SELECT *
FROM PIZZAS
WHERE SIZE IN ('L', 'XL');

-- Task 7: PIZZAS Priced Between $15.00 and $17.00.
SELECT *
FROM PIZZAS
WHERE PRICE BETWEEN 15.00 AND 17.00;

-- Task 8: PIZZAS With "Chicken" In The Name.
SELECT *
FROM PIZZA_TYPES
WHERE NAME LIKE '%Chicken%';

-- Task 9: ORDERS on '2015-02-15' or Placed After 8 PM.
SELECT * 
FROM ORDERS
WHERE Date = '2015-02-15' OR Time > '20:00:00';

-- Task 10: Total Quantity of PIZZAS Sold (SUM).
SELECT
    SUM(Quantity) AS Total_Pizzas_Sold
FROM ORDER_DETAILS;

-- Task 11: Average Pizza Price (AVG).
SELECT
	AVG(Price) AS Average_Pizza_Price
FROM PIZZAS;

-- Task 12: Total Order Value Per Order (JOIN, SUM, GROUP BY).
SELECT
	P.PIZZA_ID,
    SUM(P.Price) AS Total_Order_Value
FROM PIZZAS P LEFT JOIN ORDER_DETAILS OD
ON P.PIZZA_ID = OD.PIZZA_ID
GROUP BY P.PIZZA_ID;    

-- Task 13: Total Quantity Sold Per PIZZA Category (JOIN, GROUP BY).
SELECT
	PT.Category,
    COUNT(OD.Quantity) AS Total_Quantity_Sold
FROM PIZZA_TYPES PT 
LEFT JOIN PIZZAS P ON PT.Pizza_Type_ID = P.Pizza_Type_ID
LEFT JOIN ORDER_DETAILS OD ON OD.Pizza_ID = P.Pizza_ID
GROUP BY PT.Category; 

-- Task 14: Categories With More Than 5,000 PIZZAS Sold (HAVING).
SELECT
	PT.Category,
    COUNT(OD.Quantity) AS Total_Quantity_Sold
FROM PIZZA_TYPES PT 
LEFT JOIN PIZZAS P ON PT.Pizza_Type_ID = P.Pizza_Type_ID
LEFT JOIN ORDER_DETAILS OD ON OD.Pizza_ID = P.Pizza_ID
GROUP BY PT.Category
HAVING COUNT(OD.Quantity) > 5000; 

-- Task 15: PIZZAS Never ORDERED (LEFT/RIGHT JOIN).
SELECT 
	P.PIZZA_ID 
FROM PIZZAS P
LEFT JOIN Order_Details OD ON P.PIZZA_ID = OD.PIZZA_ID
WHERE OD.PIZZA_ID IS NULL;

-- Task 16: Price Differences Between Different Sizes of The Same Pizza (SELF JOIN).
SELECT
	P1.PIZZA_TYPE_ID,
	P1.SIZE,
    P1.SIZE AS SIZE_1,
    P2.SIZE AS SIZE_2,
    P1.PRICE AS PRICE_1,
    P2.PRICE AS PRICE_2,
    (P2.PRICE - P1.PRICE) AS Price_Difference
FROM PIZZAS P1 JOIN PIZZAS P2
ON P1.PIZZA_TYPE_ID = P2.PIZZA_TYPE_ID
AND P1.SIZE < P2.SIZE
ORDER BY P1.PIZZA_TYPE_ID, P1.SIZE, P2.SIZE;

SELECT
	PIZZA_TYPE_ID,
    MAX(CASE WHEN SIZE = 'S' THEN PRICE END) AS Small,
    MAX(CASE WHEN SIZE = 'M' THEN PRICE END) AS Medium,
    MAX(CASE WHEN SIZE = 'L' THEN PRICE END) AS Large,
    MAX(CASE WHEN SIZE = 'XL' THEN PRICE END) AS Extra_Large,
    MAX(CASE WHEN SIZE = 'XXL' THEN PRICE END) AS Double_Extra_Large
FROM
	PIZZAS
GROUP BY 
	PIZZA_TYPE_ID
ORDER BY
	PIZZA_TYPE_ID;
    