--1 Join Customers, Services, Transactions, and Churn Records

SELECT c.*, s.*, t.monthly_charges, t.total_charges, cr.is_churned 
FROM customers c
JOIN services s ON c.customer_id = s.customer_id
JOIN transactions t ON c.customer_id = t.customer_id
JOIN churn_records cr ON c.customer_id = cr.customer_id
LIMIT 5;

--2. Count total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

--3. Find Duplicate customer records
 SELECT customer_id, COUNT(*) 
FROM customers 
GROUP BY customer_id
HAVING COUNT(*) > 1;

--4. Count Distinct Values in Key Features
 SELECT 
    COUNT(DISTINCT gender),
    COUNT(DISTINCT s.internet_service),
    COUNT(DISTINCT contract),
    COUNT(DISTINCT payment_method),
    COUNT(DISTINCT is_churned)
FROM customers c
JOIN services s ON c.customer_id = s.customer_id
JOIN churn_records cr ON c.customer_id = cr.customer_id;

--5. Customer Tenure Statistics
 SELECT 
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    ROUND(AVG(tenure),3) AS avg_tenure
FROM customers;



--6. Monthly Charges Statistics
 SELECT 
    MIN(monthly_charge) AS min_charges,
    MAX(monthly_charge) AS max_charges,
    ROUND(AVG(monthly_charge),2) AS avg_charges
FROM transactions;


--7. Total Charges Statistics 
SELECT 
    MIN(total_charge) AS min_totalcharges,
    MAX(total_charge) AS max_totalcharges,
    ROUND(AVG(total_charge),2) AS avg_totalcharges
FROM transactions;


--8. Churned Customers Count
 SELECT COUNT(*) AS ChurnedCustomers
FROM churn_records
WHERE is_churned = 1;


--9. Churn Rate Calculation
 SELECT ROUND(
    (COUNT(CASE WHEN cr.is_churned = 1 THEN 1 END) * 100.0 / COUNT(*)), 
    2
) AS ChurnRate
FROM customers c
JOIN churn_records cr ON c.customer_id = cr.customer_id;


--10. Churn by Gender
 SELECT 
    c.gender, 
    cr.is_churned, 
    COUNT(*)
FROM customers c
JOIN churn_records cr ON c.customer_id = cr.customer_id
GROUP BY c.gender, cr.is_churned;


--11. Churn by Contract Type
 SELECT 
    c.contract, 
    cr.is_churned, 
    COUNT(*)
FROM customers c
JOIN churn_records cr ON c.customer_id = cr.customer_id
GROUP BY c.contract, cr.is_churned;


--12. Churn by Payment Method
 SELECT 
    c.payment_method, 
    cr.is_churned, 
    COUNT(*)
FROM customers c
JOIN churn_records cr ON c.customer_id = cr.customer_id
GROUP BY c.payment_method, cr.is_churned;



--13. Churn by Tenure Group 
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-1 year'
        WHEN tenure <= 24 THEN '1-2 years'
        WHEN tenure <= 48 THEN '2-4 years'
        ELSE '4+ years'
    END AS TenureGroup, 
    cr.is_churned, 
    COUNT(*)
FROM customers c
JOIN churn_records cr ON c.customer_id = cr.customer_id
GROUP BY TenureGroup, cr.is_churned;


--14. Churn by Internet Service Type
 SELECT 
    s.internet_service, 
    cr.is_churned, 
    COUNT(*)
FROM customers c
JOIN services s ON c.customer_id = s.customer_id
JOIN churn_records cr ON c.customer_id = cr.customer_id
GROUP BY s.internet_service, cr.is_churned;


--15. Churn rate by Monthly Charges bracket
SELECT CASE
WHEN t.monthly_charge < 30 THEN '< $30'
WHEN t.monthly_charge < 60 THEN '$30 - $60'
WHEN t.monthly_charge < 90 THEN '$60 - $90'
ELSE '> $90' END AS ChargeBracket,
cr.is_churned,
COUNT(*) AS count
FROM transactions t
JOIN churn_records cr ON t.customer_id = cr.customer_id
GROUP BY ChargeBracket, cr.is_churned;


--16. Churn rate by Total Charges bracket
SELECT CASE 
    WHEN t.total_charge < 500 THEN '< $500'
    WHEN t.total_charge < 2000 THEN '$500 - $2000'
    WHEN t.total_charge < 5000 THEN '$2000 - $5000'
    ELSE '>= $5000'
  END AS TotalBracket,
  cr.is_churned,
  COUNT(*) AS count
FROM transactions t
JOIN churn_records cr ON t.customer_id = cr.customer_id
GROUP BY TotalBracket, cr.is_churned;


--17. Churn rate by Contract + Tenure
SELECT 
  c.contract,
  CASE 
    WHEN tenure <= 12 THEN '0-1 year'
    WHEN tenure <= 24 THEN '1-2 years'
    WHEN tenure <= 48 THEN '2-4 years'
    ELSE '4+ years'
  END AS TenureGroup,
  cr.is_churned,
  COUNT(*) AS count
FROM customers c
JOIN churn_records cr ON c.customer_id = cr.customer_id
GROUP BY c.contract, TenureGroup, cr.is_churned;


--18. Churn By Payment Method + Internet Service

SELECT 
  s.internet_service,
  c.payment_method,
  cr.is_churned,
  COUNT(*) AS count
FROM customers c
JOIN churn_records cr ON c.customer_id = cr.customer_id
JOIN services s ON c.customer_id = s.customer_id
GROUP BY s.internet_service, c.payment_method, cr.is_churned;






