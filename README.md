```markdown
# Sales Analytics Project

## 📌 Project Overview
This project is a complete end-to-end data analytics pipeline for analyzing sales data from a multi‑channel online store. It includes data generation, cleaning, modeling, and visualization.

- **Goal:** Identify revenue drivers, customer segments, product performance, and operational insights.
- **Tools:** Python (pandas), PostgreSQL, dbt, Power BI
- **Duration:** Based on a 6‑month sales scenario (simulated dataset, with real product prices and platforms)

---

## 📂 Project Structure

```

sales_project/
├── data/
│   ├── raw/                  # Raw CSV files
│   └── cleaned/              # Cleaned data
├── dbt/                      # dbt project
│   ├── models/
│   │   ├── staging/
│   │   ├── intermediate/
│   │   └── marts/
│   ├── seeds/
│   ├── tests/
│   ├── macros/
│   ├── analyses/
│   ├── dbt_project.yml
│   └── profiles_sample.yml
├── powerbi/
│   ├── sales_dashboard.pbix
│   └── screenshots/
├── python/
│   ├── data_cleaning.py
│   ├── generate_sales_data.py
│   ├── load_to_postgres.py
│   └── requirements.txt
├── sql_queries/
└── README.md

```

---

## 📊 Key Analyses

| Analysis | Description |
|----------|-------------|
| **RFM** | Customer segmentation based on Recency, Frequency, Monetary |
| **CLV** | Customer Lifetime Value estimation |
| **Cohort Analysis** | Customer retention over time |
| **Pareto (80/20)** | Revenue concentration analysis |
| **Market Basket (SCL)** | Product association rules (Support, Confidence, Lift) |
| **Discount Impact** | Sales comparison with/without discounts |
| **City & Platform** | Revenue breakdown by city and sales channel |
| **Weekday Analysis** | Sales patterns by day of week |

---

## 🖥️ Dashboard Pages

| Page | Content |
|------|---------|
| **1. Overview** | KPIs, Monthly Sales, Revenue by City, Customer Segments, Weekday Pattern |
| **2. Customer Analysis** | RFM Scores, Pareto, Cohort Retention |
| **3. Products & Discounts** | Top Products, Discount Impact, Market Basket Analysis |
| **4. Operational Insights** | City/Platform Revenue, Daily Trend, Cohort Retention |

---

## 🚀 How to Run

### 1. Clone the repository
```bash
git clone https://github.com/Data-Analyst-Journey/sales_project.git
cd sales_project
```

2. Set up PostgreSQL

· Create a database named sales_db.
· Update python/load_to_postgres.py with your credentials.

3. Install Python dependencies

```bash
pip install -r python/requirements.txt
```

4. Generate and load data

```bash
python python/generate_sales_data.py
python python/data_cleaning.py
python python/load_to_postgres.py
```

5. Run dbt models

```bash
cd dbt
dbt run
dbt test
dbt docs generate
dbt docs serve
```

6. Open Power BI

· Open powerbi/sales_dashboard.pbix.
· Update the data source connection to your PostgreSQL database.
· Refresh the data.

---

📌 Data Privacy Note

The dataset used in this project is simulated and does not contain any real customer or business data. It was designed to reflect realistic sales patterns while preserving full confidentiality.

---

👩‍💻 Author

Samaneh Kavianfar
LinkedIn: https://www.linkedin.com/in/samaneh-kavianfar-8a93033b2

GitHub:
https://github.com/Data-Analyst-Journey

```
