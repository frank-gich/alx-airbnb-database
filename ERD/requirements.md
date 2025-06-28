# Entity-Relationship Diagram Requirements

## Objective

The objective of this task is to design an Entity-Relationship (ER) diagram based on the database specification for the Airbnb clone project. The diagram visually represents the key entities, their attributes, and the relationships between them, ensuring clarity and alignment with the overall data model.

---

## Entities and Attributes

### 1. User
- `user_id` (Primary Key, UUID)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 2. Property
- `property_id` (Primary Key, UUID)
- `host_id` (Foreign Key → User.user_id)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### 3. Booking
- `booking_id` (Primary Key, UUID)
- `property_id` (Foreign Key → Property.property_id)
- `user_id` (Foreign Key → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 4. Payment
- `payment_id` (Primary Key, UUID)
- `booking_id` (Foreign Key → Booking.booking_id)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)

### 5. Review
- `review_id` (Primary Key, UUID)
- `property_id` (Foreign Key → Property.property_id)
- `user_id` (Foreign Key → User.user_id)
- `rating` (INTEGER, NOT NULL, CHECK rating >= 1 AND rating <= 5)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 6. Message
- `message_id` (Primary Key, UUID)
- `sender_id` (Foreign Key → User.user_id)
- `recipient_id` (Foreign Key → User.user_id)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Relationships

- A **User** (host) can have many **Properties**
- A **User** (guest) can have many **Bookings**
- A **Property** can have many **Bookings**
- A **Booking** has one **Payment**
- A **User** can write many **Reviews**
- A **Property** can receive many **Reviews**
- A **User** can send and receive many **Messages**

---

## Diagram

The ER diagram is created using  ERD tool. It includes:
- Entities as rectangles
- Primary and foreign keys labeled
- Relationships clearly mapped with cardinality (1:1, 1:N, N:M as appropriate)

---

## Notes

- All primary keys are UUIDs and indexed
- Foreign keys are properly set for referential integrity
- ENUMs are used for controlled attribute values (e.g., `status`, `role`, `payment_method`)
