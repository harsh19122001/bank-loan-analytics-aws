SELECT * FROM finance_loan LIMIT 10;

-- KPI's

-- Total Amount Applications
SELECT 
      COUNT(id) AS Total_Applications 
FROM finance_loan;

-- MTD Loan Applications
SELECT
      COUNT(id) AS Total_Applications
FROM finance_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Loan Applications
SELECT 
      COUNT(id) AS Total_Applications
FROM finance_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Total Funded Amount
SELECT 
      SUM(loan_amount) AS Total_Funded_Amount 
FROM finance_loan;

-- MTD Total Funded Amount
SELECT
      SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM finance_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Total Funded Amount
SELECT
      SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM finance_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Total Amount Received
SELECT 
      SUM(total_payment) AS Total_Amount_Collected
FROM finance_loan;

-- MTD Total Amount Received
SELECT SUM(total_payment) AS MTD_Total_Amount_Collected 
FROM finance_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Total Amount Received
SELECT 
SUM(total_payment) AS PMTD_Total_Amount_Collected
FROM finance_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Average Interest Rate
SELECT 
       AVG(int_rate)*100 AS Avg_Int_Rate
FROM finance_loan;

-- MTD Average Interest Rate
SELECT 
      AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
FROM finance_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average Interest
SELECT 
      AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
FROM finance_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- AVG dTI 
SELECT 
      AVG(dTI) AS Avg_DTI 
FROM finance_loan;

-- MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI 
FROM finance_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI 
FROM finance_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- GOOD LOAN ISSUED

-- Good Loan Percentage
SELECT 
      (count(CASE 
                  WHEN loan_status = 'Fully Paid' OR loan_status = 'Current'
                  THEN id 
             END)*100.0) / 
             COUNT(id) AS Good_Loan_Percentage
FROM finance_loan;

-- Good Loan Applications
SELECT 
      COUNT(id) AS Good_Loan_Applications 
FROM finance_loan 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';
                  
-- Good Loan Funded Amount
SELECT 
      SUM(loan_amount) AS Good_Loan_Funded_Amount 
FROM finance_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';
    
-- Good Loan Amount Received
SELECT 
      SUM(total_Payment) AS Good_Loan_Amount_Received
FROM finance_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- BAD LOAN ISSUED

-- Bad Loan Percentage
SELECT 
      (COUNT(CASE
                  WHEN loan_status = 'Charged Off'
                  THEN id
             END)*100.0) / COUNT(id) AS Bad_Loan_Percentage
FROM finance_loan;

-- Bad Loan Applications
SELECT 
      COUNT(id) AS Bad_Loan_Applications 
FROM finance_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT 
      SUM(loan_amount) AS Bad_Loan_Funded_Amount 
FROM finance_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT 
      SUM(total_payment) AS Bad_Loan_Amount_Received 
FROM finance_loan
WHERE loan_status = 'Charged Off'

-- LOAN loan_status
SELECT 
      loan_status,
      COUNT(id) AS LoanCount,
      SUM(total_payment) AS Total_Funded_Amount,
      SUM(loan_amount) AS Total_Funded_Amount,
      AVG(int_rate * 100) AS Interest_Rate,
      AVG(dti * 100) AS DTI
FROM finance_loan
GROUP BY 
        loan_status;
        
-- MTD loan_status
SELECT 
      loan_status,
      SUM(total_payment) AS MTD_Total_Amount_Received,
      SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM finance_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status;

-- B.	BANK LOAN REPORT | OVERVIEW
-- MONTH
SELECT   
      MONTH(issue_date) AS Month_Number,
      FORMAT_DATETIME(CAST(issue_date AS timestamp), 'MMM') AS Month_Name,
      COUNT(id) AS Total_Funded_Amount,
      SUM(loan_Amount) AS Total_Funded_Amount,
      SUM(total_payment) AS MTD_Total_Amount_Received
FROM finance_loan
GROUP BY MONTH(issue_date),FORMAT_DATETIME(CAST(issue_date AS timestamp), 'MMM')
ORDER BY COUNT(id) DESC;

-- STATE 
SELECT 
      address_state AS State,
      COUNT(id) AS Total_Loan_Applications,
      SUM(loan_amount) AS Total_Funded_Amount,
      SUM(total_payment) AS Total_Amount_Received
FROM finance_loan
GROUP BY address_state
ORDER BY COUNT(id) DESC;
    
-- TERM 
SELECT 
      term AS Term,
      COUNT(id) AS Total_Loan_Applications,
      SUM(loan_amount) AS Total_Funded_Amount,
      SUM(total_payment) AS Total_Amount_Received
FROM finance_loan
GROUP BY term 
ORDER BY COUNT(id) DESC;

-- EMPLOYEE LENGTH
SELECT 
      emp_length AS Employee_Length,
      COUNT(id) AS Total_Loan_Applications,
      SUM(loan_amount) AS Total_Funded_Amount,
      SUM(total_payment) AS Total_Amount_Received
FROM finance_loan
GROUP BY emp_length
ORDER BY COUNT(id) DESC;

-- PURPOSE
SELECT 
      purpose,
      COUNT(id) AS Total_Loan_Applications,
      SUM(loan_amount) AS Total_Funded_Amount,
      SUM(total_payment) AS Total_Amount_Received
FROM finance_loan
GROUP BY purpose
ORDER BY COUNT(id) DESC;

-- HOME OWNERSHIP
SELECT 
	home_ownership 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM finance_loan
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;

-- Grade
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM finance_loan
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY purpose
ORDER BY purpose;
SELECT * FROM finance_loan;
