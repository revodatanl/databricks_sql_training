-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Databricks SQL Training: Group By, Order By, Having, and Qualify
-- MAGIC
-- MAGIC ## Introduction
-- MAGIC Welcome to the Databricks SQL training! This notebook is designed to help you learn and practice SQL functions such as GROUP BY, ORDER BY, HAVING, and QUALIFY. By the end of this notebook, you will be able to group, order, filter groups, and qualify your SQL queries.
-- MAGIC
-- MAGIC ## Table of Contents
-- MAGIC 1. [GROUP BY](#group-by)
-- MAGIC 2. [ORDER BY](#order-by)
-- MAGIC 3. [HAVING](#having)
-- MAGIC 4. [QUALIFY](#qualify)
-- MAGIC 5. [Combined Exercises](#combined-exercises)
-- MAGIC
-- MAGIC ---
-- MAGIC
-- MAGIC ## 1. GROUP BY
-- MAGIC
-- MAGIC The `GROUP BY` statement groups rows that have the same values into summary rows, like "find the number of customers in each country."
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column_name(s), aggregate_function(column_name)
-- MAGIC FROM table_name
-- MAGIC WHERE condition
-- MAGIC GROUP BY column_name(s);
-- MAGIC

-- COMMAND ----------

SELECT c_nationkey, COUNT(c_custkey) AS customer_count
FROM samples.tpch.customer
GROUP BY c_nationkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to count the number of orders for each customer in the `samples.tpch.orders` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 2. ORDER BY
-- MAGIC
-- MAGIC The `ORDER BY` statement is used to sort the result set in ascending or descending order.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column_name(s)
-- MAGIC FROM table_name
-- MAGIC ORDER BY column_name(s) ASC|DESC;
-- MAGIC

-- COMMAND ----------

SELECT c_name, c_acctbal
FROM samples.tpch.customer
ORDER BY c_acctbal DESC;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to list all parts from the `samples.tpch.part` table ordered by their retail price in descending order.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 3. HAVING
-- MAGIC
-- MAGIC The `HAVING` clause was added to SQL because the `WHERE` keyword could not be used with aggregate functions.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column_name(s), aggregate_function(column_name)
-- MAGIC FROM table_name
-- MAGIC WHERE condition
-- MAGIC GROUP BY column_name(s)
-- MAGIC HAVING condition;
-- MAGIC

-- COMMAND ----------

SELECT c_nationkey, COUNT(c_custkey) AS customer_count
FROM samples.tpch.customer
GROUP BY c_nationkey
HAVING COUNT(c_custkey) < 30000;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to count the number of orders for each customer and only include customers with more than 5 orders in the `samples.tpch.orders` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 4. QUALIFY
-- MAGIC
-- MAGIC The `QUALIFY` clause filters the result of a window function. It is not a standard SQL clause and might not be available in all SQL dialects.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column_name(s), window_function() OVER (window_spec)
-- MAGIC FROM table_name
-- MAGIC QUALIFY window_function() OVER (window_spec) condition;
-- MAGIC

-- COMMAND ----------

SELECT c_name, c_acctbal, ROW_NUMBER() OVER (ORDER BY c_acctbal DESC) AS row_num
FROM samples.tpch.customer
QUALIFY row_num <= 5;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to rank customers by their account balance and only include the top 10 customers in the `samples.tpch.customer` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 5. Combined Exercises
-- MAGIC
-- MAGIC ### Exercise 1
-- MAGIC
-- MAGIC Write a query to:
-- MAGIC - Count the number of orders for each customer
-- MAGIC - Calculate the total price of orders for each customer
-- MAGIC - Only include customers with more than 5 orders
-- MAGIC - Order the result by the total price in descending order

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ###Exercise 2
-- MAGIC Write a query to:
-- MAGIC
-- MAGIC - Find the average quantity ordered for each part
-- MAGIC - Include only parts with an average quantity greater than 30
-- MAGIC - Order the result by the average quantity in descending order

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ###Exercise 3
-- MAGIC Write a query to:
-- MAGIC
-- MAGIC - Rank the orders by their total price for each customer
-- MAGIC - Include only the top 3 orders per customer
-- MAGIC - Order the result by customer key and ranking

-- COMMAND ----------



-- COMMAND ----------


