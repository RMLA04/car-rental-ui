-- 02_seed_data.sql
-- Realistic seed data for the Car Rental Management System

TRUNCATE TABLE
car_features,
payments,
rentals,
maintenance,
cars,
features,
customers,
employees,
car_categories
RESTART IDENTITY CASCADE;

INSERT INTO car_categories (category_name, daily_rate)
VALUES 
('Economy', 1800),
('Compact', 2400),
('SUV', 3800),
('Luxury', 7500),
('Electric', 5200),
('Van', 4500);

INSERT INTO employees (full_name, position, phone, manager_id)
VALUES
('Sultan Toktonaliev', 'Manager', '+996 555 000 001', NULL),
('Firuz Azizbekov', 'Rental Agent', '+996 555 000 002', 1),
('Saadat Orozova', 'Rental Agent', '+996 555 000 003', 1),
('Alisher Isaev', 'Rental Agent', '+996 555 000 004', 1),
('Aruuke Mamatova', 'Accountant', '+996 555 000 005', 1),
('Ali Karimov', 'Technician', '+996 555 000 006', 1);

INSERT INTO customers (full_name, phone, email, driver_license)
VALUES
('Aigerim Sultanova', '+996 555 234 187', 'aigerim.sultanova@gmail.com', 'KG-DL-2024-001'),
('Nurlan Bekov', '+996 700 891 442', 'n.bekov@mail.ru', 'KG-DL-2024-002'),
('Sergey Ivanov', '+996 770 112 058', 'sergey.ivanov88@yandex.ru', 'KG-DL-2024-003'),
('Aizada Toktomusheva', '+996 555 776 320', NULL, 'KG-DL-2024-004'),
('Bakyt Asanov', '+996 312 612 845', 'bakyt.asanov@gmail.com', 'KG-DL-2024-005'),
('Cholpon Mamatova', '+996 700 451 239', 'cholpon.mamatova@mail.ru', 'KG-DL-2024-006'),
('Aziza Karimova', '+996 770 923 114', 'aziza.karimova@gmail.com', 'KG-DL-2024-007'),
('Dmitry Volkov', '+996 555 618 902', 'd.volkov@yandex.ru', 'KG-DL-2024-008'),
('Elena Petrova', '+996 700 332 771', 'elena.petrova@mail.ru', 'KG-DL-2024-009'),
('Talgat Nurpeisov', '+996 770 881 245', 't.nurpeisov@gmail.com', 'KG-DL-2024-010'),
('Meerim Osmonova', '+996 555 721 337', 'meerim.osmonova@gmail.com', 'KG-DL-2024-011'),
('Adilet Sadykov', '+996 700 998 231', 'adilet.sadykov@mail.ru', 'KG-DL-2024-012'),
('Gulzat Isakova', '+996 770 453 829', NULL, 'KG-DL-2024-013'),
('Ruslan Akmatov', '+996 555 364 775', 'ruslan.akmatov@yandex.ru', 'KG-DL-2024-014'),
('Diana Kim', '+996 700 212 640', 'diana.kim@gmail.com', 'KG-DL-2024-015'),
('Timur Abdullaev', '+996 770 672 118', 'timur.abdullaev@mail.ru', 'KG-DL-2024-016'),
('Kanykei Tursunova', '+996 555 891 304', 'kanykei.tursunova@gmail.com', 'KG-DL-2024-017'),
('Maksat Usonov', '+996 700 538 294', NULL, 'KG-DL-2024-018'),
('Zarina Alieva', '+996 770 812 502', 'zarina.alieva@yandex.ru', 'KG-DL-2024-019'),
('Emil Tokobaev', '+996 555 907 331', 'emil.tokobaev@gmail.com', 'KG-DL-2024-020'),
('Ainura Sydykova', '+996 700 154 993', 'ainura.sydykova@mail.ru', 'KG-DL-2024-021'),
('Marat Ibraev', '+996 770 408 665', 'marat.ibraev@gmail.com', 'KG-DL-2024-022'),
('Gulmira Abdykadyrova', '+996 555 673 118', NULL, 'KG-DL-2024-023'),
('Ermek Bekturov', '+996 700 741 506', 'ermek.bekturov@yandex.ru', 'KG-DL-2024-024'),
('Sabina Kadyrova', '+996 770 315 774', 'sabina.kadyrova@gmail.com', 'KG-DL-2024-025'),
('Arsen Tashiev', '+996 555 846 217', 'arsen.tashiev@mail.ru', 'KG-DL-2024-026'),
('Nargiza Usenova', '+996 700 629 184', NULL, 'KG-DL-2024-027'),
('Ilgiz Mambetov', '+996 770 734 965', 'ilgiz.mambetov@gmail.com', 'KG-DL-2024-028'),
('Venera Ismailova', '+996 555 490 328', 'venera.ismailova@yandex.ru', 'KG-DL-2024-029'),
('Rinat Muratov', '+996 700 284 739', 'rinat.muratov@mail.ru', 'KG-DL-2024-030'),
('Farida Kalybekova', '+996 555 129 884', 'farida.kalybekova@gmail.com', 'KG-DL-2024-031'),
('Samat Omuraliev', '+996 700 352 918', 'samat.omuraliev@mail.ru', 'KG-DL-2024-032'),
('Madina Sharshenova', '+996 770 809 441', NULL, 'KG-DL-2024-033'),
('Bektur Almazov', '+996 555 267 530', 'bektur.almazov@yandex.ru', 'KG-DL-2024-034'),
('Asel Raimkulova', '+996 700 935 712', 'asel.raimkulova@gmail.com', 'KG-DL-2024-035'),
('Kanat Orozbekov', '+996 770 642 300', 'kanat.orozbekov@mail.ru', 'KG-DL-2024-036'),
('Nadira Toktosunova', '+996 555 741 903', NULL, 'KG-DL-2024-037'),
('Erlan Moldokeev', '+996 700 418 675', 'erlan.moldokeev@gmail.com', 'KG-DL-2024-038'),
('Dinara Saparova', '+996 770 551 209', 'dinara.saparova@yandex.ru', 'KG-DL-2024-039'),
('Azamat Kudaibergenov', '+996 555 832 460', 'azamat.kudaibergenov@mail.ru', 'KG-DL-2024-040'),
('Jamilya Abdraimova', '+996 700 620 147', 'jamilya.abdraimova@gmail.com', 'KG-DL-2024-041'),
('Ulan Tologonov', '+996 770 903 281', NULL, 'KG-DL-2024-042'),
('Malika Ergeshova', '+996 555 374 692', 'malika.ergeshova@mail.ru', 'KG-DL-2024-043'),
('Iskender Naraliev', '+996 700 785 310', 'iskender.naraliev@gmail.com', 'KG-DL-2024-044'),
('Roza Kadyrova', '+996 770 248 519', 'roza.kadyrova@yandex.ru', 'KG-DL-2024-045'),
('Tilek Abdyldaev', '+996 555 908 612', NULL, 'KG-DL-2024-046'),
('Begimai Ryskulova', '+996 700 174 830', 'begimai.ryskulova@gmail.com', 'KG-DL-2024-047'),
('Ruslan Osmonov', '+996 770 490 276', 'ruslan.osmonov@mail.ru', 'KG-DL-2024-048'),
('Ainazik Sultanalieva', '+996 555 681 742', 'ainazik.sultanalieva@gmail.com', 'KG-DL-2024-049'),
('Nurbol Akunov', '+996 700 541 903', NULL, 'KG-DL-2024-050'),
('Kamila Imanalieva', '+996 770 734 112', 'kamila.imanalieva@yandex.ru', 'KG-DL-2024-051'),
('Dastan Omorov', '+996 555 312 870', 'dastan.omorov@gmail.com', 'KG-DL-2024-052'),
('Meerim Tynalieva', '+996 700 884 225', 'meerim.tynalieva@mail.ru', 'KG-DL-2024-053'),
('Altynai Esenalieva', '+996 770 617 390', NULL, 'KG-DL-2024-054'),
('Sanzhar Duisheev', '+996 555 427 618', 'sanzhar.duisheev@gmail.com', 'KG-DL-2024-055');

