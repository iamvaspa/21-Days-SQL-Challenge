-- 1. Question: List all unique hospital services available in the hospital.

-- SERVICES WEEKLY Table.
SELECT * FROM Services_Weekly;

-- SOLUTION:
SELECT
	DISTINCT Service
FROM Services_Weekly;

-- Flow Of Execution For The Above SQL Query:
/* 
1. FROM Clause
The query starts by reading the data source Services_Weekly. All rows from this table are accessed.

2. SELECT Clause
The Service column is extracted from every row in the table.

3. DISTINCT keyword
Duplicate values in the Service column are removed.

4. RESULT:
The result is a list of unique service names found in the table.

5. Summary:
1. Read all rows from Services_Weekly.
2. Pick the Service column values.
3. Deduplicate results so each unique service appears only once in the output.

6. Order of logical execution:
FROM
SELECT
DISTINCT
*/

-- MY LEARNING.
/*
1. How to Retrieve Unique Values:
The DISTINCT keyword ensures you get only unique entries from a column, removing duplicates from the results.

2. Column Selection:
The query demonstrates how to select a specific field (here, Service) from a table.

3. Basic Query Structure:
You learn the foundational SQL structure: SELECT ... FROM ... for retrieving data.

4. Data Exploration:
This query is commonly used to understand the diversity or types of services available in the Services_Weekly table. 
It gives you an overview of all unique hospital services recorded in that dataset.
*/