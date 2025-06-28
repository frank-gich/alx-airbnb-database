-- =====================================================
-- AirBnB Database Seeding Script - Simple Sample Data
-- File: seed.sql
-- =====================================================

-- =====================================================
-- USERS DATA
-- =====================================================

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
-- Admin
('550e8400-e29b-41d4-a716-446655440001', 'Admin', 'User', 'admin@airbnb.com', '$2y$10$hashedpassword1', '+1-555-0001', 'admin', '2023-01-15 09:00:00'),

-- Hosts
('550e8400-e29b-41d4-a716-446655440002', 'John', 'Host', 'john.host@email.com', '$2y$10$hashedpassword2', '+1-555-0002', 'host', '2023-02-01 10:00:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Jane', 'Smith', 'jane.smith@email.com', '$2y$10$hashedpassword3', '+1-555-0003', 'host', '2023-02-15 11:00:00'),

-- Guests
('550e8400-e29b-41d4-a716-446655440004', 'Bob', 'Guest', 'bob.guest@email.com', '$2y$10$hashedpassword4', '+1-555-0004', 'guest', '2023-03-01 12:00:00'),
('550e8400-e29b-41d4-a716-446655440005', 'Alice', 'Johnson', 'alice.johnson@email.com', '$2y$10$hashedpassword5', '+1-555-0005', 'guest', '2023-03-10 13:00:00');

-- =====================================================
-- PROPERTIES DATA
-- =====================================================

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Cozy Apartment', 'A cozy 2-bedroom apartment in downtown.', 'New York, NY', 120.00, '2023-02-02 10:00:00', '2023-02-02 10:00:00'),

('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', 'Modern Loft', 'Modern loft with city views.', 'Los Angeles, CA', 180.00, '2023-02-10 11:00:00', '2023-02-10 11:00:00'),

('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440003', 'Beach House', 'Beautiful beach house with ocean view.', 'Miami, FL', 250.00, '2023-02-20 12:00:00', '2023-02-20 12:00:00');

-- =====================================================
-- BOOKINGS DATA
-- =====================================================

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', '2023-06-01', '2023-06-05', 480.00, 'confirmed', '2023-05-15 10:00:00'),

('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440005', '2023-07-10', '2023-07-15', 900.00, 'confirmed', '2023-06-01 11:00:00'),

('770e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', '2023-08-20', '2023-08-25', 1250.00, 'pending', '2023-07-15 14:00:00');

-- =====================================================
-- PAYMENTS DATA
-- =====================================================

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('880e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440001', 480.00, '2023-05-15 10:05:00', 'credit_card'),

('880e8400-e29b-41d4-a716-446655440002', '770e8400-e29b-41d4-a716-446655440002', 900.00, '2023-06-01 11:05:00', 'paypal');

-- =====================================================
-- REVIEWS DATA
-- =====================================================

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('990e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', 5, 'Great apartment! Very clean and comfortable.', '2023-06-06 10:00:00'),

('990e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440005', 4, 'Nice loft with amazing views. Highly recommend!', '2023-07-16 12:00:00');

-- =====================================================
-- MESSAGES DATA
-- =====================================================

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('aa0e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Hi! Is your apartment available for June 1-5?', '2023-05-10 09:00:00'),

('aa0e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 'Yes, it is available! Would you like to book it?', '2023-05-10 10:00:00'),

('aa0e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 'Thank you for the great stay at your beach house!', '2023-07-17 15:00:00');

-- =====================================================
-- Enable foreign key checks
-- =====================================================
SET FOREIGN_KEY_CHECKS = 1;