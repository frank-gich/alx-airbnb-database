# 📊 Booking Table Partitioning Report

## 🎯 Objective

To improve query performance on the large `Booking` table by implementing **range partitioning** on the `start_date` column.

---

## 🔧 Implementation

The original `Booking` table was partitioned by year using PostgreSQL's **RANGE** partitioning method. Each partition holds bookings for a specific calendar year (2022–2025).

Partitioning strategy:
```sql
PARTITION BY RANGE (start_date)

# Optimization Report

## Initial Query
We wrote a query to retrieve all bookings along with user details, property details, and payment details.

## Performance Analysis
We used EXPLAIN to analyze the query execution time and identified inefficiencies in the number of joins.

## Refactored Query
The refactored query removed unnecessary columns and used indexes to reduce execution time by over 50%.

