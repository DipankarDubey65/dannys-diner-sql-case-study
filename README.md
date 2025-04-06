# 🍜 Danny's Diner - SQL Case Study

This repository contains my SQL solutions for the **Danny's Diner case study**, part of the [8-Week SQL Challenge](https://8weeksqlchallenge.com/case-study-1/).

## 📘 Case Study Overview

Danny wants to use data to help him understand his customers’ visiting patterns, how much money they’ve spent, and also which menu items are their favorites. Using three key datasets — `sales`, `menu`, and `members` — we answer 10 real-world business questions using SQL.

## 🧠 Concepts Used

- SQL Joins (INNER JOIN)
- Aggregation Functions (`SUM`, `COUNT`)
- `GROUP BY`, `ORDER BY`
- Window Functions (`ROW_NUMBER`, `RANK`)
- CTEs (Common Table Expressions)
- Conditional Logic with `CASE`
- Date comparisons and filters

## 📊 Data Tables

- **`sales`**: customer_id, order_date, product_id  
- **`menu`**: product_id, product_name, price  
- **`members`**: customer_id, join_date  

## ✅ Questions Solved

1. What is the total amount each customer spent at the restaurant?  
2. How many days has each customer visited the restaurant?  
3. What was the first item from the menu purchased by each customer?  
4. What is the most purchased item on the menu and how many times was it purchased by all customers?  
5. Which item was the most popular for each customer?  
6. Which item was purchased first by the customer after they became a member?  
7. Which item was purchased just before the customer became a member?  
8. What is the total items and amount spent for each member before they became a member?  
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?  
10. In the first week after a customer joins the program, they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

## 📂 Files in this Repository

- `dannys_diner_case_study.sql` – Contains all SQL queries and solutions.
- `README.md` – This file.

## 🧩 Dataset Source

This case study is from [Danny Ma's 8-Week SQL Challenge](https://8weeksqlchallenge.com/), an open-source learning platform for practicing SQL using real business problems.

---

## 🚀 How to Use

You can run the queries in any SQL environment (e.g., MySQL, PostgreSQL, SQLite). Make sure the 3 tables (`sales`, `menu`, `members`) are created with correct data before executing queries.

---

## ✨ Learnings

Through this case study, I improved my understanding of:

- Business logic implementation using SQL
- Using `CASE` statements for custom rules
- Ranking techniques with `ROW_NUMBER`
- Structuring SQL projects professionally

---

## 📧 Contact

Feel free to reach out if you have feedback or questions!


