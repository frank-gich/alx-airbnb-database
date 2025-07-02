-- ========================
-- Initial Unoptimized Query
-- ========================
-- Retrieves all bookings with user, property, and payment details
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

-- ==================================
-- Refactored Query for Optimization
-- ==================================
-- Reduces joins and selects only necessary fields
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
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;

-- Optional: Fetch user and property details separately if needed
-- and only for specific filters (to avoid expensive wide joins).
