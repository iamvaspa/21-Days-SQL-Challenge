-- 2. Question: Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.

-- PATIENTS Table.
SELECT * FROM Patients;

-- SOLUTION:
SELECT
	Patient_ID, Name, Age, Satisfaction
FROM PATIENTS
WHERE Service = 'Surgery' AND Satisfaction < 70;

-- Flow Of Execution For The Above SQL Query:
/*
1. FROM clause

The query begins by accessing the PATIENTS table and reading all its rows.

2. WHERE clause

It then applies the filter: only those rows where Satisfaction is less than 70 are selected.

All other rows are excluded from further processing.

3. SELECT clause

From the filtered results, it selects the columns: Patient_ID, Name, Age, and Satisfaction for each row.

4. Summary of Logical Execution Order:

FROM (read the table)

WHERE (apply the filter criterion)

SELECT (choose the columns to output)

Result:
You get a list of patient IDs, names, ages, and satisfaction scores for all patients whose satisfaction score is below 70.
*/

-- MY LEARNING:
/*
1. Filtering Data with WHERE Clause:
Learnt how to extract only those records that meet a specific condition—in this case, patients with a satisfaction score below 70.

2. Selecting Multiple Columns:
The query shows how to choose and display more than one column from a table.
*/