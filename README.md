# 📊 Supply Chain Intelligence & Financial Analytics

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![Data Warehousing](https://img.shields.io/badge/Data_Warehousing-FF6F00?style=for-the-badge&logo=databricks&logoColor=white)
![Business Intelligence](https://img.shields.io/badge/Business_Intelligence-004088?style=for-the-badge)

## 📌 Project Overview
This enterprise-grade **Supply Chain Intelligence Dashboard** was developed to monitor performance, optimize operational reliability, and drive sales strategy. Designed with the rigorous analytical standards of a **Banking Dashboard** and **Financial Analytics** project, this tool provides executive leadership with a transparent view of cash flow, profit margins, and logistical bottlenecks. The project utilizes a robust back-end **SQL Data Warehouse** seamlessly integrated with a Power BI front-end.

### 🎯 Business Problem
The organization is generating substantial revenue ($33.05M) but is suffering from severe logistical inefficiencies, highlighted by a **54.82% Late Delivery Rate**. The business needed a centralized BI solution to understand how these delays impact customer satisfaction and overall financial benefit, while also tracking the performance of over 600 global sales representatives.

### 💡 Objectives
- **Data Architecture:** Build a reliable SQL Data Warehouse to centralize fragmented logistics data.
- **Financial Tracking:** Monitor total sales, profit ratios, and discount impacts across all product hierarchies.
- **Operational Efficiency:** Identify geographic and operational bottlenecks causing late shipments.
- **Salesforce Accountability:** Evaluate salesman performance based on net benefit, not just gross sales.
- **Executive Decision Making:** Provide a clean, intuitive UI/UX for quick strategic insights.

---

## 💻 Live Dashboard

View the interactive dashboard here:

👉 **[Open Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZmI5ZTg3ZWItNjBkYi00YWM4LTg0MDAtNWI4MDIyOTExZjllIiwidCI6IjJiYjZlNWJjLWMxMDktNDdmYi05NDMzLWMxYzZmNGZhMzNmZiIsImMiOjl9&pageName=b7964c50bfc5c589502f)**

---

## 🚀 Features & KPIs

### Core Financial KPIs
| Metric | Value | Description |
| :--- | :--- | :--- |
| **Total Sales** | `$33.05M` | Gross revenue generated across all global markets. |
| **Total Benefit** | `$3.97M` | Net profit contribution from completed orders. |
| **Average Profit Ratio** | `12.06%` | Overall profitability margin across the product portfolio. |
| **Total Discount** | `$3.73M` | Revenue reductions applied to drive sales volume. |

### Core Operational KPIs
| Metric | Value | Description |
| :--- | :--- | :--- |
| **Total Orders** | `66K` | Overall transaction volume. |
| **Late Delivery Rate** | `54.82%` | Percentage of orders missing their scheduled shipping window. |
| **Avg Shipping Days** | `3.50` | Average time taken to fulfill and ship customer orders. |

---

## 📂 Dashboard Pages

### 1️⃣ Executive Overview
A high-level summary of total sales, demand, benefit, and core operational reliability KPIs for executive leadership. Features a 2015 chronological sales trend and geographic market breakdowns.

### 2️⃣ Sales & Products
A deep-dive into product performance hierarchies, profitability, discount impacts, and merchandising trends. Includes a dynamic scatter plot comparing product sales versus benefit to identify underperforming inventory.

### 3️⃣ Customer & Supply Chain
Analyzes customer segment demand and supply chain delivery performance, tracking shipping days and late risks. Features a detailed Regional Supply Chain Matrix highlighting critical failure points in Central America and the Caribbean.

### 4️⃣ Salesman Performance
An accountability view of regional salesforce contributions. Tracks 603 salesmen, cross-referencing their gross sales volume against the actual financial benefit they generated and their personal late delivery rates.

---

## 🛠️ Data Engineering & Architecture

### 🗄️ SQL Data Warehouse
Before visualizing the data, a centralized Data Warehouse was engineered using **SQL** to ensure data integrity and performance.
- Extracted and staged raw operational tables.
- Wrote SQL views and stored procedures to handle complex joins between customer, product, and geographic data.
- Built a highly optimized **Gold-layer Star Schema** directly in the data warehouse, ensuring rapid filter context evaluation upon import into Power BI.
  - **Fact Table:** `FactOrders`
  - **Dimension Tables:** `DimCustomers`, `DimProducts`, `DimSalesman`, `DimDate`

### 🧹 Power Query Steps
- Standardized localized date formats into a unified `DimDate` table.
- Cleansed remaining text anomalies (Trim, Clean, Capitalize).
- Assigned semantic data types to all financial currency columns to ensure aggregation accuracy.

### 🧮 DAX Measures (Examples)
Advanced DAX was utilized for time intelligence, dynamic titles, and ratio calculations.
- `Total Benefit = SUM(FactOrders[Benefit])`
- `Late Delivery Rate = DIVIDE(CALCULATE([Total Orders], FactOrders[Delivery_Status] = "Late Delivery"), [Total Orders], 0)`
- `Average Profit Ratio = AVERAGE(FactOrders[Profit_Ratio])`

---

## 🎨 UX/UI & Color Theme
The dashboard utilizes a professional, executive-friendly design language to minimize cognitive load.
- **Primary (Sales/Navigation):** `#1F4E79` (Navy Blue)
- **Secondary (Benefit/Success):** `#2E8B57` (Sea Green)
- **Warning (Late Deliveries):** `#E67E22` (Orange)
- **Negative (Cancellations):** `#C0392B` (Red)
- **Background:** Clean `#F5F7FA` with stark `#FFFFFF` rounded visual containers and subtle drop shadows.

---

## 📈 Insights & Business Value
1. **The Delivery Crisis:** With a 54.82% late delivery rate, the supply chain is heavily strained. Specifically, regions like Central Africa (57.89%) and Central America (55.66%) require immediate logistical auditing.
2. **Profitability vs. Volume:** While the business generates $33M in sales, discounts total $3.7M, eating heavily into the 12% profit ratio. Pricing strategies in the "Apparel" and "Fan Shop" departments need optimization.
3. **Salesforce Efficiency:** Top performers like Michael Williams ($103K Benefit) vastly outperform the median, but the "Low Benefit Warnings" chart identifies specific representatives generating high volume but negligible profit.

---

## 🧠 Lessons Learned
- **End-to-End Pipeline Creation:** Building the SQL Data Warehouse before connecting Power BI vastly improved performance and made DAX calculations much simpler.
- **Handling Granularity:** Balancing line-item order data with high-level executive summaries required strict adherence to Star Schema principles.
- **UX Matters:** Transitioning from a "default" Power BI look to an enterprise-grade UI completely changed how the data narrative is perceived by end-users.

## 🔮 Future Improvements
- Integrate incremental refresh for live supply-chain tracking.
- Add predictive analytics (Python/R integration) to forecast late delivery probabilities before they occur.
- Embed Row-Level Security (RLS) so regional managers only see their respective territories.

---
### 👨‍💻 Author
**Mohamed Samir Hamed** 
Data Analyst | Computer Science Undergraduate
*Specializing in SQL Data Warehousing, BI Architecture, and Financial Analytics.*
