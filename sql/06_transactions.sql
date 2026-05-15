-- 06_transactions.sql
-- Transaction example for safe rental processing

BEGIN;

UPDATE cars
SET status = 'Rented'
WHERE car_id = 5;

INSERT INTO rentals (
    customer_id,
    car_id,
    employee_id,
    start_date,
    end_date,
    total_amount,
    status
)
VALUES (
    1,
    5,
    2,
    CURRENT_DATE,
    CURRENT_DATE + 3,
    calculate_rental_amount(5, CURRENT_DATE, CURRENT_DATE + 3),
    'Active'
);

ROLLBACK;
