-- ================================================
-- airbnb_joins.sql
-- SQL JOIN Queries for AirBnB Database
-- ================================================
-- Author: Your Name
-- Date: 2025-07-02
-- Description: INNER JOIN, LEFT JOIN, FULL OUTER JOIN examples
-- ================================================

-- ================================================
-- 1. INNER JOIN: Bookings and their Users
-- ================================================
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;

-- ================================================
-- 2. LEFT JOIN: Properties and their Reviews
-- (Include properties with no reviews)
-- ================================================
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_created_at
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id;

-- ================================================
-- 3. FULL OUTER JOIN: All Users and All Bookings
-- (Include users without bookings and bookings
--  without valid users)
-- ================================================
-- Note: FULL OUTER JOIN is supported in PostgreSQL
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM 
    User u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;

-- ================================================
-- END OF FILE
-- ================================================
