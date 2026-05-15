-- 03_views.sql
-- Views for common reporting tasks

CREATE OR REPLACE VIEW active_rentals AS
SELECT
    r.rental_id,
    c.full_name AS customer_name,
    ca.brand,
    ca.model,
    r.start_date,
    r.end_date,
    r.total_amount
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN cars ca ON r.car_id = ca.car_id
WHERE r.status = 'Active';

CREATE OR REPLACE VIEW revenue_summary AS
SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS total_revenue
FROM payments
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month;
