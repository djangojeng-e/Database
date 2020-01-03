# SQL NULL VALUES 



A field with a NULL value is a field with no value. 



If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a NULL value. 



**NB** A NULL value is different from a zero value or a field that contains spaces. A field with a NULL value is one that has been left blank during record creation. 





## Testing for NULL VALUES 



NULL values cannot be compared with normal comparison operators. NULL values can only be assessed or tested using IS NULL or IS NOT NULL operators instead. 



```sql

# This statement below is listing all customers with a NULL value in the 'ADDRESS' field. 

SELECT CustomerName, ContactName, Address 
FROM Customers 
WHERE Address IS NULL;

# This statement below is listing all customers with a value in the 'ADDRESS' field. 

SELECT CustomerName, ContactName, Address 
FROM Customers 
WHERE Address IS NOT NULL; 

```





# The SQL UPDATE STATEMENT 



UPDATE statement is used to modify the existing records in a table. 



```sql
# The following statement updates the first customer with a new contact person and a new city 

UPDATE Customers 
SET ContactName = 'Alfred Schmidt', City = 'FrankFurt'
WHERE CustomerID = 1;
```





**NB** If you do not use WHERE, update statement updates all records! Be careful with that. 





## UPDATE MULTIPLE RECORDS 



Use WHERE clause that determines how many records will be updated. 



```sql
# The following statement will update the contactname to 'Juan' for all records where country is 'Mexico'

UPDATE Customers 
SET ContactName = 'Juan'
WHERE Country = 'Mexico'
```





# SQL DELETE Statement 



Delete statement is used to delete existing records in a table. 



**NB If you do not use WHERE clause in the DELETE statement, all records in the table will be deleted!**







```sql
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
```







# SQL LIMIT 



SQL supports LIMIT statement to list the first or top few records from tables. 



```sql
SELECT * FROM Customers 
LIMIT 3; 

SELECT * FROM Customers 
WHERE Country='Germany'
LIMIT 3; 
```





# SQL MIN() and MAX() Functions 



MIN() returns the smallest value of the selected column 



MAX() function returns the largest value of the selected column. 



```sql
SELECT MIN(Price) AS SmallestPrice
FROM Products; 

SELECT MAX(Price) AS LargestPrice 
FROM Products; 

```







# COUNT(), AVG() and SUM() Functions 



COUNT() returns the number of rows that matches specified criteria. 

AVG() function returns the average value of a numeric column 

SUM() function returns the total sum of a numeric column 





```sql
--COUNT() EXAMPLE 

SELECT COUNT(ProductID)
FROM Products; 

--AVG() Example 

SELECT AVG(Price)
FROM Products;

--SUM()

SELECT SUM(Quantity)
FROM OrderDetails 

```







# The SQL LIKE OPERATOR 





The LIKE operator is used in a WHERE clause to search for a specified pattern in a column. 



- % - represents zero, one, or multiple characters 
- _ - represents a single character 



```sql

-- WHERE CustomerName LIKE 'a%' - > Finds any value starts with "a"
-- WHERE CustomerName LIKE '%a' - > Finds any value end with 'a'
-- WHERE CustomerName LIKE '%or%' -> Finds any values that have 'or' in any position 
-- WHERE CustomerName LIKE '_r%' -> Finds any values that have 'r' in the second position 
-- WHERE CustomerName Like 'a__%' -> Finds any values that start with 'a' and are at least 3 characters in length 
-- WHERE ContactName LIKE 'a%o' -> Finds any values that start with 'a' and ends with 'o'

```





Examples 



```sql
-- Selects all customers with CustomerName starting with 'a'
SELECT * FROM Customers 
WHERE CustomerName LIKE 'a%'; 


-- Selects all customers with CustomerName ending with 'a'
SELECT * FROM Customers 
WHERE CustomerName LIKE '%a';


-- Selects all customers with CustomerName that have 'or' in any position
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';


-- Selects all customers with a CustomerName that have 'r' in the second position 
SELECT * FROM Customers 
WHERE CustomerName LIKE '_r%';


-- Selects all customers with CustomerName that starts with 'a' and are at least 3 characters in length 

Select * FROM Customers 
WHERE CustomerName LIKE 'a__%';


-- Selects all customers with ContactName that starts with 'a' ends with 'o'

SELECT * FROM Customers
WHERE ContactName LIKE 'a%o'; 


-- Selects all customers with Customername THAT DOES NOT START with 'a'

SELECT * FROM Customers 
WHERE CustomerName NOT LIKE 'a%';


```





