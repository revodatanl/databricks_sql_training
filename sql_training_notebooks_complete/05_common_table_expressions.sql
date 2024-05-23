-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Databricks SQL Training: Common Table Expressions and Subqueries
-- MAGIC
-- MAGIC ## Introduction
-- MAGIC Welcome to the Databricks SQL training! This notebook is designed to help you learn and practice SQL Common Table Expressions (CTEs) and subqueries. By the end of this notebook, you will be able to create and use CTEs and subqueries in your SQL queries.
-- MAGIC
-- MAGIC ## Table of Contents
-- MAGIC 1. [Subqueries](#subqueries)
-- MAGIC 2. [Additional Examples of Subqueries](#additional-examples-of-subqueries)
-- MAGIC 3. [Common Table Expressions (CTEs)](#common-table-expressions)
-- MAGIC 4. [Additional Examples of Common Table Expressions (CTEs)](#additional-examples-of-common-table-expressions)
-- MAGIC 5. [Combined Exercises](#combined-exercises)
-- MAGIC 6. [More Exercises with CTEs and Subqueries](#more-exercises-with-ctes-and-subqueries)
-- MAGIC
-- MAGIC ---
-- MAGIC
-- MAGIC ## 1. Subqueries
-- MAGIC
-- MAGIC A subquery is a query nested inside another query. Subqueries can be used in `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statements, or inside another subquery.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column1, column2, ...
-- MAGIC FROM table_name
-- MAGIC WHERE column1 IN (SELECT column1 FROM table_name WHERE condition);
-- MAGIC

-- COMMAND ----------

SELECT c_name, c_acctbal
FROM samples.tpch.customer
WHERE c_custkey IN (SELECT o_custkey FROM samples.tpch.orders WHERE o_totalprice > 1000);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to select part names where the part key is in a subquery that selects part keys from the `samples.tpch.partsupp` table where the supply cost is greater than 100.
-- MAGIC
-- MAGIC
-- MAGIC

-- COMMAND ----------

SELECT p_name
FROM samples.tpch.part
WHERE p_partkey IN (SELECT ps_partkey FROM samples.tpch.partsupp WHERE ps_supplycost > 100);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 2. Additional Examples of Subqueries
-- MAGIC
-- MAGIC ### Example 1: Finding Parts with Above Average Retail Price
-- MAGIC

-- COMMAND ----------

SELECT p_name, p_retailprice
FROM samples.tpch.part
WHERE p_retailprice > (SELECT AVG(p_retailprice) FROM samples.tpch.part);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Example 2: Finding Customers with Orders Above a Certain Amount
-- MAGIC

-- COMMAND ----------

SELECT c_name, c_acctbal
FROM samples.tpch.customer
WHERE c_custkey IN (SELECT o_custkey FROM samples.tpch.orders WHERE o_totalprice > 5000);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Example 3: Finding Suppliers with a Minimum Supply Cost
-- MAGIC

-- COMMAND ----------

SELECT s_name
FROM samples.tpch.supplier
WHERE s_suppkey IN (SELECT ps_suppkey FROM samples.tpch.partsupp WHERE ps_supplycost = (SELECT MIN(ps_supplycost) FROM samples.tpch.partsupp));

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 3. Common Table Expressions (CTEs)
-- MAGIC
-- MAGIC A Common Table Expression (CTE) is a temporary result set that you can reference within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. CTEs make your queries easier to read and maintain.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC WITH cte_name AS (
-- MAGIC     SELECT column1, column2, ...
-- MAGIC     FROM table_name
-- MAGIC     WHERE condition
-- MAGIC )
-- MAGIC SELECT column1, column2, ...
-- MAGIC FROM cte_name;
-- MAGIC

-- COMMAND ----------

WITH CustomerOrders AS (
    SELECT o_custkey, COUNT(o_orderkey) AS order_count
    FROM samples.tpch.orders
    GROUP BY o_custkey
)
SELECT c.c_name, co.order_count
FROM samples.tpch.customer c
JOIN CustomerOrders co
ON c.c_custkey = co.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to create a CTE that calculates the total price of orders for each customer, then select the customer name and the total price from the CTE.
-- MAGIC
-- MAGIC
-- MAGIC

-- COMMAND ----------


WITH CustomerTotalPrice AS (
    SELECT o_custkey, SUM(o_totalprice) AS total_price
    FROM samples.tpch.orders
    GROUP BY o_custkey
)
SELECT c.c_name, ctp.total_price
FROM samples.tpch.customer c
JOIN CustomerTotalPrice ctp
ON c.c_custkey = ctp.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 4. Additional Examples of Common Table Expressions (CTEs)
-- MAGIC
-- MAGIC ### Example 1: Calculating Average Order Price per Customer
-- MAGIC

-- COMMAND ----------

WITH AvgOrderPrice AS (
    SELECT o_custkey, AVG(o_totalprice) AS avg_price
    FROM samples.tpch.orders
    GROUP BY o_custkey
)
SELECT c.c_name, aop.avg_price
FROM samples.tpch.customer c
JOIN AvgOrderPrice aop
ON c.c_custkey = aop.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Example 2: Calculating Total Quantity Ordered for Each Part
-- MAGIC

-- COMMAND ----------

WITH PartTotalQuantity AS (
    SELECT l_partkey, SUM(l_quantity) AS total_quantity
    FROM samples.tpch.lineitem
    GROUP BY l_partkey
)
SELECT p.p_name, ptq.total_quantity
FROM samples.tpch.part p
JOIN PartTotalQuantity ptq
ON p.p_partkey = ptq.l_partkey;


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Example 3: Finding Top 5 Customers by Total Spend
-- MAGIC

-- COMMAND ----------

WITH CustomerSpend AS (
    SELECT o_custkey, SUM(o_totalprice) AS total_spent
    FROM samples.tpch.orders
    GROUP BY o_custkey
)
SELECT c.c_name, cs.total_spent
FROM samples.tpch.customer c
JOIN CustomerSpend cs
ON c.c_custkey = cs.o_custkey
ORDER BY cs.total_spent DESC
LIMIT 5;