INSERT INTO features (feature_name)
VALUES
('Air Conditioning'),
('GPS Navigation'),
('Bluetooth'),
('Child Seat'),
('Rear Camera'),
('Heated Seats'),
('USB Charger'),
('Automatic Transmission'),
('Winter Tires'),
('Roof Rack');

INSERT INTO cars (plate_number, brand, model, year, category_id, status)
VALUES
('01KG123ABC', 'Toyota', 'Corolla', 2020, 1, 'Available'),
('01KG245ABD', 'Toyota', 'Camry', 2021, 2, 'Available'),
('01KG532SUV', 'Hyundai', 'Tucson', 2022, 3, 'Available'),
('01KG777SUV', 'Kia', 'Sportage', 2021, 3, 'Available'),
('01KG888LUX', 'Mercedes-Benz', 'E-Class', 2020, 4, 'Available'),
('01KG999LUX', 'BMW', '5 Series', 2022, 4, 'Available'),
('01KG301ELC', 'Tesla', 'Model 3', 2021, 5, 'Available'),
('01KG405ELC', 'Nissan', 'Leaf', 2020, 5, 'Available'),
('01KG615VAN', 'Honda', 'Odyssey', 2019, 6, 'Available'),
('01KG720VAN', 'Toyota', 'Sienna', 2021, 6, 'Available'),
('02KG111ECO', 'Hyundai', 'Accent', 2019, 1, 'Available'),
('02KG222ECO', 'Daewoo', 'Nexia', 2018, 1, 'Available'),
('02KG333COM', 'Volkswagen', 'Jetta', 2020, 2, 'Available'),
('02KG444COM', 'Skoda', 'Octavia', 2021, 2, 'Available'),
('02KG555SUV', 'Toyota', 'RAV4', 2022, 3, 'Available'),
('02KG666SUV', 'Lexus', 'RX350', 2021, 3, 'Available'),
('03KG101LUX', 'Audi', 'A6', 2020, 4, 'Available'),
('03KG202LUX', 'Genesis', 'G80', 2022, 4, 'Available'),
('03KG303ELC', 'Hyundai', 'Kona Electric', 2021, 5, 'Available'),
('03KG404ELC', 'BYD', 'Atto 3', 2023, 5, 'Available'),
('04KG505VAN', 'Mercedes-Benz', 'Vito', 2020, 6, 'Available'),
('04KG606VAN', 'Ford', 'Transit', 2019, 6, 'Available'),
('04KG707ECO', 'Chevrolet', 'Cobalt', 2020, 1, 'Available'),
('04KG808ECO', 'Kia', 'Rio', 2021, 1, 'Available'),
('05KG909COM', 'Toyota', 'Prius', 2019, 2, 'Available'),
('05KG110COM', 'Honda', 'Civic', 2020, 2, 'Available'),
('05KG221SUV', 'Mitsubishi', 'Outlander', 2021, 3, 'Available'),
('05KG332SUV', 'Subaru', 'Forester', 2020, 3, 'Available'),
('06KG443LUX', 'Mercedes-Benz', 'C-Class', 2021, 4, 'Available'),
('06KG554LUX', 'BMW', 'X5', 2022, 4, 'Available'),
('06KG665ELC', 'Volkswagen', 'ID.4', 2023, 5, 'Available'),
('06KG776ELC', 'Toyota', 'bZ4X', 2023, 5, 'Available'),
('07KG887VAN', 'Hyundai', 'Staria', 2022, 6, 'Available'),
('07KG998VAN', 'Kia', 'Carnival', 2021, 6, 'Available'),
('08KG109ECO', 'Ravon', 'R4', 2018, 1, 'Available'),
('08KG210COM', 'Mazda', '3', 2020, 2, 'Available'),
('08KG321SUV', 'Nissan', 'X-Trail', 2021, 3, 'Available'),
('08KG432LUX', 'Lexus', 'ES250', 2022, 4, 'Available'),
('08KG543ELC', 'Tesla', 'Model Y', 2023, 5, 'Available'),
('08KG654VAN', 'Toyota', 'Hiace', 2020, 6, 'Available');