## USING _ , % WILDCARD 



```sql
-- Selects all customers with a City starting with 'ber'
SELECT * FROM Customers 
WHERE City LIKE 'ber%';

-- Selects all customers with a City containing the patterns 'es'
SELECT * FROM Customers 
WHERE City LIKE '%es%'; 

-- Selects all customers with a City starting with any character, followed by 'ondon'
SELECT * FROM Customers 
WHERE City LIKE '_ondon'; 

-- Selects all customers with a City starting with "L", followed by any character, 
-- followed by 'n', followed by any character, follwed by 'on': 

SELECT * FROM Customers 
WHERE City LIKE 'L_n_on'; 


-- Selects all customers with a City starting with 'b', 's', or 'p'
SELECT * FROM Customers 
WHERE City LIKE '[bsp]%'; 

-- Selects all customers with a City starting with 'a', 'b' or 'c'
SELECT * FROM Customers 
WHERE City LIKE '[a-c]%';


-- Selects all customers with a City NOT starting with 'b','s' or 'p'
SELECT * FROM Customers 
WHERE City LIKE '[!bsp]%'

--or 

SELECT * FROM Customers 
WHERE City NOT LIKE '[bsp]%';


```



# SQL IN Operator 





The IN operator allows you to specify multiple values in a WHERE clause 



```sql
-- Selects all customers that are located in 'Germany', 'France' or 'UK'

SELECT * FROM Customers 
WHERE Country IN ('Germany', 'France', 'UK')

-- Selects all Customers that are NOT located in 'Germany', 'France' or 'UK'

SELECT * FROM Customers 
WHERE Country NOT IN ('Germany', 'France', 'UK');

-- selects all customers that are from the same countries as the suppliers 

SELECT * FROM Customers 
WHERE Country IN (SELECT Country FROM Suppliers)



```





# SQL BETWEEN OPERATOR 



The BETWEEN operator selects values within a given range. The values can be numbers, text, dates. 





```sql
-- Selects all products with a price between 10 and 20 

SELECT * FROM Products 
WHERE Price BETWEEN 10 AND 20;

-- Display the products outside the range of the previous example 

SELECT * FROM Products 
WHERE Price NOT BETWEEN 10 AND 20; 

-- Selects all products with a price between 10 and 20. Not With a cateogory ID of 1,2 or 3 
SELECT * FROM Products 
WHERE Price BETWEEN 10 AND 20 
AND NOT CategoryID IN (1,2,3)

-- Selects all products with a ProductName BETWEEN Carnarvon Tigers and Mozzarella di Giovanni 
SELECT * FROM Products 
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName; 

-- Selects all products with a ProductName Between Carnarvon Tigers and Chef Anton's Cajun Seasoning 

SELECT * FROM Products 
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Chef Anton's Cajun's Seasoning'
ORDER BY ProductName 

```





# SQL Aliases 



SQL aliases are used to give a table, or a column in a table, a temporary name. 



Aliases are often used to make column names more readable. 



Alias for Columns Examples 



```sql
SELECT CustomerID AS ID, CustomerName AS Customer 
FROM Customers; 

-- Two aliases, one for the CustomerName and the another for ContactName 

SELECT CustomerName AS Customer, ContactName AS [Contact Person] FROM Customers; 


-- Creates an alias named 'Address' that combine four columns(Address, PostalCode, City and Country)

SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country 
AS Address FROM Customers; 

```





# SQL JOINS 





A JOIN Clause is used to combine rows from two or more tables, based on a related column between them. 





```sql
-- Create the INNER JOIN that selects records that have matching values in both tables. 
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
```





**INNER JOIN** - Returns records that have matching values in both tables. 

**LEFT (OUTER) JOIN **- Returns all records from the left table, and the matched records from the right table. 

**RIGHT (OUTER) JOIN** - Returns all records from the right table, and the matched records from the left table 

**FULL(OUTER) JOIN**- Returns all records when there is a match in either left or right table 





