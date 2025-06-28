# Database Normalization for Airbnb Clone

## Objective
To apply normalization principles and ensure the database schema is in **Third Normal Form (3NF)**, avoiding redundancy and ensuring data integrity.

---

## 1NF – First Normal Form

- All tables have atomic (indivisible) values.
- No multi-valued or repeating fields exist.
- ✅ **All tables satisfy 1NF.**

---

## 2NF – Second Normal Form

- All tables use single-column primary keys (UUIDs).
- No partial dependencies are possible.
- ✅ **All tables satisfy 2NF.**

---

## 3NF – Third Normal Form

- All attributes in every table depend only on the primary key.
- No transitive dependencies are present.

### Review of Each Table:

- **User**: All fields depend only on `user_id`. ✅  
- **Property**: All fields depend only on `property_id`. ✅  
- **Booking**: All fields depend on `booking_id`, including `total_price` (which may vary). ✅  
- **Payment**: All fields depend only on `payment_id`. ✅  
- **Review**: All fields depend only on `review_id`. ✅  
- **Message**: All fields depend only on `message_id`. ✅  

---

## Result

📌 The database schema is fully normalized to **Third Normal Form (3NF)**.  
This ensures minimal redundancy, high data integrity, and efficient querying.
