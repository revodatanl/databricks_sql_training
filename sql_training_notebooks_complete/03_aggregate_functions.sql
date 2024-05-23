-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Databricks SQL Training: Aggregate Functions
-- MAGIC
-- MAGIC ## Introduction
-- MAGIC Welcome to the Databricks SQL training! This notebook is designed to help you learn and practice SQL aggregate functions. By the end of this notebook, you will be able to use `COUNT`, `DISTINCT COUNT`, `SUM`, `AVG`, `MAX`, `MIN`, and `WHERE` clauses in your SQL queries.
-- MAGIC
-- MAGIC ## Table of Contents
-- MAGIC 1. [Aliasing](#aliasing)
-- MAGIC 2. [COUNT](#count)
-- MAGIC 3. [DISTINCT COUNT](#distinct-count)
-- MAGIC 4. [SUM](#sum)
-- MAGIC 5. [AVG](#avg)
-- MAGIC 6. [MAX and MIN](#max-and-min)
-- MAGIC 7. [WHERE Clause](#where-clause)
-- MAGIC 8. [Combined Exercise](#combined-exercise)
-- MAGIC
-- MAGIC ---
-- MAGIC
-- MAGIC ## 1. Aliasing
-- MAGIC
-- MAGIC Aliasing is a way to give a table or a column in a table a temporary name. This can make your SQL queries more readable and concise.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column_name AS alias_name
-- MAGIC FROM table_name;
-- MAGIC
-- MAGIC SELECT column_name alias_name
-- MAGIC FROM table_name;
-- MAGIC

-- COMMAND ----------

SELECT c_name AS customer_name, c_acctbal AS account_balance
FROM samples.tpch.customer;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to select the `c_name` and `c_phone` from the `samples.tpch.customer` table with aliases `customer_name` and `phone_number`.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 2. COUNT
-- MAGIC
-- MAGIC The `COUNT` function returns the number of rows that matches a specified criterion.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT COUNT(column_name)
-- MAGIC FROM table_name;
-- MAGIC

-- COMMAND ----------

SELECT COUNT(c_custkey) AS customer_count
FROM samples.tpch.customer;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to count the number of orders in the `samples.tpch.orders` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 3. DISTINCT COUNT
-- MAGIC
-- MAGIC The `COUNT(DISTINCT column_name)` function returns the number of distinct values in a column.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT COUNT(DISTINCT column_name)
-- MAGIC FROM table_name;
-- MAGIC

-- COMMAND ----------

SELECT COUNT(DISTINCT c_nationkey) AS distinct_nations
FROM samples.tpch.customer;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to count the number of distinct part keys in the `samples.tpch.partsupp` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 4. SUM
-- MAGIC
-- MAGIC The `SUM` function returns the total sum of a numeric column.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT SUM(column_name)
-- MAGIC FROM table_name;
-- MAGIC

-- COMMAND ----------

SELECT SUM(o_totalprice) AS total_revenue
FROM samples.tpch.orders;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to find the total quantity ordered in the `samples.tpch.lineitem` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 5. AVG
-- MAGIC
-- MAGIC The `AVG` function returns the average value of a numeric column.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT AVG(column_name)
-- MAGIC FROM table_name;
-- MAGIC

-- COMMAND ----------

SELECT AVG(c_acctbal) AS average_balance
FROM samples.tpch.customer;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to find the average discount in the `samples.tpch.lineitem` table.
-- MAGIC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6. MAX and MIN
-- MAGIC
-- MAGIC The `MAX` function returns the maximum value in a column. The `MIN` function returns the minimum value in a column.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT MAX(column_name)
-- MAGIC FROM table_name;
-- MAGIC
-- MAGIC SELECT MIN(column_name)
-- MAGIC FROM table_name;
-- MAGIC
-- MAGIC

-- COMMAND ----------

SELECT MAX(o_totalprice) AS highest_order_price
FROM samples.tpch.orders;

-- COMMAND ----------


SELECT MIN(o_totalprice) AS lowest_order_price
FROM samples.tpch.orders;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to find the highest and lowest retail prices in the `samples.tpch.part` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 7. WHERE Clause
-- MAGIC
-- MAGIC The `WHERE` clause is used to filter records. It is used to extract only those records that fulfill a specified condition.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column1, column2, ...
-- MAGIC FROM table_name
-- MAGIC WHERE condition;
-- MAGIC

-- COMMAND ----------

SELECT c_name, c_acctbal
FROM samples.tpch.customer
WHERE c_acctbal > 1000;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to find the total price of orders where the total price is greater than 1000 in the `samples.tpch.orders` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 8. Combined Exercise
-- MAGIC
-- MAGIC ### Exercise 1
-- MAGIC
-- MAGIC Write a query to:
-- MAGIC - Count the number of customers
-- MAGIC - Count the number of distinct nations they belong to
-- MAGIC - Find the sum of all account balances
-- MAGIC - Calculate the average account balance
-- MAGIC - Find the highest and lowest account balances
-- MAGIC
-- MAGIC Use customer table
-- MAGIC

-- COMMAND ----------

SELECT 
    COUNT(c_custkey) AS customer_count,
    COUNT(DISTINCT c_nationkey) AS distinct_nations,
    SUM(c_acctbal) AS total_balance,
    AVG(c_acctbal) AS average_balance,
    MAX(c_acctbal) AS highest_balance,
    MIN(c_acctbal) AS lowest_balance
FROM 
    samples.tpch.customer

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise 2
-- MAGIC
-- MAGIC Write a query to:
-- MAGIC - Count the number of customers
-- MAGIC - Count the number of distinct nations they belong to
-- MAGIC - Find the sum of all account balances
-- MAGIC - Calculate the average account balance
-- MAGIC - Find the highest and lowest account balances
-- MAGIC - Filter for customers where the account balance is greater than 1000
-- MAGIC
-- MAGIC Use customer table

-- COMMAND ----------

SELECT 
    COUNT(c_custkey) AS customer_count,
    COUNT(DISTINCT c_nationkey) AS distinct_nations,
    SUM(c_acctbal) AS total_balance,
    AVG(c_acctbal) AS average_balance,
    MAX(c_acctbal) AS highest_balance,
    MIN(c_acctbal) AS lowest_balance
FROM 
    samples.tpch.customer
WHERE 
    c_acctbal > 1000;
