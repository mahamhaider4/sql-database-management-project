# SQL Database Management Project

A complete relational database system designed for a consulting business as part of the **Database Management (MIS 370)** course at **DePaul University**.  
The project demonstrates database design, optimization, and SQL reporting using **Microsoft SQL Server** and **Microsoft Visio**.

## Tools & Technologies
- **Microsoft SQL Server Management Studio (SSMS)** – for schema creation, data population, and SQL queries  
- **Microsoft Visio** – for Entity-Relationship Diagram (ERD) and 3NF Relational Schema design  
- **SQL** – to create, normalize, and query data  
- **GitHub** – to document and version-control the project

## Project Deliverables
- **Entity-Relationship Diagram (ERD)** – designed in Visio to model entities and relationships  
- **3NF Relational Schema** – demonstrates normalization to eliminate redundancy  
- **SQL Code** – includes DDL (table creation) and DML (data insertion) scripts  
- **10 Analytical Reports** – queries answering business questions with joins, grouping, and filtering  
- **Project Documentation (PDF)** – full write-up and rationale for design choices  
   📄 [Download Final Project Report (PDF)](SQL%20Database%20Management%20Project.pdf)

---

## Entity-Relationship Diagram (ERD)
![ERD Diagram](diagrams/ERD_Diagram.png)

---

## 3NF Relational Schema

The database was normalized to **Third Normal Form (3NF)** to eliminate redundancy and maintain referential integrity.

![3NF Relational Schema Diagram](diagrams/3NF_Relational_Schema.png)

---

## 3NF Relational Schema
![3NF Relational Schema](diagrams/3NF_Relational_Schema.png)

### Text Version
```sql
CLIENT(CLIENT_ID, CLIENT_FNAME, CLIENT_LNAME, CLIENT_MINITIAL, REGION_ID, ADDRESS, CITY, STATE, ZIP_CODE, CLIENT_SSN, EMAIL, PHONE)

CONTRACT(CONTRACT_ID, CLIENT_ID, CONTRACT_START, CONTRACT_END, CONTRACT_AMOUNT)

REGION(REGION_ID, REGION_NAME)

CONSULTANT(CONSULTANT_ID, CONSULTANT_FNAME, CONSULTANT_LNAME, CONSULTANT_MINITIAL, REGION_ID, CONSULTANT_EXPERIENCE, CONSULTANT_SSN, PHONE, EMAIL)

CLASS(CLASS_ID, CLASS_NAME)

CONTRACT_CONSULTANT(CONTRACT_ID, CONSULTANT_ID)
CONTRACT_CLASS(CONTRACT_ID, CLASS_ID)
CONSULTANT_CLASS(CONSULTANT_ID, CLASS_ID)

```

## SQL Reports
Below are 10 example reports generated from the Consulting Database project.

| Report | Screenshot |
|--------|-------------|
| **Report 1:** Consultants Contact Directory | <img src="reports/SQL%20Project%20Query%201.png" width="350"> |
| **Report 2:** Clients Registry | <img src="reports/SQL%20Project%20Query%202.png" width="350"> |
| **Report 3:** Contracts Overview | <img src="reports/SQL%20Project%20Query%203.png" width="350"> |
| **Report 4:** Clients vs Consultants by Region | <img src="reports/SQL%20Project%20Query%204.png" width="350"> |
| **Report 5:** Consultants by Region and Class | <img src="reports/SQL%20Project%20Query%205.png" width="350"> |
| **Report 6:** Active vs Completed Contracts | <img src="reports/SQL%20Project%20Query%206.png" width="350"> |
| **Report 7:** Revenue by Region | <img src="reports/SQL%20Project%20Query%207.png" width="350"> |
| **Report 8:** Average Consultant Experience | <img src="reports/SQL%20Project%20Query%208.png" width="350"> |
| **Report 9:** Contracts per Class | <img src="reports/SQL%20Project%20Query%209.png" width="350"> |
| **Report 10:** Consultant-Class Assignments | <img src="reports/SQL%20Project%20Query%2010.png" width="350"> |


## How to Run the Project
1. Open **Microsoft SQL Server Management Studio (SSMS)**.  
2. Create a new database (e.g., `ConsultingDB`).  
3. Execute the schema and data scripts from `reports/SQL_Reports.sql`.  
4. Run the 10 report queries to reproduce the screenshots shown above.  
5. (Optional) View the ERD and 3NF Schema diagrams in **Microsoft Visio**.
