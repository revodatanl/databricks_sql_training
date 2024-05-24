-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Databricks SQL Training: Joining Data from Two Tables
-- MAGIC
-- MAGIC ## Introduction
-- MAGIC Welcome to the Databricks SQL training! This notebook is designed to help you learn and practice SQL joins. By the end of this notebook, you will be able to perform inner joins, left joins, right joins, full outer joins, and use joins with additional filtering.
-- MAGIC
-- MAGIC ## Table of Contents
-- MAGIC 1. [INNER JOIN](#inner-join)
-- MAGIC 2. [LEFT JOIN](#left-join)
-- MAGIC 3. [RIGHT JOIN](#right-join)
-- MAGIC 4. [FULL OUTER JOIN](#full-outer-join)
-- MAGIC 5. [JOIN with Additional Filtering](#join-with-additional-filtering)
-- MAGIC
-- MAGIC ---
-- MAGIC
-- MAGIC ## 1. INNER JOIN
-- MAGIC
-- MAGIC An `INNER JOIN` returns records that have matching values in both tables.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC ```sql
-- MAGIC SELECT columns
-- MAGIC FROM table1
-- MAGIC INNER JOIN table2
-- MAGIC ON table1.column = table2.column;
-- MAGIC ```

-- COMMAND ----------

SELECT c.c_name, o.o_orderdate, o.o_totalprice
FROM samples.tpch.customer c
INNER JOIN samples.tpch.orders o
ON c.c_custkey = o.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to select customer names and the names of the nations they belong to using an inner join on `samples.tpch.customer` and `samples.tpch.nation`.
-- MAGIC

-- COMMAND ----------

SELECT c.c_name AS customer_name, n.n_name AS nation_name
FROM samples.tpch.customer c
INNER JOIN samples.tpch.nation n ON c.c_nationkey = n.n_nationkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 2. LEFT JOIN
-- MAGIC
-- MAGIC A `LEFT JOIN` returns all records from the left table (table1), and the matched records from the right table (table2). The result is `NULL` from the right side, if there is no match.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT columns
-- MAGIC FROM table1
-- MAGIC LEFT JOIN table2
-- MAGIC ON table1.column = table2.column;
-- MAGIC

-- COMMAND ----------

SELECT c.c_name, o.o_orderdate, o.o_totalprice
FROM samples.tpch.customer c
LEFT JOIN samples.tpch.orders o
ON c.c_custkey = o.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to select all customers and their respective orders using a left join on `samples.tpch.customer` and `samples.tpch.orders`.
-- MAGIC

-- COMMAND ----------

SELECT c.*, o.*
FROM samples.tpch.customer c
LEFT JOIN samples.tpch.orders o ON c.c_custkey = o.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 3. RIGHT JOIN
-- MAGIC
-- MAGIC A `RIGHT JOIN` returns all records from the right table (table2), and the matched records from the left table (table1). The result is `NULL` from the left side, when there is no match.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT columns
-- MAGIC FROM table1
-- MAGIC RIGHT JOIN table2
-- MAGIC ON table1.column = table2.column;
-- MAGIC

-- COMMAND ----------

SELECT c.c_name, o.o_orderdate, o.o_totalprice
FROM samples.tpch.customer c
RIGHT JOIN samples.tpch.orders o
ON c.c_custkey = o.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to select all orders and their respective customers using a right join on `samples.tpch.orders` and `samples.tpch.customer`.
-- MAGIC

-- COMMAND ----------

SELECT o.*, c.*
FROM samples.tpch.orders o
RIGHT JOIN samples.tpch.customer c ON o.o_custkey = c.c_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 4. FULL OUTER JOIN
-- MAGIC
-- MAGIC A `FULL OUTER JOIN` returns all records when there is a match in either left (table1) or right (table2) table records.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT columns
-- MAGIC FROM table1
-- MAGIC FULL OUTER JOIN table2
-- MAGIC ON table1.column = table2.column;
-- MAGIC

-- COMMAND ----------

SELECT c.c_name, o.o_orderdate, o.o_totalprice
FROM samples.tpch.customer c
FULL OUTER JOIN samples.tpch.orders o
ON c.c_custkey = o.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC Write a query to select all customers and all orders, regardless of whether they have corresponding entries in the other table, using a full outer join on `samples.tpch.customer` and `samples.tpch.orders`.
-- MAGIC

-- COMMAND ----------

SELECT c.*, o.*
FROM samples.tpch.customer c
FULL OUTER JOIN samples.tpch.orders o ON c.c_custkey = o.o_custkey;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 5. JOIN with Additional Filtering
-- MAGIC
-- MAGIC You can also apply additional filtering conditions when using joins.
-- MAGIC
-- MAGIC

-- COMMAND ----------

SELECT c.c_name, o.o_orderdate, o.o_totalprice
FROM samples.tpch.customer c
INNER JOIN samples.tpch.orders o
ON c.c_custkey = o.o_custkey
WHERE o.o_totalprice > 320000;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC 1. Write a query to select customer names and their orders where the order total price is smaller than 1000 using an inner join on `samples.tpch.customer` and `samples.tpch.orders`.
-- MAGIC
-- MAGIC 2. Write a query to select part names and the names of the suppliers who supply them where the supply cost is less than 100 using an inner join on `samples.tpch.part` and `samples.tpch.partsupp`.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------


