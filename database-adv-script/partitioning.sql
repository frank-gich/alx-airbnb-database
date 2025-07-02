-- ============================
-- Step 1: Rename Original Table
-- ============================
ALTER TABLE Booking RENAME TO Booking_old;

-- ============================
-- Step 2: Create Partitioned Table
-- ============================
CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- ============================
-- Step 3: Create Partitions by Year
-- ============================
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- ============================
-- Step 4: Copy Existing Data
-- ============================
INSERT INTO Booking
SELECT * FROM Booking_old;

-- ============================
-- Step 5: Optional Indexing
-- ============================
CREATE INDEX idx_booking_start_date_2022 ON Booking_2022(start_date);
CREATE INDEX idx_booking_start_date_2023 ON Booking_2023(start_date);
CREATE INDEX idx_booking_start_date_2024 ON Booking_2024(start_date);
CREATE INDEX idx_booking_start_date_2025 ON Booking_2025(start_date);
