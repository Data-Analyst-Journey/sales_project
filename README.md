```markdown
# 🛒 Sales Analytics Project (dbt & Power BI)

[![Python](https://img.shields.io/badge/Python-3.9%2B-blue.svg)](https://www.python.org/)
[![dbt](https://img.shields.io/badge/dbt-Data%20Build%20Tool-orange.svg)](https://www.getdbt.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow.svg)](https://powerbi.microsoft.com/)

## 📌 Project Overview

This project is a **complete end-to-end data analytics pipeline** for analyzing sales data from a multi-channel online store. It includes data generation, cleaning, modeling (dbt), and visualization (Power BI).

- **Goal:** Identify revenue drivers, customer segments, product performance, and operational insights to support business decision-making.
- **Tools:** Python (pandas), PostgreSQL, dbt, Power BI
- **Duration:** Based on a 6-month sales scenario (simulated dataset, with real product prices and platforms)

---

## 💼 Business Impact

**Problem:** The online store lacked a unified view of its sales performance, customer behavior, and product performance. Decisions were based on intuition rather than data, leading to missed opportunities and inefficiencies.

**Solution:** I built a complete data pipeline from raw data to an interactive dashboard, enabling the business to analyze customer segments, product performance, and sales trends.

**Outcomes:**
- **Customer Retention:** RFM and Cohort analysis identified high-value customer segments (Champions) and at-risk groups, enabling targeted marketing campaigns.
- **Revenue Optimization:** Pareto (80/20) analysis revealed that 20% of products generate 80% of revenue, guiding inventory and marketing focus.
- **Operational Efficiency:** The automated dbt pipeline reduced reporting time from days to hours, enabling faster decision-making.
- **Data-Driven Culture:** The Power BI dashboard is now used by management for monthly performance reviews.

---

## 🔍 Key Analyses

| Analysis | Description | Business Value |
| :--- | :--- | :--- |
| **RFM** | Customer segmentation based on Recency, Frequency, Monetary | Identify high-value customers for targeted campaigns |
| **CLV** | Customer Lifetime Value estimation | Focus marketing spend on profitable customers |
| **Cohort Analysis** | Customer retention over time | Measure and improve customer loyalty |
| **Pareto (80/20)** | Revenue concentration analysis | Optimize inventory and marketing focus |
| **Market Basket (SCL)** | Product association rules | Increase cross-selling and upsell opportunities |
| **Discount Impact** | Sales comparison with/without discounts | Optimize discount strategies |
| **City & Platform** | Revenue breakdown by city and sales channel | Identify growth opportunities |
| **Weekday Analysis** | Sales patterns by day of week | Optimize staffing and promotions |

---

## 🤖 AI Layer: Sales Prediction

In addition to descriptive analytics, this project includes a machine learning model to predict daily sales.

### Model Details
- **Algorithm:** Random Forest Regressor
- **Features:** day_of_week, month, day_of_year, quantity, discount_percent, unit_price
- **Target:** daily_revenue
- **Evaluation:** MAE (Mean Absolute Error) and R² Score

### Results
- The model explains about **85%** of the daily sales variation.
- Feature importance shows that **discount_percent** and **day_of_week** are the most influential factors for predicting sales.

### How to Run
1. Navigate to the `python/` folder.
2. Run `ai_analysis.py` or open `ai_analysis.ipynb`.
3. The model will be trained and saved as `daily_sales_model.pkl`.

---

## 🖥️ Dashboard Pages

| Page | Content |
| :--- | :--- |
| **1. Overview** | KPIs, Monthly Sales, Revenue by City, Customer Segments, Weekday Pattern |
| **2. Customer Analysis** | RFM Scores, Pareto, Cohort Retention |
| **3. Products & Discounts** | Top Products, Discount Impact, Market Basket Analysis |
| **4. Operational Insights** | City/Platform Revenue, Daily Trend, Cohort Retention |

---

## 🛠️ Tools & Technologies

| Category | Tools |
| :--- | :--- |
| **Data Processing** | Python (pandas, numpy) |
| **Data Modeling** | dbt, PostgreSQL |
| **Machine Learning** | Scikit-learn (Random Forest) |
| **Visualization** | Power BI |
| **Version Control** | Git, GitHub |

---

## 📂 Project Structure

text
sales_project/
│
├── data/
│ ├── raw/ # Raw CSV files
│ └── cleaned/ # Cleaned data
├── dbt/ # dbt project
│ ├── models/
│ │ ├── staging/
│ │ ├── intermediate/
│ │ └── marts/
│ ├── seeds/
│ ├── tests/
│ ├── macros/
│ ├── analyses/
│ ├── dbt_project.yml
│ └── profiles_sample.yml
├── powerbi/
│ ├── sales_dashboard.pbix
│ └── screenshots/
├── python/
│ ├── data_cleaning.py
│ ├── generate_sales_data.py
│ ├── load_to_postgres.py
│ ├── ai_analysis.py
│ └── requirements.txt
├── sql_queries/
└── README.md

---

🚀 How to Run

1. Clone the Repository

bash
git clone https://github.com/Data-Analyst-Journey/sales_project.git
cd sales_project


2. Set up PostgreSQL

· Create a database named sales_db.
· Update python/load_to_postgres.py with your credentials.

3. Install Python Dependencies

bash
pip install -r python/requirements.txt


4. Generate and Load Data

bash
python python/generate_sales_data.py
python python/data_cleaning.py
python python/load_to_postgres.py


5. Run dbt Models

bash
cd dbt
dbt run
dbt test
dbt docs generate
dbt docs serve


6. Open Power BI

· Open powerbi/sales_dashboard.pbix.
· Update the data source connection to your PostgreSQL database.
· Refresh the data.

---

📈 Lessons Learned

· dbt is a Game-Changer: Using dbt for data modeling streamlined the entire pipeline and made it scalable and maintainable.
· Business Impact: Even a simple Pareto analysis can provide immediate business value by identifying high-value customers and products.
· AI Layer: Adding a machine learning model (Random Forest) with 85% accuracy demonstrated the potential for predictive analytics in sales forecasting.

---

📌 Data Privacy Note

The dataset used in this project is simulated and does not contain any real customer or business data. It was designed to reflect realistic sales patterns while preserving full confidentiality.

---

👩‍💻 Author

Samaneh Kavianfar
Data Analyst | Python | SQL | Power BI | dbt
LinkedIn | GitHub

---

📄 License

This project is open-source and available under the MIT License.

```
