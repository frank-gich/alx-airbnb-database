-- =====================================================
-- Index Creation Script to Improve Query Performance
-- File: database_index.sql
-- =====================================================

-- ==========================
-- USER TABLE OPTIMIZATIONS
-- ==========================

-- Index to speed up lookups by role (e.g., WHERE role = 'host')
CREATE INDEX idx_user_role ON User(role);

-- Index to optimize filtering by email (e.g., for login/auth)
CREATE INDEX idx_user_email ON User(email);

-- Index to help with sorting or filtering by creation date
CREATE INDEX idx_user_created_at ON User(created_at);

-- ==========================
-- PROPERTY TABLE OPTIMIZATIONS
-- ==========================

-- Index to speed up filtering by host
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index to optimize location-based searches
CREATE INDEX idx_property_location ON Property(location);

-- Index to improve sorting/filtering by price
CREATE INDEX idx_property_price ON Property(price_per_night);

-- Index for date-based filtering and property creation tracking
CREATE INDEX idx_property_created_at ON Property(created_at);

-- ==========================
-- BOOKING TABLE OPTIMIZATIONS
-- ==========================

-- Index to speed up JOINs on property_id
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index to speed up JOINs and user history queries
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index for status-based filtering (e.g., WHERE status = 'confirmed')
CREATE INDEX idx_booking_status ON Booking(status);

-- Index for range queries on booking dates
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Composite index for filtering by user and booking status
CREATE INDEX idx_booking_user_status ON Booking(user_id, status);

-- ==========================
-- PERFORMANCE TEST (OPTIONAL)
-- ==========================

-- Example EXPLAIN usage before/after indexes:
EXPLAIN
SELECT *
FROM Booking
WHERE status = 'confirmed'
  AND start_date >= '2024-01-01'
  AND user_id = 'some-user-id';
