# 🚗 Car Rental Management System

A full-stack database project built using **PostgreSQL**, **Flask**, and **HTML/CSS**, designed to manage car rentals, customers, payments, maintenance records, and business reports.

---

## 🌐 Live Demo

🔗 https://car-rental-ui-7.onrender.com/

---

## 📂 GitHub Repository

🔗 https://github.com/RMLA04/car-rental-ui

---

## 🧾 Project Description

The Car Rental Management System is a web-based application developed for managing daily operations of a car rental company.

The system allows users to:

* Manage customers
* Manage cars and categories
* Process rental transactions
* Record payments
* Track maintenance records
* Generate reports and analytics

The project demonstrates practical database design concepts, SQL implementation, normalization, indexing, transactions, and deployment.

---

## ⚙️ Technologies Used

* **Backend:** Python (Flask)
* **Database:** PostgreSQL (Supabase)
* **Frontend:** HTML, CSS, Jinja2
* **Deployment:** Render
* **Database Management:** pgAdmin 4
* **Version Control:** Git & GitHub

---

## 🗄️ Database Features

The database includes:

* Relational database schema
* Primary and foreign keys
* One-to-many relationships
* Many-to-many relationships
* Constraints (`PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `UNIQUE`)
* Indexing for performance optimization
* SQL views
* Transaction management
* Role-based security

---

## 🧩 Main Tables

The system contains the following main tables:

* customers
* employees
* car_categories
* cars
* rentals
* payments
* maintenance
* features
* car_features

---

## 💻 System Features

### Customer Management

* Add new customers
* Store customer contact information
* Driver license tracking

### Car Management

* Add and manage cars
* Track car availability
* Categorize cars by type

### Rental Management

* Create rentals
* Return vehicles
* Calculate rental duration and costs

### Payment Management

* Record customer payments
* Track payment methods
* Generate revenue reports

### Maintenance Management

* Store maintenance history
* Track maintenance costs
* Monitor vehicle conditions

### Reports & Analytics

* Monthly revenue reports
* Rental statistics
* Car usage analytics

---

## 📊 Database Statistics

Current database contains:

* 55 customers
* 40 cars
* 220 rentals
* 394 payments
* 100 maintenance records

The seed data follows realistic distribution patterns and business scenarios.

---

## 🔐 Security

* Environment variables are used for database credentials
* Sensitive data is not stored inside the repository
* Database roles and privileges are implemented using PostgreSQL roles

---

## 🚀 Deployment

### Frontend + Backend

* Hosted on Render

### Database

* Hosted on Supabase PostgreSQL

The application is publicly accessible online.

---

## 📸 Screenshots

### Dashboard

<img width="959" height="472" alt="Dashboard" src="https://github.com/user-attachments/assets/b73788cf-d1e0-427c-b7d0-37ce21a0b911" />

### Customers Page

<img width="960" height="471" alt="Customers" src="https://github.com/user-attachments/assets/156263c5-ac28-4c3c-a87c-8bd703e93adc" />

### Cars Page

<img width="960" height="474" alt="Cars" src="https://github.com/user-attachments/assets/184c8b1a-4b3d-46de-abc8-2bcea88d44e3" />

### Rentals Page

<img width="958" height="415" alt="Rentals" src="https://github.com/user-attachments/assets/5be7be3d-a20f-4c51-91e1-8d57fdc1d1b5" />

### Payments Page

<img width="958" height="480" alt="Payments" src="https://github.com/user-attachments/assets/60c5acf7-7702-4118-9e3d-dcde7431d761" />

### Reports Page

<img width="959" height="473" alt="Reports" src="https://github.com/user-attachments/assets/95d7df52-f10d-4b9c-ae0d-ee1025bcd833" />

---

## 🧪 Testing

The following test cases were successfully performed:

* Adding customers
* Adding cars
* Creating rentals
* Returning vehicles
* Recording payments
* Revenue calculation
* Data validation through constraints
* Foreign key relationship enforcement
* Transaction rollback testing

---

## 📁 Project Structure

```bash
car-rental-ui/
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_seed_data.sql
│   ├── 03_views.sql
│   ├── 04_queries.sql
│   ├── 05_roles.sql
│   └── 06_transactions.sql
│
├── templates/
├── static/
├── app.py
├── db.py
├── requirements.txt
├── README.md
└── car_rental_dump.backup
```

---

## 🛠️ Setup Instructions

### PostgreSQL Version

Recommended version:

```bash
PostgreSQL 15+
```

### Restore Database

```bash
pg_restore -U postgres -d car_rental_db car_rental_dump.backup
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Run Application

```bash
python app.py
```

---

## 📈 Future Improvements

Possible future improvements include:

* User authentication system
* Admin and employee dashboards
* Advanced analytics
* Search and filtering
* Mobile-responsive design
* Online booking functionality

---

## 🤖 AI Usage Declaration

AI tools were used to assist with:

* SQL debugging
* Query optimization
* Documentation drafting
* Deployment troubleshooting
* README formatting assistance

All generated content was reviewed, tested, and validated manually before final submission.

---

## 👤 Author

**Adolat Gharibshoeva**

University of Central Asia
Computer Science Department

---

## 📌 Academic Note

This project was developed as a final database systems course project and demonstrates practical implementation of relational database concepts, SQL development, deployment, and database-driven application integration.

---
