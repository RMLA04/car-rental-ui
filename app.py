from flask import Flask, render_template, request, redirect
from db import get_connection

app = Flask(__name__)


@app.route("/")
def index():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT COUNT(*) FROM customers")
    customers = cur.fetchone()[0]

    cur.execute("SELECT COUNT(*) FROM cars")
    cars = cur.fetchone()[0]

    cur.execute("SELECT COUNT(*) FROM rentals")
    rentals = cur.fetchone()[0]

    cur.execute("SELECT COALESCE(SUM(amount), 0) FROM payments")
    revenue = cur.fetchone()[0]

    cur.close()
    conn.close()

    return render_template(
        "index.html",
        customers=customers,
        cars=cars,
        rentals=rentals,
        revenue=revenue
    )


@app.route("/customers", methods=["GET", "POST"])
def customers():
    conn = get_connection()
    cur = conn.cursor()

    if request.method == "POST":
        full_name = request.form["full_name"]
        phone = request.form["phone"]
        email = request.form["email"]
        driver_license = request.form["driver_license"]

        cur.execute("""
            INSERT INTO customers (full_name, phone, email, driver_license)
            VALUES (%s, %s, %s, %s)
        """, (full_name, phone, email, driver_license))

        conn.commit()
        return redirect("/customers")

    cur.execute("SELECT * FROM customers ORDER BY customer_id")
    customers = cur.fetchall()

    cur.close()
    conn.close()

    return render_template("customers.html", customers=customers)


@app.route("/cars", methods=["GET", "POST"])
def cars():
    conn = get_connection()
    cur = conn.cursor()

    if request.method == "POST":
        plate_number = request.form["plate_number"]
        brand = request.form["brand"]
        model = request.form["model"]
        year = request.form["year"]
        category_id = request.form["category_id"]

        cur.execute("""
            INSERT INTO cars (plate_number, brand, model, year, category_id, status)
            VALUES (%s, %s, %s, %s, %s, 'Available')
        """, (plate_number, brand, model, year, category_id))

        conn.commit()
        return redirect("/cars")

    cur.execute("""
        SELECT c.car_id, c.plate_number, c.brand, c.model, c.year,
               cc.category_name, c.status
        FROM cars c
        JOIN car_categories cc ON c.category_id = cc.category_id
        ORDER BY c.car_id
    """)
    cars = cur.fetchall()

    cur.execute("SELECT category_id, category_name FROM car_categories")
    categories = cur.fetchall()

    cur.close()
    conn.close()

    return render_template("cars.html", cars=cars, categories=categories)


@app.route("/rentals", methods=["GET", "POST"])
def rentals():
    conn = get_connection()
    cur = conn.cursor()

    if request.method == "POST":
        customer_id = request.form["customer_id"]
        car_id = request.form["car_id"]
        employee_id = request.form["employee_id"]
        start_date = request.form["start_date"]
        end_date = request.form["end_date"]

        cur.execute("""
            INSERT INTO rentals (
                customer_id, car_id, employee_id, start_date, end_date, total_amount, status
            )
            VALUES (
                %s, %s, %s, %s, %s,
                calculate_rental_amount(%s, %s, %s),
                'Active'
            )
        """, (
            customer_id, car_id, employee_id, start_date, end_date,
            car_id, start_date, end_date
        ))

        conn.commit()
        return redirect("/rentals")

    cur.execute("""
        SELECT r.rental_id, cu.full_name, c.brand, c.model, e.full_name,
               r.start_date, r.end_date, r.return_date, r.total_amount, r.status
        FROM rentals r
        JOIN customers cu ON r.customer_id = cu.customer_id
        JOIN cars c ON r.car_id = c.car_id
        JOIN employees e ON r.employee_id = e.employee_id
        ORDER BY r.rental_id DESC
    """)
    rentals = cur.fetchall()

    cur.execute("SELECT customer_id, full_name FROM customers")
    customers = cur.fetchall()

    cur.execute("""
        SELECT car_id, brand, model
        FROM cars
        WHERE status = 'Available'
    """)
    cars = cur.fetchall()

    cur.execute("SELECT employee_id, full_name FROM employees")
    employees = cur.fetchall()

    cur.close()
    conn.close()

    return render_template(
        "rentals.html",
        rentals=rentals,
        customers=customers,
        cars=cars,
        employees=employees
    )


@app.route("/return_car/<int:rental_id>")
def return_car(rental_id):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        UPDATE rentals
        SET return_date = CURRENT_DATE,
            status = 'Completed'
        WHERE rental_id = %s
    """, (rental_id,))

    conn.commit()
    cur.close()
    conn.close()

    return redirect("/rentals")


@app.route("/payments", methods=["GET", "POST"])
def payments():
    conn = get_connection()
    cur = conn.cursor()

    if request.method == "POST":
        rental_id = request.form["rental_id"]
        amount = request.form["amount"]
        payment_method = request.form["payment_method"]

        cur.execute("""
            INSERT INTO payments (rental_id, amount, payment_method)
            VALUES (%s, %s, %s)
        """, (rental_id, amount, payment_method))

        conn.commit()
        return redirect("/payments")

    cur.execute("""
        SELECT p.payment_id, p.rental_id, p.payment_date, p.amount, p.payment_method
        FROM payments p
        ORDER BY p.payment_id DESC
    """)
    payments = cur.fetchall()

    cur.execute("""
        SELECT rental_id, total_amount
        FROM rentals
        ORDER BY rental_id
    """)
    rentals = cur.fetchall()

    cur.close()
    conn.close()

    return render_template("payments.html", payments=payments, rentals=rentals)


@app.route("/reports")
def reports():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT cc.category_name, COALESCE(SUM(r.total_amount), 0)
        FROM rentals r
        JOIN cars c ON r.car_id = c.car_id
        JOIN car_categories cc ON c.category_id = cc.category_id
        GROUP BY cc.category_name
        ORDER BY SUM(r.total_amount) DESC
    """)
    revenue_by_category = cur.fetchall()

    cur.execute("""
        SELECT c.brand, c.model, COUNT(r.rental_id)
        FROM rentals r
        JOIN cars c ON r.car_id = c.car_id
        GROUP BY c.brand, c.model
        ORDER BY COUNT(r.rental_id) DESC
        LIMIT 10
    """)
    most_rented = cur.fetchall()

    cur.close()
    conn.close()

    return render_template(
        "reports.html",
        revenue_by_category=revenue_by_category,
        most_rented=most_rented
    )


if __name__ == "__main__":
    app.run(debug=True)
