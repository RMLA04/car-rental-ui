-- 01_schema.sql
-- Car Rental Management System
-- Database schema, constraints, indexes, functions, and triggers

DROP VIEW IF EXISTS revenue_summary CASCADE;
DROP VIEW IF EXISTS active_rentals CASCADE;

DROP TABLE IF EXISTS car_features CASCADE;
DROP TABLE IF EXISTS features CASCADE;
DROP TABLE IF EXISTS maintenance CASCADE;
DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS rentals CASCADE;
DROP TABLE IF EXISTS cars CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS car_categories CASCADE;

CREATE TABLE car_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    daily_rate NUMERIC(10,2) NOT NULL CHECK (daily_rate > 0)
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(25) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    driver_license VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    phone VARCHAR(25) UNIQUE,
    manager_id INT REFERENCES employees(employee_id)
);

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    plate_number VARCHAR(20) UNIQUE NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL CHECK (year BETWEEN 2000 AND 2026),
    category_id INT NOT NULL REFERENCES car_categories(category_id),
    status VARCHAR(20) NOT NULL DEFAULT 'Available'
        CHECK (status IN ('Available', 'Rented', 'Maintenance'))
);

CREATE TABLE rentals (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    car_id INT NOT NULL REFERENCES cars(car_id),
    employee_id INT NOT NULL REFERENCES employees(employee_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    return_date DATE,
    total_amount NUMERIC(10,2) NOT NULL CHECK (total_amount >= 0),
    status VARCHAR(20) NOT NULL DEFAULT 'Active'
        CHECK (status IN ('Active', 'Completed', 'Cancelled')),
    CHECK (end_date >= start_date),
    CHECK (return_date IS NULL OR return_date >= start_date)
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    rental_id INT NOT NULL REFERENCES rentals(rental_id),
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    amount NUMERIC(10,2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(30) NOT NULL
        CHECK (payment_method IN ('Cash', 'Card', 'Bank Transfer'))
);

CREATE TABLE maintenance (
    maintenance_id SERIAL PRIMARY KEY,
    car_id INT NOT NULL REFERENCES cars(car_id),
    description TEXT NOT NULL,
    maintenance_date DATE NOT NULL DEFAULT CURRENT_DATE,
    cost NUMERIC(10,2) NOT NULL CHECK (cost >= 0)
);

CREATE TABLE features (
    feature_id SERIAL PRIMARY KEY,
    feature_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE car_features (
    car_id INT NOT NULL REFERENCES cars(car_id) ON DELETE CASCADE,
    feature_id INT NOT NULL REFERENCES features(feature_id) ON DELETE CASCADE,
    PRIMARY KEY (car_id, feature_id)
);

CREATE OR REPLACE FUNCTION calculate_rental_amount(
    p_car_id INT,
    p_start_date DATE,
    p_end_date DATE
)
RETURNS NUMERIC AS $$
DECLARE
    v_daily_rate NUMERIC;
    v_days INT;
    v_total NUMERIC;
BEGIN
    SELECT cc.daily_rate
    INTO v_daily_rate
    FROM cars c
    JOIN car_categories cc ON c.category_id = cc.category_id
    WHERE c.car_id = p_car_id;

    v_days := p_end_date - p_start_date + 1;
    v_total := v_days * v_daily_rate;

    RETURN v_total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_car_rented()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE cars
    SET status = 'Rented'
    WHERE car_id = NEW.car_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_car_rented
AFTER INSERT ON rentals
FOR EACH ROW
WHEN (NEW.status = 'Active')
EXECUTE FUNCTION set_car_rented();

CREATE OR REPLACE FUNCTION set_car_available()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'Completed' THEN
        UPDATE cars
        SET status = 'Available'
        WHERE car_id = NEW.car_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_car_available
AFTER UPDATE ON rentals
FOR EACH ROW
EXECUTE FUNCTION set_car_available();

CREATE INDEX idx_cars_status ON cars(status);
CREATE INDEX idx_rentals_customer_id ON rentals(customer_id);
CREATE INDEX idx_rentals_car_id ON rentals(car_id);
CREATE INDEX idx_payments_rental_id ON payments(rental_id);
CREATE INDEX idx_maintenance_car_id ON maintenance(car_id);
