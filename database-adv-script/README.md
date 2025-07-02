# 📊 SQL Practice on AirBnB Database

This project contains four SQL exercises based on a simplified **AirBnB-style relational database schema**. Each task is designed to help you practice essential SQL concepts used in real-world data analysis and backend development.

---

## 📘 Project Summary

This repository includes SQL scripts covering:

| Task | Focus Area          | Description |
|------|---------------------|-------------|
| 1️⃣   | **Joins**            | Use `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` to combine data across `User`, `Booking`, `Property`, and `Review` tables. |
| 2️⃣   | **Subqueries**       | Write both **non-correlated** and **correlated** subqueries to filter and analyze user and property data. |
| 3️⃣   | **Aggregation**      | Use `COUNT()` and `GROUP BY` to calculate totals, such as the number of bookings per user. |
| 4️⃣   | **Window Functions** | Use `RANK()` or `ROW_NUMBER()` to rank properties based on popularity (total number of bookings). |

---

## 🎯 Learning Objectives

- 🔗 Practice different types of SQL joins
- 🔍 Master subqueries (correlated and non-correlated)
- 📈 Aggregate and summarize data
- 🏅 Apply window functions to rank and analyze trends

---

## 📁 Files Included

| File Name              | Purpose                                  |
|------------------------|------------------------------------------|
| `joins_queries.sql`     | JOIN queries across key AirBnB tables    |
| `partitioning.sql`| Subqueries for filtering and conditions  |
| `aggregations_and_window_functions.sql` | Aggregation and ranking using functions  |
| `airbnb_schema.sql`    | Full database schema (DDL)               |

---

## 🛠 How to Run

1. Set up a PostgreSQL database.
2. Run `airbnb_schema.sql` to create tables.
3. Load sample data if available (optional).
4. Execute each SQL script:

```bash
psql -U your_username -d your_database -f joins_queries.sql
psql -U your_username -d your_database -f partitioning.sql
psql -U your_username -d your_database -f aggregations_and_window_functions.sql
