/* ============================================================
   SQL_Reports.sql
   Description: This file contains 10 SQL reports for the 
   Consulting Database Project (DePaul University - MIS 370)
   ============================================================ */


/* ------------------------------------------------------------
   Report 1: Consultants Contact Directory
   Purpose: Lists all consultants and their contact information 
   so managers can easily reach staff members.
-------------------------------------------------------------*/
SELECT CONSULTANT_ID, CONSULTANT_LNAME, CONSULTANT_FNAME, CONSULTANT_PHONE, CONSULTANT_EMAIL
FROM CONSULTANT
ORDER BY CONSULTANT_LNAME;


/* ------------------------------------------------------------
   Report 2: Clients Registry
   Purpose: Displays all clients and their contact information 
   for administrative reference.
-------------------------------------------------------------*/
SELECT CLIENT_ID, CLIENT_LNAME, CLIENT_FNAME, CLIENT_PHONE, CLIENT_EMAIL
FROM CLIENT
ORDER BY CLIENT_LNAME;


/* ------------------------------------------------------------
   Report 3: Contracts Overview
   Purpose: Shows all active and completed contracts, including 
   the client, consultant, and contract status.
-------------------------------------------------------------*/
SELECT CONTRACT_ID, CLIENT_ID, CONSULTANT_ID, CONTRACT_DATE, CONTRACT_STATUS
FROM CONTRACT
ORDER BY CONTRACT_DATE DESC;


/* ------------------------------------------------------------
   Report 4: Clients vs Consultants by Region
   Purpose: Compares the number of clients and consultants per 
   region to identify staffing balance.
-------------------------------------------------------------*/
SELECT R.REGION_NAME, 
       COUNT(DISTINCT C.CLIENT_ID) AS Total_Clients, 
       COUNT(DISTINCT T.CONSULTANT_ID) AS Total_Consultants
FROM REGION R
LEFT JOIN CLIENT C ON R.REGION_ID = C.REGION_ID
LEFT JOIN CONSULTANT T ON R.REGION_ID = T.REGION_ID
GROUP BY R.REGION_NAME;


/* ------------------------------------------------------------
   Report 5: Consultants by Region and Class
   Purpose: Shows how consultants are distributed across 
   regions and their assigned class.
-------------------------------------------------------------*/
SELECT R.REGION_NAME, CL.CLASS_NAME, COUNT(*) AS Consultant_Count
FROM CONSULTANT T
JOIN REGION R ON T.REGION_ID = R.REGION_ID
JOIN CLASS CL ON T.CLASS_ID = CL.CLASS_ID
GROUP BY R.REGION_NAME, CL.CLASS_NAME
ORDER BY R.REGION_NAME;


/* ------------------------------------------------------------
   Report 6: Active vs Completed Contracts
   Purpose: Counts how many contracts are currently active 
   versus completed for operational tracking.
-------------------------------------------------------------*/
SELECT CONTRACT_STATUS, COUNT(*) AS Total_Contracts
FROM CONTRACT
GROUP BY CONTRACT_STATUS;


/* ------------------------------------------------------------
   Report 7: Revenue by Region
   Purpose: Summarizes total contract revenue for each region 
   to assist in performance evaluation.
-------------------------------------------------------------*/
SELECT R.REGION_NAME, SUM(CONTRACT_AMOUNT) AS Total_Revenue
FROM CONTRACT C
JOIN REGION R ON C.REGION_ID = R.REGION_ID
GROUP BY R.REGION_NAME
ORDER BY Total_Revenue DESC;


/* ------------------------------------------------------------
   Report 8: Average Consultant Experience
   Purpose: Calculates average years of experience for all 
   consultants to help with resource planning.
-------------------------------------------------------------*/
SELECT AVG(CONSULTANT_YEARS_EXPERIENCE) AS Avg_Experience
FROM CONSULTANT;


/* ------------------------------------------------------------
   Report 9: Contracts per Class
   Purpose: Shows how many contracts are associated with each 
   consultant class.
-------------------------------------------------------------*/
SELECT CL.CLASS_NAME, COUNT(C.CONTRACT_ID) AS Contracts_Count
FROM CONTRACT C
JOIN CONSULTANT T ON C.CONSULTANT_ID = T.CONSULTANT_ID
JOIN CLASS CL ON T.CLASS_ID = CL.CLASS_ID
GROUP BY CL.CLASS_NAME
ORDER BY Contracts_Count DESC;


/* ------------------------------------------------------------
   Report 10: Consultant-Class Assignments
   Purpose: Lists each consultant with their assigned class 
   and specialization for quick reference.
-------------------------------------------------------------*/
SELECT T.CONSULTANT_LNAME, T.CONSULTANT_FNAME, CL.CLASS_NAME, CL.CLASS_DESCRIPTION
FROM CONSULTANT T
JOIN CLASS CL ON T.CLASS_ID = CL.CLASS_ID
ORDER BY T.CONSULTANT_LNAME;
