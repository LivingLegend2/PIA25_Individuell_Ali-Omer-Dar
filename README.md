# Electronics Shop Database

This project is a database system for managing an electronics store with products, customers, orders, and reviews.

---

### Project Files

SQL Files:

* schema.sql - Creates all database tables
* testdata.sql - Adds data to tables
* queries.sql - 10 basic SQL queries
* queries_advanced.sql - 6 advanced SQL queries
* optimization.sql - Index performance testing

Python Files:

* database.py - Database connection
* models.py - Table structure definitions
* queries.py - Query functions
* main.py - Main program

Other Files:

* requirements.txt - Python dependencies list
* .env - Database credentials (you create this)

---

### Requirements

Software to install:

* Python 3.8 or newer
* PostgreSQL 12 or newer

Python libraries (auto-installed from requirements.txt):

* SQLAlchemy
* psycopg2-binary
* python-dotenv

---

### Installation

1. Download project files to your computer

2. Open terminal in project folder

3. Create virtual environment:
   python -m venv venv

4. Activate virtual environment:
   * Windows: venv\Scripts\activate
   * Mac/Linux: source venv/bin/activate

5. Install Python packages:
   pip install -r requirements.txt

6. Create .env file with your database settings:
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=electronics_db
   DB_USER=postgres
   DB_PASSWORD=your_password

7. Create database and add data:
   * Use pgAdmin, psql, or VS Code with PostgreSQL extension
   * Run schema.sql first
   * Then run testdata.sql

8. Run Python application:
   python main.py

---

## How to Use

#### Running Python Application

With virtual environment activated:
python main.py

This displays results from 12 queries:

* All products
* Products by price filter
* Orders by year
* Pending orders
* Products with brand names
* Orders with customer info
* Products by brand
* Customer orders
* Products purchased by customer
* Products per brand count
* Top spending customers
* Products with ratings

#### Running SQL Files

You can run SQL files directly in your database tool:

* pgAdmin - Open Query Tool, load file, execute
* psql - Use \i filename.sql command
* VS Code - With PostgreSQL extension, run files directly

Files to run:

* queries.sql - Basic SELECT, JOIN, GROUP BY queries
* queries_advanced.sql - Subqueries, window functions, CASE statements
* optimization.sql - EXPLAIN ANALYZE showing index performance

---

#### Troubleshooting

Virtual environment issues:
* Make sure you're in project folder
* Try python3 instead of python on Mac/Linux

Module not found:
* Activate virtual environment first
* Run pip install -r requirements.txt

Database connection errors:
* Check .env file exists and has correct settings
* Verify PostgreSQL is running
* Confirm database name matches

SQL errors:
* Run schema.sql before testdata.sql
* Check database exists before running schema.sql
