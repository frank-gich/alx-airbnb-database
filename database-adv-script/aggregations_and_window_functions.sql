-- ================================================
-- SQL Aggregation & Window Functions – AirBnB
-- ================================================

-- 1. Total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;

-- 2. Ranking properties based on number of bookings
SELECT 
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        Property p
    LEFT JOIN 
        Booking b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id
) AS property_stats;


-- 2. Total number of bookings made by each user
SELECT 
    b.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM Booking b
JOIN User u ON b.user_id = u.user_id
GROUP BY b.user_id, u.first_name, u.last_name;

-- 2. Rank properties by total number of bookings using ROW_NUMBER()
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
