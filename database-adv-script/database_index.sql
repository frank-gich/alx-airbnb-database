-- =====================================================
-- Index Creation Script to Improve Query Performance
-- File: database_index.sql
-- =====================================================

-- ==========================
-- USER TABLE OPTIMIZATIONS
-- ==========================

CREATE INDEX idx_user_role ON User(role);
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_created_at ON User(created_at);

-- ==========================
-- PROPERTY TABLE OPTIMIZATIONS
-- ==========================

CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);
CREATE INDEX idx_property_created_at ON Property(created_at);

-- ==========================
-- BOOKING TABLE OPTIMIZATIONS
-- ==========================

CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_user_status ON Booking(user_id, status);

-- ==========================
-- PERFORMANCE ANALYSIS USING EXPLAIN ANALYZE
-- ==========================

-- Example: Checking performance on a frequent query

EXPLAIN ANALYZE
SELECT 
    booking_id,
    start_date,
    end_date,
    status
FROM Booking
WHERE user_id = 'sample-user-id'
  AND status = 'confirmed'
  AND start_date >= '2024-01-01';
