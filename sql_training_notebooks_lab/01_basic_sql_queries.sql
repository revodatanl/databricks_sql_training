-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Databricks SQL Training: Basic SQL Queries
-- MAGIC
-- MAGIC ## Introduction
-- MAGIC Welcome to the Databricks SQL training! This notebook is designed to help you learn and practice the basics of SQL queries. By the end of this notebook, you will be able to perform basic SQL operations such as selecting data, filtering data, inserting new records, updating existing records, and deleting records.
-- MAGIC
-- MAGIC ## Table of Contents
-- MAGIC 1. [View Data](#view-data)
-- MAGIC 2. [SELECT FROM](#select-from)
-- MAGIC 3. [WHERE Clause](#where-clause)
-- MAGIC 4. [INSERT INTO](#insert-into)
-- MAGIC 5. [UPDATE](#update)
-- MAGIC 6. [DELETE FROM](#delete-from)
-- MAGIC
-- MAGIC ---
-- MAGIC
-- MAGIC ## 1. View Data
-- MAGIC
-- MAGIC Before we begin with the SQL queries, let's take a look at the first 10 observations from each of the tables.
-- MAGIC
-- MAGIC ### View Data from `samples.tpch.customer`
-- MAGIC

-- COMMAND ----------

SELECT * 
FROM samples.tpch.customer
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### View Data from `samples.tpch.lineitem`

-- COMMAND ----------

SELECT * 
FROM samples.tpch.lineitem
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### View Data from `samples.tpch.nation`

-- COMMAND ----------

SELECT * 
FROM samples.tpch.nation
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### View Data from `samples.tpch.orders`

-- COMMAND ----------

SELECT * 
FROM samples.tpch.orders
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### View Data from `samples.tpch.part`

-- COMMAND ----------

SELECT * 
FROM samples.tpch.part
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### View Data from `samples.tpch.partsup`

-- COMMAND ----------

SELECT * 
FROM samples.tpch.partsupp
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 2. SELECT FROM
-- MAGIC
-- MAGIC The `SELECT` statement is used to fetch data from a database. The data returned is stored in a result table, sometimes called the result set.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column1, column2, ...
-- MAGIC FROM table_name;
-- MAGIC ```

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC 1. Write a query to select all columns from the `samples.tpch.customer` table.
-- MAGIC
-- MAGIC 2. Write a query to select the `l_quantity` and `l_extendedprice` from the `samples.tpch.lineitem` table.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 3. WHERE Clause
-- MAGIC
-- MAGIC The WHERE clause is used to filter records. It is used to extract only those records that fulfill a specified condition.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC SELECT column1, column2, ...
-- MAGIC FROM table_name
-- MAGIC WHERE condition;
-- MAGIC ```

-- COMMAND ----------

SELECT c_name, c_address, c_nationkey
FROM samples.tpch.customer
WHERE c_nationkey = 1;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC 1. Write a query to select all columns from the `samples.tpch.orders` table where the `o_orderdate` is `'1995-10-11'`.
-- MAGIC
-- MAGIC 2. Write a query to select the `p_name` and `p_retailprice` from the `samples.tpch.part` table where the `p_size` is greater than 20.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------



-- COMMAND ----------

-- MAGIC
-- MAGIC %md
-- MAGIC ## 4. INSERT INTO
-- MAGIC
-- MAGIC The INSERT INTO statement is used to add new records to a table.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC INSERT INTO table_name (column1, column2, column3, ...)
-- MAGIC VALUES (value1, value2, value3, ...);;
-- MAGIC ```

-- COMMAND ----------


INSERT INTO samples.tpch.customer (c_name, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment, c_comment)
VALUES ('New Customer', '123 New Address', 1, '123-456-7890', 5000.00, 'AUTOMOBILE', 'New customer comment');

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC 1. Insert a new record into the `samples.tpch.orders` table with appropriate values.
-- MAGIC
-- MAGIC 2. Insert a new part into the `samples.tpch.part` table with the name 'New Part', size 10, and retail price 99.99.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 5. UPDATE
-- MAGIC
-- MAGIC The `UPDATE` statement is used to modify existing records in a table.
-- MAGIC
-- MAGIC ```sql
-- MAGIC UPDATE table_name
-- MAGIC SET column1 = value1, column2 = value2, ...
-- MAGIC WHERE condition;
-- MAGIC ```

-- COMMAND ----------

UPDATE samples.tpch.customer
SET c_acctbal = 6000.00
WHERE c_name = 'New Customer';

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC 1. Update the `o_totalprice` of an order in the `samples.tpch.orders` table where the `o_orderkey` is 1 to 1000.99.
-- MAGIC
-- MAGIC 2. Update the `p_retailprice` of a part in the `samples.tpch.part` table where the `p_name` is 'Old Part' to 79.99.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6. DELETE FROM
-- MAGIC
-- MAGIC The `DELETE` statement is used to delete existing records from a table.
-- MAGIC
-- MAGIC ### Syntax
-- MAGIC
-- MAGIC ```sql
-- MAGIC DELETE FROM table_name
-- MAGIC WHERE condition;
-- MAGIC ```

-- COMMAND ----------

DELETE FROM samples.tpch.customer
WHERE c_name = 'New Customer';

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Exercise
-- MAGIC
-- MAGIC 1. Delete a record from the `samples.tpch.orders` table where the `o_orderkey` is 10.
-- MAGIC
-- MAGIC 2. Delete a part from the `samples.tpch.part` table where the `p_name` is 'Discontinued Part'.
-- MAGIC

-- COMMAND ----------



-- COMMAND ----------


