-- 4. Question: Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. Display only these 5 records.

-- FETCH PATIENTS Table Data.
SELECT
	*
FROM PATIENTS;

-- FETCH Only Selected Columns Such as PATIENT_ID, NAME, SERVICE and SATISFACTION Score.
SELECT
	PATIENT_ID, NAME, SERVICE, SATISFACTION
FROM PATIENTS;

-- SORT The PATIENTS DATA Based On SATISFACTION SCORE.
SELECT
	PATIENT_ID, NAME, SERVICE, SATISFACTION
FROM PATIENTS
ORDER BY SATISFACTION DESC;

-- FETCH The 3rd To 7th HIGHEST PATIENT SATISFACTIO SCORES Using LIMIT and OFFSET.
SELECT
	PATIENT_ID, NAME, SERVICE, SATISFACTION
FROM PATIENTS
ORDER BY SATISFACTION DESC
LIMIT 5 OFFSET 2;

-- FLOW of Execution Of The Query:
/*
1. FROM clause:
The query begins by reading all rows from the PATIENTS table.

2. SELECT clause:
Selects columns: PATIENT_ID, NAME, SERVICE, SATISFACTION for each row.

3. ORDER BY clause:
Sorts all the rows in the table by SATISFACTION score, in descending order (highest satisfaction first).

4. OFFSET clause:
Skips the first 2 rows from the sorted result.

5. LIMIT clause:
Returns the next 5 rows (i.e., rows 3 through 7 in the sorted order).

6. Logical Execution Order:
6.1. FROM.
6.2. SELECT.
6.3. ORDER BY.
6.4. OFFSET.
6.5. LIMIT.

The result will show the 3rd through 7th most satisfied patients, with columns for their Patient_ID, name, service, and satisfaction score.
*/