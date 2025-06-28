# AirBnB Database Seeding

## Overview
This directory contains SQL scripts to populate the AirBnB database with sample data for development and testing purposes.

## Files
- `seed.sql` - Contains INSERT statements to populate all tables with sample data

## Sample Data Included

### Users (5 records)
- 1 Admin user
- 2 Host users  
- 2 Guest users

### Properties (3 records)
- Cozy Apartment in New York, NY ($120/night)
- Modern Loft in Los Angeles, CA ($180/night)
- Beach House in Miami, FL ($250/night)

### Bookings (3 records)
- 2 Confirmed bookings
- 1 Pending booking

### Payments (2 records)
- Payments for confirmed bookings only
- Mix of credit card and PayPal payment methods

### Reviews (2 records)
- Reviews from guests who completed their stays
- Ratings of 4 and 5 stars

### Messages (3 records)
- Sample communication between guests and hosts

## Usage Instructions

### Prerequisites
- Ensure the database schema is already created (run the schema creation script first)
- Have appropriate database permissions to INSERT data

### Running the Seed Script

1. Connect to your MySQL database
2. Execute the seed script:
   ```sql
   SOURCE seed.sql;
   ```

   Or if using command line:
   ```bash
   mysql -u [username] -p [database_name] < seed.sql
   ```

### Verification
After running the script, verify the data was inserted correctly:

```sql
-- Check record counts
SELECT 'Users' as Table_Name, COUNT(*) as Record_Count FROM User
UNION ALL
SELECT 'Properties', COUNT(*) FROM Property
UNION ALL  
SELECT 'Bookings', COUNT(*) FROM Booking
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payment
UNION ALL
SELECT 'Reviews', COUNT(*) FROM Review
UNION ALL
SELECT 'Messages', COUNT(*) FROM Message;
```

Expected results:
- Users: 5 records
- Properties: 3 records
- Bookings: 3 records
- Payments: 2 records
- Reviews: 2 records
- Messages: 3 records

## Data Relationships
The sample data maintains proper referential integrity:
- All properties belong to valid hosts
- All bookings reference valid properties and users
- All payments are linked to confirmed bookings
- All reviews are from users who made bookings
- All messages are between valid users

## Customization
To modify the sample data:
1. Edit the INSERT statements in `seed.sql`
2. Maintain UUID format for primary keys
3. Ensure foreign key relationships remain valid
4. Update this README if adding new data categories

## Troubleshooting
- If you get foreign key constraint errors, ensure the schema is created first
- UUID values must be unique across the database
- Check that ENUM values match the schema definition (pending/confirmed/canceled for bookings, guest/host/admin for users, etc.)

## Security Note
The password hashes in the sample data are examples only. In production, use proper password hashing mechanisms.