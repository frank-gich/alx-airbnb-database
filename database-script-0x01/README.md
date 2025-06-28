# AirBnB Database Schema

## Overview
This repository contains the database schema design for an AirBnB-like platform. The schema supports core functionalities including user management, property listings, bookings, payments, reviews, and messaging.

## Database Structure

### Tables Overview
The database consists of 6 main entities:

1. **User** - Stores user account information
2. **Property** - Contains property listings and details
3. **Booking** - Manages reservation data
4. **Payment** - Handles payment transactions
5. **Review** - Stores property reviews and ratings
6. **Message** - Facilitates user communication

### Entity Relationships

```
User (1) ←→ (M) Property (host relationship)
User (1) ←→ (M) Booking (guest relationship)
User (1) ←→ (M) Review (reviewer relationship)
User (1) ←→ (M) Message (sender/recipient relationship)

Property (1) ←→ (M) Booking
Property (1) ←→ (M) Review

Booking (1) ←→ (1) Payment
```

## Table Specifications

### User Table
- **Primary Key**: `user_id` (UUID)
- **Unique Constraints**: `email`
- **Roles**: guest, host, admin
- **Key Indexes**: email, role, created_at

### Property Table
- **Primary Key**: `property_id` (UUID)
- **Foreign Keys**: `host_id` → User(user_id)
- **Key Indexes**: host_id, location, price_per_night

### Booking Table
- **Primary Key**: `booking_id` (UUID)
- **Foreign Keys**: 
  - `property_id` → Property(property_id)
  - `user_id` → User(user_id)
- **Status Values**: pending, confirmed, canceled
- **Key Indexes**: property_id, user_id, status, date ranges

### Payment Table
- **Primary Key**: `payment_id` (UUID)
- **Foreign Keys**: `booking_id` → Booking(booking_id)
- **Payment Methods**: credit_card, paypal, stripe
- **Key Indexes**: booking_id, payment_date, payment_method

### Review Table
- **Primary Key**: `review_id` (UUID)
- **Foreign Keys**: 
  - `property_id` → Property(property_id)
  - `user_id` → User(user_id)
- **Rating Range**: 1-5 (integer)
- **Unique Constraint**: One review per user per property
- **Key Indexes**: property_id, user_id, rating

### Message Table
- **Primary Key**: `message_id` (UUID)
- **Foreign Keys**: 
  - `sender_id` → User(user_id)
  - `recipient_id` → User(user_id)
- **Key Indexes**: sender_id, recipient_id, sent_at

## Key Features

### Data Integrity
- **Foreign Key Constraints**: Ensure referential integrity across all relationships
- **Check Constraints**: Validate data ranges (ratings 1-5, positive prices, valid date ranges)
- **Unique Constraints**: Prevent duplicate emails and multiple reviews per user-property pair

### Performance Optimization
- **Primary Keys**: All tables use indexed UUID primary keys
- **Strategic Indexing**: Indexes on frequently queried columns
- **Composite Indexes**: Multi-column indexes for common query patterns

### Security Considerations
- **Password Storage**: Uses `password_hash` field (never store plain text passwords)
- **Cascade Operations**: Proper CASCADE settings for data consistency

## Installation Instructions

### Prerequisites
- MySQL 8.0+ or PostgreSQL 12+
- Database administration privileges

### Setup Steps

1. **Clone Repository**
   ```bash
   git clone https://github.com/your-username/alx-airbnb-database.git
   cd alx-airbnb-database/database-script-0x01
   ```

2. **Create Database**
   ```sql
   CREATE DATABASE airbnb_db;
   USE airbnb_db;
   ```

3. **Execute Schema**
   ```bash
   mysql -u username -p airbnb_db < schema.sql
   ```
   
   Or for PostgreSQL:
   ```bash
   psql -U username -d airbnb_db -f schema.sql
   ```

### Database System Notes

#### MySQL Specific
- Uses `CHAR(36)` for UUID storage
- Supports `ENUM` types natively
- Uses `ON UPDATE CURRENT_TIMESTAMP` for auto-updating timestamps

#### PostgreSQL Specific
- Uncomment the UUID extension line for UUID generation
- Consider using `UUID` type instead of `CHAR(36)`
- May need to adjust ENUM syntax to use custom types

## Usage Examples

### Common Queries

```sql
-- Find available properties in a location
SELECT * FROM Property 
WHERE location LIKE '%New York%' 
AND property_id NOT IN (
    SELECT property_id FROM Booking 
    WHERE status = 'confirmed' 
    AND start_date <= '2025-07-01' 
    AND end_date >= '2025-06-29'
);

-- Get user's booking history
SELECT b.*, p.name as property_name 
FROM Booking b 
JOIN Property p ON b.property_id = p.property_id 
WHERE b.user_id = 'user-uuid-here' 
ORDER BY b.created_at DESC;

-- Calculate average rating for a property
SELECT AVG(rating) as avg_rating, COUNT(*) as review_count 
FROM Review 
WHERE property_id = 'property-uuid-here';
```

## Maintenance

### Regular Tasks
- Monitor index performance and usage
- Archive old bookings and messages periodically
- Update statistics for query optimization
- Backup database regularly

### Scaling Considerations
- Consider partitioning for large tables (Booking, Message)
- Implement read replicas for reporting queries
- Cache frequently accessed data (property searches, user profiles)

## Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License
This project is part of the ALX Software Engineering program.

---

**Repository**: `alx-airbnb-database`  
**Directory**: `database-script-0x01`  
**Files**: `schema.sql`, `README.md`