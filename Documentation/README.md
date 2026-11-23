# FinTrust 360 – Financial Customer Complaints & Response Analytics


## 1. Project Overview

**FinTrust 360** is a comprehensive Data Analytics internship capstone project designed to analyze consumer financial complaints, regulatory compliance, and institutional response performance.

The project leverages **SQL** (relational queries and aggregations) and **Microsoft Power BI** (interactive visual dashboard and DAX KPI metrics) to uncover complaint drivers, evaluate institutional response efficiency, and verify data integrity across the complaint lifecycle.

---

## 2. Project Objectives

- Verify and clean customer complaints dataset (deduplication and format standardization).
- Analyze overall complaint volumes and monthly filing trends.
- Identify the most frequently reported financial products and root-cause issue categories.
- Benchmark complaint distribution across financial institutions.
- Map complaint density across customer states.
- Evaluate company response timeliness (timely, untimely, and missing responses).
- Reconcile and calculate the actual company response time vs. regulatory SLA due windows.

---

## 3. Dataset Description

The analysis is based on financial complaints data structured across 14 standardized attributes:

1. `complaint_id`: Unique alphanumeric complaint reference.
2. `date_received`: Submission date by the customer (`YYYY-MM-DD`).
3. `financial_product`: Financial product/service involved.
4. `issue_category`: High-level complaint category.
5. `issue_detail`: Granular issue description.
6. `company_name`: Target financial institution.
7. `state`: Customer location (U.S. state code).
8. `submission_channel`: Intake channel (Web, Phone, Mail, Referral).
9. `response_due_date`: Statutory 15-day regulatory SLA deadline.
10. `date_company_responded`: Actual response date from the company.
11. `response_status`: Case closure status.
12. `company_response`: Resolution outcome (Explanation, Monetary relief, etc.).
13. `timely_response`: Binary timeliness flag (`Yes` / `No` / `NULL`).
14. `short_complaint_summary`: Executive narrative summary.

* Both the raw dataset (`Original_Financial_Complaints.csv`) and cleaned dataset (`Cleaned_Financial_Complaints.csv`) are maintained in the `Dataset/` folder, with original untouched copies in `Backups_Original/`.

---

## 4. Tools and Technologies Used

- **SQL / SQLite**: Data filtering, grouping, date difference arithmetic, and aggregations.
- **Microsoft Power BI**: Interactive KPI cards, clustered bar charts, monthly trend lines, and slicers.
- **Python (pandas & sqlite3)**: Data validation, date arithmetic verification, and automated audits.
- **Markdown**: Comprehensive project reporting and documentation.

---

## 5. SQL Analysis Performed

The SQL script (`SQL_Queries/FinTrust_360_SQL_Analysis.sql`) performs the following analytical queries:

1. **Total Number of Complaints**: Total volume of customer grievances.
2. **Data Verification**: Record inspection and schema validation.
3. **Monthly Complaint Trends**: Time-series complaint volume across observation months.
4. **Complaints by Financial Product**: Distribution across banking, credit, loan, and BNPL products.
5. **Top Complaint Issues**: Ranking of the top 10 most common customer issues.
6. **Complaints by Company**: Institutional benchmark (verified using company name `c6`).
7. **Complaints by Customer State**: Geographic concentration of filings.
8. **Timely Response Distribution**: Proportions of timely, untimely, and missing responses.
9. **Actual Average Response Time**: Mean days to respond (`date_company_responded - date_received`, verified using `c10 - c2`).
10. **Statutory SLA Due Window**: Regulatory deadline benchmark (`response_due_date - date_received`, `c9 - c2`).

---

## 6. Key Verified Findings

