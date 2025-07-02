-- ============================================
-- Initial Unoptimized Query
-- ============================================
-- Retrieves all bookings with full user, property, and payment details

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM 
    Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;

-- ============================================
-- Refactored Query for Optimization
-- ============================================
-- Optimized to reduce unnecessary joins and data retrieval

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.user_id,
    b.property_id,
    pay.amount,
    pay.payment_method
FROM 
    Booking b
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed' AND b.start_date >= '2024-01-01';

-- ============================================
-- Query Plan Using EXPLAIN
-- ============================================
-- Analyzing the execution plan without actual execution

EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed' AND b.start_date >= '2024-01-01';

-- ============================================
-- Query Plan Using EXPLAIN ANALYZE
-- ============================================
-- Measures and displays actual execution time and row scan

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed' AND b.start_date >= '2024-01-01';