INSERT INTO car_features (car_id, feature_id)
SELECT c.car_id, f.feature_id
FROM cars c
JOIN features f ON f.feature_name IN ('Air Conditioning', 'USB Charger');

INSERT INTO car_features (car_id, feature_id)
SELECT c.car_id, f.feature_id
FROM cars c
JOIN features f ON f.feature_name IN ('GPS Navigation', 'Bluetooth')
WHERE c.category_id IN (2, 3, 4, 5);

INSERT INTO car_features (car_id, feature_id)
SELECT c.car_id, f.feature_id
FROM cars c
JOIN features f ON f.feature_name = 'Rear Camera'
WHERE c.category_id IN (3, 4, 5, 6);

INSERT INTO car_features (car_id, feature_id)
SELECT c.car_id, f.feature_id
FROM cars c
JOIN features f ON f.feature_name = 'Heated Seats'
WHERE c.category_id IN (4, 5);

INSERT INTO car_features (car_id, feature_id)
SELECT c.car_id, f.feature_id
FROM cars c
JOIN features f ON f.feature_name IN ('Child Seat', 'Roof Rack')
WHERE c.category_id IN (3, 6);

INSERT INTO car_features (car_id, feature_id)
SELECT c.car_id, f.feature_id
FROM cars c
JOIN features f ON f.feature_name = 'Automatic Transmission'
WHERE c.category_id <> 1;