![SQL INNER JOIN](https://www.w3schools.com/sql/img_innerjoin.gif)





![SQL LEFT JOIN](https://www.w3schools.com/sql/img_leftjoin.gif)





![SQL RIGHT JOIN](https://www.w3schools.com/sql/img_rightjoin.gif)







![SQL FULL OUTER JOIN](https://www.w3schools.com/sql/img_fulljoin.gif)





# INNER JOIN 







![SQL INNER JOIN](https://www.w3schools.com/sql/img_innerjoin.gif)





```sql
-- Selects all orders with customer information 

SELECT Orders.OrderId, Customers.CustomerName 
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID; 


-- Selects all orders with customer and shipper information 


SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName FROM 
(
(Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID); 


```





# SQL LEFT JOIN KEYWORD 



The LEFT JOIN keyword returns all records from the left table and the matched records from the right table. The result is NULL from the right side, if there is no match. 





![SQL LEFT JOIN](https://www.w3schools.com/sql/img_leftjoin.gif)





```sql
SELECT Customers.CustomerName, Orders.OrderID 
FROM Customers 
LEFT JOIN Orders ON Customers.CustomerID = ORders.CustomerID 
ORDER BY Customers.CustomerName;
```







# SQL RIGHT JOIN KEYWORD 



The RIGHT JOIN keyword returns all records from the right table and the matched records from the left table. The result is NULL from the left side, when there is no match. 





![SQL RIGHT JOIN](https://www.w3schools.com/sql/img_rightjoin.gif)







```sql
-- Return all employees, and any orders they might have placed 

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName From Orders 
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID 
ORDER BY Orders.OrderID; 


```





# SQL FULL OUTER JOIN KEYWORD 



The FULL OUTER JOIN Keyword returns all records when there is a match in left or right table records 





![SQL FULL OUTER JOIN](https://www.w3schools.com/sql/img_fulljoin.gif)







```sql
SELECT Customers.CustomerName, Orders.OrderID 
FROM Customers 
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID 
ORDER BY Customers.CustomerName; 

```





# The SQL Union operator 



The UNION operator is used to combine the result-set of two or more SELECT statements 



- Each select statements within UNION must have the same number of columns 
- The columns must also have similar data types 
- The Columns in each SELECT statement must also be in the same order 







```sql
-- Returns the cities (Only distinct Values) from both the 
-- "Customers" and 'Suppliers' table 

SELECT City FROM Customers 
UNION 
SELECT City FROM Suppliers 
ORDER BY City; 

-- Returns the cities (Duplicate values also) from both the 'Customers' and 'Suppliers'

SELECT City FROM Customers 
UNION ALL 
SELECT City FROM Suppliers 
ORDER BY City; 

-- Returns the German cities (Only Distinct Values) from both the 'customers' and the 'Suppliers'

SELECT City, Country FROM Customers 
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers 
WHERE Country='Germany'
ORDER BY City; 

-- Returns the German Cities (Duplicate values also) from both the Customers and The Suppliers Table 

SELECT City, Country FROM Customers 
WHERE Country='Germany'
UNION ALL 
SELECT City, Country FROM Suppliers 
WHERE Country='GERMANY'
ORDER BY City; 

```





# SQL GROUP BY STATEMENT 





The GROUP BY statement groups rows that have the same values into summary rows, like 'find the number of customers in each country' 



The GROUP BY statement is often used with aggregate functions (COUNT, MAX, MIN, SUM. AVG) to group the result-set by one or more columns 



```sql
-- lists the number of customers in each country 
SELECT COUNT(CustomerID), Country 
FROM Customers 
GROUP BY Country; 


-- lists the number of customers in each country, sorted high to low 

SELECT COUNT(CustomerID), Country 
FROM Customers 
GROUP BY Country 
ORDER BY Count(CustomerID) DESC; 

-- lists the number of orders sent by each shipper 

SELECT Shippers.ShipperName, Count(Order.OrderID) AS NumberOfOrders FROM 
Orders 
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID 
GROUP BY ShipperName; 


```



# SQL HAVING CLAUSE 



The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions. 



```sql
-- Lists the number of customers in each country. Only include countries with more than 5
-- 5 customers. 

SELECT COUNT(CustomerID), Country 
FROM Customers 
GROUP BY Country 
HAVING COUNT(CustomerID) > 5; 


-- Lists the number of customers in each country, 
-- sorted high to low 

SELECT COUNT(CustomerID), Country 
FROM Customers 
GROUP BY Country 
HAVING COUNT(CustomerID) > 5 
ORDER BY COUNT(CustomerID) DESC; 


```





# SQL EXISTS OPERATOR 



The EXISTS Operator is used to test for the existence of any record in a subquery. 

The EXISTS operator returns true if the subquery returns one or more records. 



```sql
-- returns TRUE and lists the suplliers with a product price less than 20 

SELECT SupplierName 
FROM Suppliers 
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.SupplierID AND Price < 20);


```





# The SQL ANY AND ALL OPERATORS 



