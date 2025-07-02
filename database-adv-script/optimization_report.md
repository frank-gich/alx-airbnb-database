# ⚡ Optimization Report – Booking Query Performance

## 🎯 Objective

Refactor a complex multi-join query to improve execution performance by identifying and reducing inefficiencies.

---

## 🧾 Initial Query Summary

The original query joins four tables:

- `Booking` (main)
- `User` (JOIN)
- `Property` (JOIN)
- `Payment` (LEFT JOIN)

### 🔍 Issues Identified via `EXPLAIN`:

- **Nested Loop Joins** on large datasets.
- Full table scans due to missing indexes on `booking_id`, `user_id`, and `property_id`.
- Unnecessary fields selected from all joined tables.
- High memory and execution cost.

---

## ✅ Optimizations Applied

### 🔧 Step 1: Add Indexes

```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
