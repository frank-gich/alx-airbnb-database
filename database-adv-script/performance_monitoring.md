# 📈 Database Performance Monitoring and Refinement

## 🎯 Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments to reduce execution time, optimize resource usage, and improve user experience.

---

## 🧪 Step 1: Monitor Query Performance Using `EXPLAIN ANALYZE`

### Query 1: Fetch Booking Details by User and Status

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = 'uuid-user-001'
  AND status = 'confirmed';
