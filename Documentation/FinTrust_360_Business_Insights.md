# FinTrust 360 – Business Insights & Analytical Findings

## 1. Key Business Findings

Based on the verified SQL analysis and Power BI modeling of 4,975 customer complaints across financial institutions, the following key analytical findings were identified.

---

### 1. Overall Complaint Volume & Data Integrity
* A total of **4,975 unique customer complaints** were recorded and analyzed.
* The original raw dataset contained 5,000 records, from which **25 exact duplicate submissions** were removed during data cleaning, ensuring high analytical integrity.
* Out of 4,975 complaints, **4,665 complaints (93.77%)** received formal company responses, while **310 complaints (6.23%)** remained unresolved or lacked recorded company responses.

---

### 2. Monthly Complaint Trends
* Complaint volumes remained steady throughout the year, typically ranging between **350 and 433 complaints per month**.
* **May 2026** recorded the highest complaint volume with **433 complaints**, followed by March 2026 with 428 complaints and January 2026 with 408 complaints.
* February 2026 recorded the lowest full-month volume (352 complaints), while October 2026 reflects partial-month data capture (212 complaints).

---

### 3. Complaints by Financial Product
* **Credit Cards** generated the highest volume of consumer grievances with **1,191 complaints (23.94%)**.
* **Checking and Savings Accounts** ranked second with **1,054 complaints (21.19%)**.
* Together, everyday banking and revolving credit products represent **45.13% (2,245 complaints)** of all customer issues.
* Other products:
  * Credit Reporting: **906 complaints (18.21%)**
  * Personal Loans: **826 complaints (16.60%)**
  * Mortgages: **648 complaints (13.03%)**
  * Buy Now, Pay Later (BNPL): **350 complaints (7.04%)**

---

### 4. Most Frequently Reported Issues
* **Unexpected Fees** was the single most prominent complaint category, accounting for **545 complaints (10.95%)**.
* **Account Access** was the second most frequent driver with **337 complaints (6.77%)**.
* **Fraudulent Charges** ranked third with **307 complaints (6.17%)**, followed closely by:
  * Card Declined: **299 complaints (6.01%)**
  * Billing Disputes: **296 complaints (5.95%)**
  * Transaction Disputes: **285 complaints (5.73%)**
  * Account Closure: **259 complaints (5.21%)**
  * Report Access: **242 complaints (4.86%)**
  * Incorrect Information: **228 complaints (4.58%)**
  * Loan Servicing: **226 complaints (4.54%)**

---

### 5. Complaints by Company
* **Harbor Credit** received the highest number of complaints at **669 complaints (13.45%)**.
* Complaint volume across major peer institutions remained closely distributed:
  * Silverline Lending: **637 complaints (12.80%)**
  * Atlas Consumer Finance: **630 complaints (12.66%)**
  * OakBridge Services: **629 complaints (12.64%)**
  * Northstar Financial: **628 complaints (12.62%)**
  * BluePeak Bank: **618 complaints (12.42%)**
  * Cedar Finance: **602 complaints (12.10%)**
  * Summit Payments: **562 complaints (11.30%)**

---

### 6. Complaints by Customer State
* Customer complaints were widely distributed across geographic jurisdictions, led by:
  * **Illinois (IL)**: **320 complaints (6.43%)**
  * **Ohio (OH)**: **316 complaints (6.35%)**
  * **New Jersey (NJ)**: **311 complaints (6.25%)**
  * **New York (NY)**: **311 complaints (6.25%)**
  * **Virginia (VA)**: **309 complaints (6.21%)**

---

### 7. Timely Company Responses
* **84.46% of complaints (4,202 complaints)** received a timely response within statutory deadlines.
* **9.31% of complaints (463 complaints)** were untimely (delayed beyond due dates).
* **6.23% of complaints (310 complaints)** had missing response dates / remained unresolved.
*(Note: In the Power BI dashboard wired to the pre-deduplicated 5,000-record dataset, rates are 84.50% timely, 9.28% untimely, and 6.22% missing — reflecting consistent distributions across both cuts).*

---

### 8. Response Time vs. SLA Due Window (Reconciled Metrics)
A critical audit finding resolved the initial difference between SQL (15 days) and Power BI (8.76 days):
* **Actual Average Company Response Time**: **8.76 days** (Median: 8.0 days, Range: 1 to 25 days).
  * Calculated as `date_company_responded - date_received` across the **4,665 valid complaints** that received a response.
* **Statutory SLA Due Window**: **15.00 days**.
  * Calculated as `response_due_date - date_received`. Every complaint is assigned a mandatory 15-day regulatory SLA deadline.
* **Reconciliation Summary**: The initial SQL query evaluated the statutory 15-day window (`c9 - c2`). When corrected to measure actual response date (`c10 - c2`), SQL and Power BI achieve **100% mathematical alignment at 8.76 days**.

---

## 2. Strategic Business Recommendations

### 1. Optimize Credit Card Billing & Fee Transparency
* Because Credit Cards represent nearly a quarter of all complaints (1,191) and Unexpected Fees is the top issue (545 complaints), financial institutions should establish proactive disclosure before triggering fees, provide automated fee alerts, and introduce simplified dispute resolution in mobile banking apps.

### 2. Strengthen Digital Account Security & Access Workflows
* With Account Access (337) and Fraudulent Charges (307) ranking among the top three issues, institutions must streamline multi-factor authentication (MFA) resets and offer instant self-service biometric authentication to reduce false-positive lockouts.

### 3. Establish Harbor Credit Service Review
* Harbor Credit leads complaint volume with 669 filings. An immediate root-cause review of its credit card operations, fee notices, and support response workflows is recommended to bring performance in line with peer benchmarks.

### 4. Accelerate Response Turnaround for Untimely Complaints
* While the average response time is healthy at **8.76 days** (well within the 15-day SLA), **9.31% (463 complaints) breached the 15-day deadline**, and **310 complaints remained unresponded**.
* Implement automated escalation alerts at Day 10 of an open complaint to prevent SLA breaches and eliminate the 6.23% missing response rate.

### 5. Targeted Regional Customer Support
* Regional clusters in Illinois, Ohio, New Jersey, and New York represent the highest complaint densities. Regional customer care pods should be equipped to resolve localized banking issues.

---

## 3. Project Conclusion

The **FinTrust 360** analytics project demonstrates how relational SQL querying, Power BI business intelligence modeling, and rigorous data auditing combine to uncover actionable customer experience insights. 

By identifying underlying fee pain points, validating compliance timeliness (84.46%), and reconciling actual response metrics (8.76 days) against regulatory due dates (15 days), this project provides financial decision-makers with a reliable roadmap for enhancing compliance and consumer trust.