INSERT INTO car_features (car_id, feature_id)
SELECT c.car_id, f.feature_id
FROM cars c
JOIN features f ON f.feature_name = 'Winter Tires'
WHERE c.category_id IN (1, 2, 3, 6)
ON CONFLICT DO NOTHING;

INSERT INTO rentals (
    customer_id,
    car_id,
    employee_id,
    start_date,
    end_date,
    return_date,
    total_amount,
    status
)
SELECT
    CASE
        WHEN i <= 90 THEN ((i % 10) + 1)
        WHEN i <= 150 THEN ((i % 20) + 1)
        ELSE ((i % 55) + 1)
    END,
    ((i % 40) + 1),
    ((i % 5) + 2),
    DATE '2026-01-05' + ((i * 2) % 120),
    DATE '2026-01-05' + ((i * 2) % 120) + ((i % 7) + 1),
    CASE
        WHEN i % 20 = 0 THEN NULL
        ELSE DATE '2026-01-05' + ((i * 2) % 120) + ((i % 7) + 1)
    END,
    calculate_rental_amount(
        ((i % 40) + 1),
        DATE '2026-01-05' + ((i * 2) % 120),
        DATE '2026-01-05' + ((i * 2) % 120) + ((i % 7) + 1)
    ),
    CASE
        WHEN i % 20 = 0 THEN 'Active'
        WHEN i % 17 = 0 THEN 'Cancelled'
        ELSE 'Completed'
    END
FROM generate_series(1, 220) AS s(i);

INSERT INTO payments (rental_id, payment_date, amount, payment_method)
SELECT
    rental_id,
    COALESCE(return_date, end_date),
    total_amount,
    CASE
        WHEN rental_id % 4 = 0 THEN 'Cash'
        WHEN rental_id % 4 = 1 THEN 'Card'
        ELSE 'Bank Transfer'
    END
FROM rentals
WHERE status = 'Completed';

INSERT INTO maintenance (car_id, description, maintenance_date, cost)
SELECT
    ((i % 40) + 1),
    CASE
        WHEN i % 5 = 0 THEN 'Oil change and basic inspection'
        WHEN i % 5 = 1 THEN 'Brake inspection and replacement of worn pads'
        WHEN i % 5 = 2 THEN 'Winter tire replacement before mountain trip'
        WHEN i % 5 = 3 THEN 'Engine diagnostics after long-distance rental'
        ELSE 'Interior cleaning and minor body inspection'
    END,
    DATE '2026-01-10' + ((i * 3) % 110),
    CASE
        WHEN i % 5 = 0 THEN 2500
        WHEN i % 5 = 1 THEN 6500
        WHEN i % 5 = 2 THEN 4200
        WHEN i % 5 = 3 THEN 8000
        ELSE 1800
    END
FROM generate_series(1, 100) AS s(i);
