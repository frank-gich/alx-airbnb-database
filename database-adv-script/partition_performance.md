# 📊 Booking Table Partitioning Report

## 🎯 Objective

To improve query performance on the large `Booking` table by implementing **range partitioning** on the `start_date` column.

---

## 🔧 Implementation

The original `Booking` table was partitioned by year using PostgreSQL's **RANGE** partitioning method. Each partition holds bookings for a specific calendar year (2022–2025).

Partitioning strategy:
```sql
PARTITION BY RANGE (start_date)
