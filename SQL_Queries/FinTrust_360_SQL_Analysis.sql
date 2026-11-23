-- =====================================================================
-- FinTrust 360: Financial Customer Complaints & Response Analytics
-- Database: SQLite / SQLite Online
-- Table: fintrust_complaints
-- 
-- Positional Column Mapping Reference (Cleaned_Financial_Complaints):
-- c1:  complaint_id               (Unique Complaint Identifier)
-- c2:  date_received              (Date complaint submitted by customer)
-- c3:  financial_product          (Product line e.g., Credit card)
-- c4:  issue_category             (Primary complaint issue)
-- c5:  issue_detail               (Detailed issue breakdown)
-- c6:  company_name               (Financial institution name)
-- c7:  state                      (Customer state / location)
-- c8:  submission_channel         (Web, Phone, Mail, Referral)
-- c9:  response_due_date          (15-day statutory SLA deadline)
-- c10: date_company_responded     (Actual date company responded)
-- c11: response_status            (Status e.g., Closed)
-- c12: company_response           (Explanation, Monetary relief, etc.)
-- c13: timely_response            (Yes, No, or NULL)
-- c14: short_complaint_summary    (Customer narrative summary)
-- =====================================================================

-- ---------------------------------------------------------------------
-- PART 1: Sequential Queries Aligned with Screenshots (01 to 09)
-- ---------------------------------------------------------------------

-- Query 01 (Screenshot: 01_Total_Complaints.png)
-- Total Number of Complaints
-- Result: 4,975 complaints
SELECT COUNT(*) AS total_complaints
FROM fintrust_complaints;


-- Query 02 (Screenshot: 02_Monthly_Trends.png)
-- Monthly Complaint Trends
-- Peak: May 2026 (433 complaints)
SELECT
    substr(c2, 1, 7) AS complaint_month,
    COUNT(*) AS total_complaints
FROM fintrust_complaints
GROUP BY complaint_month
ORDER BY complaint_month;


-- Query 03 (Screenshot: 03_Complaints_By_Product.png)
-- Complaints by Financial Product
-- Top Product: Credit card (1,191 complaints - 23.94%)
SELECT
    c3 AS product,
    COUNT(*) AS total_complaints
FROM fintrust_complaints
GROUP BY c3
ORDER BY total_complaints DESC;


-- Query 04 (Screenshot: 04_Top_Complaint_Issues.png)
-- Most Frequently Reported Issues (Top 10)
-- Top Issue: Unexpected fees (545 complaints - 10.95%)
SELECT
    c4 AS issue,
    COUNT(*) AS total_complaints
FROM fintrust_complaints
GROUP BY c4
ORDER BY total_complaints DESC
LIMIT 10;


-- Query 05 (Screenshot: 05_Complaints_By_Company.png)
-- Complaints by Company
-- Verified & Corrected: c6 = company_name (previously mistyped as c10)
-- Top Company: Harbor Credit (669 complaints - 13.45%)
SELECT
    c6 AS company,
    COUNT(*) AS total_complaints
FROM fintrust_complaints
GROUP BY c6
ORDER BY total_complaints DESC;


-- Query 06 (Screenshot: 06_Complaints_By_State.png)
-- Complaints by Customer State
-- Top State: Illinois (IL) (320 complaints - 6.43%)
SELECT
    c7 AS state,
    COUNT(*) AS total_complaints
FROM fintrust_complaints
GROUP BY c7
ORDER BY total_complaints DESC;


-- Query 07 (Screenshot: 07_Timely_Response.png)
-- Timely Response Distribution
-- Results: Yes = 84.46% (4,202), No = 9.31% (463), Missing = 6.23% (310)
SELECT
    c13 AS timely_response,
    COUNT(*) AS total_complaints,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fintrust_complaints), 2
    ) AS percentage
FROM fintrust_complaints
GROUP BY c13;


-- Query 08 (Screenshot: 08_Average_Response_Time.png)
-- Actual Average Response Time (Days) vs Statutory SLA Window
-- Verified & Corrected: c10 = date_company_responded, c2 = date_received, c9 = response_due_date
-- Results: valid_response_pairs = 4,665 | average_response_time_days = 8.76 | statutory_sla_window_days = 15.0
SELECT
    COUNT(*) AS valid_response_pairs,
    ROUND(
        AVG(julianday(c10) - julianday(c2)), 2
    ) AS average_response_time_days,
    ROUND(
        AVG(julianday(c9) - julianday(c2)), 2
    ) AS statutory_sla_window_days
FROM fintrust_complaints
WHERE c2 IS NOT NULL
AND c10 IS NOT NULL;


-- Query 09 (Screenshot: 09_Data_Verification.png)
-- Verify Complaint Records (Data Verification)
SELECT *
FROM fintrust_complaints
LIMIT 5;


-- ---------------------------------------------------------------------
-- PART 2: Production Standard SQL Queries (Using Named Columns)
-- ---------------------------------------------------------------------

-- 1. Total Complaints:
-- SELECT COUNT(complaint_id) AS total_complaints FROM fintrust_complaints -

-- 2. Complaints by Financial Product:
-- SELECT financial_product, COUNT(*) AS complaint_count
-- FROM fintrust_complaints
-- GROUP BY financial_product
-- ORDER BY complaint_count DESC -

-- 3. Complaints by Company:
-- SELECT company_name, COUNT(*) AS complaint_count
-- FROM fintrust_complaints
-- GROUP BY company_name
-- ORDER BY complaint_count DESC -

-- 4. Timely Response Rate Breakdown:
-- SELECT 
--     COALESCE(timely_response, 'Missing') AS timely_status,
--     COUNT(*) AS total_count,
--     ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fintrust_complaints), 2) AS pct
-- FROM fintrust_complaints
-- GROUP BY timely_response -

-- 5. Actual Response Time vs SLA Window:
-- SELECT
--     COUNT(*) AS valid_response_pairs,
--     ROUND(AVG(julianday(date_company_responded) - julianday(date_received)), 2) AS avg_actual_response_days,
--     ROUND(AVG(julianday(response_due_date) - julianday(date_received)), 2) AS avg_sla_due_window_days
-- FROM fintrust_complaints
-- WHERE date_received IS NOT NULL AND date_company_responded IS NOT NULL -
