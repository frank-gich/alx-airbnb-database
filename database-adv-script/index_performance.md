
# 🚀 Index Performance Report – AirBnB Database

## 📌 Objective

To **identify and create indexes** that optimize query performance on high-usage columns in the `User`, `Booking`, and `Property` tables.

---

## 🧠 Strategy

Indexes were created on columns that frequently appear in:

- `WHERE` conditions
- `JOIN` operations
- `ORDER BY` clauses

These are typically queried often and benefit most from indexing.

---

## 🔍 Indexed Columns

| Table     | Column(s)                | Reason for Indexing                       |
|-----------|--------------------------|-------------------------------------------|
| `User`    | `email`, `role`          | Frequently queried in login/auth filters |
| `Booking` | `user_id`, `property_id`, `status`, `start_date`, `created_at` | Used in JOINs, filtering, and sorting    |
| `Property`| `host_id`, `location`, `price_per_night` | Used in filters, range queries            |

---

## 🛠 Index Creation Script (in `database_index.sql`)

```sql
-- User Table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property Table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);