* **Total Complaints Analyzed**: **4,975** unique complaints (25 exact duplicates removed from 5,000 raw rows).
* **Valid Responded Complaints**: **4,665** records (310 complaints unresolved / missing response).
* **Actual Average Response Time**: **8.76 days** (Median: 8.0 days, Range: 1 to 25 days).
* **Statutory SLA Response Window**: **15.00 days** (standard regulatory due window).
* **Response Timeliness Breakdown (Cleaned Dataset)**:
  * Timely Responses: **84.46%** (4,202 complaints)
  * Untimely Responses: **9.31%** (463 complaints)
  * Missing Responses: **6.23%** (310 complaints)
  *(Note: Power BI dashboard displays 84.50% timely, 9.28% untimely, and 6.22% missing as it references the pre-deduplicated 5,000-row table).*
* **Peak Complaint Month**: **May 2026** (433 complaints).
* **Top Financial Product**: **Credit Card** (1,191 complaints; 23.94%).
* **Top Issue Category**: **Unexpected Fees** (545 complaints; 10.95%).
* **Company with Highest Complaints**: **Harbor Credit** (669 complaints; 13.45%).
* **Top Complaint State**: **Illinois (IL)** (320 complaints; 6.43%).

---

## 7. Analytical Audit & Discrepancy Resolution

### 15 Days vs. 8.76 Days Explained:
* **Initial Observation**: SQL reported 15 days while Power BI reported 8.76 days.
* **Audit Finding**: In the initial SQL query, column `c9` (`response_due_date`) was used instead of `c10` (`date_company_responded`). Since `response_due_date` is uniformly set to `date_received + 15 days`, the SQL query was measuring the **regulatory deadline window** (15 days), while Power BI measured the **actual response duration** (8.76 days).
* **Resolution**: Updating the SQL query to calculate `c10 - c2` across non-null response records aligned both tools to **8.76 days across 4,665 records**.

---

## 8. Strategic Business Recommendations

1. **Credit Card Fee Transparency**: Institute upfront fee notifications and simplified dispute resolution to curb the 1,191 credit card issues and 545 fee grievances.
2. **Digital Security Workflows**: Enhance MFA recovery and transaction authentication to mitigate account access (337) and fraud complaints (307).
3. **Harbor Credit Action Plan**: Deploy targeted service audits on Harbor Credit to address its top grievance share (669 complaints).
4. **Escalation Trigger at Day 10**: Prevent SLA breaches and eliminate the 6.23% missing responses by notifying case managers when a complaint reaches 10 days of inactivity.
5. **Regional Support Focus**: Tailor resolution workflows in high-volume states (Illinois, Ohio, New Jersey, and New York).

---

## 9. Project Directory Structure

```text
FinTrust_360/
│
├── Dataset/
│   ├── Original_Financial_Complaints.csv
│   └── Cleaned_Financial_Complaints.csv
│
├── SQL_Queries/
│   └── FinTrust_360_SQL_Analysis.sql
│
├── SQL_Screenshots/
│   ├── 01_Total_Complaints.png
│   ├── 02_Monthly_Trends.png
│   ├── 03_Complaints_By_Product.png
│   ├── 04_Top_Complaint_Issues.png
│   ├── 05_Complaints_By_Company.png
│   ├── 06_Complaints_By_State.png
│   ├── 07_Timely_Response.png
│   ├── 08_Average_Response_Time.png
│   └── 09_Data_Verification.png
│
├── Documentation/
│   ├── FinTrust_360_Business_Insights.md
│   └── README.md
│
├── Backups_Original/
│   ├── Original_Financial_Complaints.csv.csv
│   ├── Cleaned_Financial_Complaints.csv.csv
│   ├── FinTrust_360_SQL_Analysis.sql
│   ├── FinTrust_360_Business_Insights.md.md
│   └── README.md.md
│
└── Fintrust 360 Dashboard.pbix
```

---

## 10. Conclusion

FinTrust 360 demonstrates robust data analytics execution, cross-platform validation, and business insight delivery. By identifying and resolving subtle data definition discrepancies between SQL and Power BI, the project provides verified, high-confidence intelligence to improve consumer satisfaction and compliance outcomes.

## Dashboard Preview

![FinTrust 360 Dashboard](Documentation/FinTrust_360_Dashboard.png)
