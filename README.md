# Bank Loan Analytics & Risk Analysis on AWS

## Project Overview

An end-to-end Bank Loan Analytics project built using AWS, SQL, Python, and Power BI to monitor loan portfolio performance, identify credit-risk patterns, and support data-driven lending decisions.

The project combines cloud-based data engineering, SQL analytics, exploratory data analysis, and interactive business reporting.

---

## Business Objective

The objective is to analyze the bank's lending portfolio and answer key business questions related to:

- Loan applications
- Funded amount
- Amount received
- Loan performance
- Default risk
- Borrower characteristics
- Regional lending activity
- Loan purpose and term performance

---

## Technology Stack

- Amazon S3
- AWS Glue
- AWS Glue Data Catalog
- Amazon Athena
- Amazon SageMaker
- Python / Pandas
- SQL
- Power BI
- GitHub

---

## End-to-End Workflow

Financial Loan CSV
        ↓
Amazon S3 – Raw Layer
        ↓
Data Profiling
        ↓
AWS Glue Visual ETL
        ↓
Data Type & Date Transformation
        ↓
S3 – Processed Layer (Parquet + Snappy)
        ↓
AWS Glue Data Catalog
        ↓
Amazon Athena
        ↓
SQL Business Analysis
        ↓
Power BI Dashboard

In parallel:

Processed Dataset
        ↓
Amazon SageMaker / Jupyter Notebook
        ↓
Python EDA & Analysis

---

## Data Engineering Workflow

### 1. Data Ingestion

The raw financial loan CSV dataset was uploaded to an Amazon S3 raw-data location.

### 2. Data Profiling

Before transformation, the dataset was profiled to understand:

- Number of rows and columns
- Data types
- Missing values
- Category distributions
- Numeric ranges
- Possible data-quality issues

### 3. AWS Glue ETL

AWS Glue Visual ETL was used to prepare the analytical dataset.

Transformations included:

- Converting date fields from text to date format
- Correcting numeric data types
- Standardizing the schema
- Writing the processed dataset in Parquet format
- Applying Snappy compression

### 4. Data Catalog

The processed dataset was registered in the AWS Glue Data Catalog so that it could be queried through Amazon Athena.

### 5. Amazon Athena

Athena was used for SQL-based KPI analysis and business analysis.

### 6. Power BI

The processed analytical dataset was connected to Power BI to create interactive dashboards for management reporting.

### 7. Amazon SageMaker / Jupyter

Python and Pandas were used for exploratory analysis, KPI validation, trend analysis, and additional analytical insights.

---

## Dashboard

### Summary

The summary dashboard contains:

- Total Loan Applications
- Total Amount Funded
- Total Amount Received
- Average Interest Rate
- Average DTI
- Good Loan KPIs
- Bad Loan KPIs
- Loan Status Analysis

### Overview

The overview dashboard contains:

- Monthly lending trends
- State-level analysis
- Loan term analysis
- Employee length analysis
- Loan purpose analysis
- Home ownership analysis

### Details

The details dashboard provides loan-level information including:

- Loan ID
- Purpose
- Grade
- Home Ownership
- Sub Grade
- Issue Date
- Funded Amount
- Interest Rate
- Installment
- Amount Received

---

## Key Business Insights

### 1. Portfolio Health

86.18% of applications are classified as Good Loans, while 13.82% are Charged Off.

### 2. Loan Growth

Loan applications increased from 2,332 in January to 4,314 in December, showing strong growth in lending activity over the year.

### 3. Portfolio Concentration

Debt Consolidation represents approximately 47% of all applications and more than 53% of the total funded amount, making it the bank's largest loan-purpose exposure.

### 4. High-Risk Purpose

Small Business loans show the highest default rate among loan purposes at approximately 25.6%, indicating an area requiring tighter credit-risk monitoring.

### 5. Grade-Based Risk

Default rates increase consistently from Grade A to Grade G. Grade A has approximately 5.7% default while Grade G exceeds 31%.

This indicates a strong relationship between loan grade and credit risk.

### 6. Year-End Growth

December recorded the highest monthly loan applications and funding in the dataset, suggesting stronger lending activity toward the end of the year.

---

## Business Recommendations

- Closely monitor Small Business lending because of its high default rate.
- Review high-risk grades before approving additional exposure.
- Monitor Debt Consolidation because of its large share of the portfolio.
- Use state-level default analysis to identify geographic risk concentration.
- Consider tighter underwriting or pricing strategies for higher-risk loan grades.
- Continue tracking monthly funding and repayment trends to identify changes in demand.

---

## Repository Structure

```text
bank-loan-analytics-aws/
│
├── data/
├── sql/
├── notebook/
├── dashboard/
├── aws/
├── docs/
└── README.md
