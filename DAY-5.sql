-- 5. Question: Calculate the TOTAL NUMBER of PATIENTS ADMITTED, 
-- 5.1. TOTAL NUMBER of PATIENTS REFUSED, and 
-- 5.2. The AVERAGE PATIENT SATISFACTION Across All SERVICES And WEEKS. 
-- 5.3. Round The AVERAGE SATISFACTION To 2 Decimal Places.

-- FETCH Entire PATIENTS TABLE.
SELECT * FROM PATIENTS;

-- FETCH Entire Services_weekly Table.
SELECT * FROM Services_weekly;

-- Calculate The TOTAL NUMBER OF PATIENTS ADMITTED From Services_Weekly Table.
SELECT
	SUM(Patients_Admitted) AS Total_No_Of_Patients_Admitted
FROM Services_Weekly;

-- Calculate The TOTAL NUMBER OF PATIENTS REFUSED From Services_Weekly Table.
SELECT
	SUM(Patients_Refused) AS Total_No_Of_Patients_Refused
FROM Services_Weekly;

-- Calculate The AVERAGE PATIENT SATISFACTION From Services_Weekly Table.
SELECT
	AVG(Patient_Satisfaction) AS Average_Patient_Satisfaction
FROM Services_Weekly;

-- Round The AVERAGE SATISFACTION To 2 Decimal Places.
SELECT
	ROUND(AVG(Patient_Satisfaction), 2) AS Average_Satisfaction_Score
FROM Services_Weekly;

-- SOLUTION:
SELECT
	SUM(Patients_Admitted) AS Total_No_Of_Patients_Admitted,
    SUM(Patients_Refused) AS Total_No_Of_Patients_Refused,
    AVG(Patient_Satisfaction) AS Average_Patient_Satisfaction,
    ROUND(AVG(Patient_Satisfaction), 2) AS Round_Up_Decimal_Palces
FROM Services_Weekly;

-- FLOW of EXECUTION of The QUERY:
/*
1. FROM clause:
The query begins by reading all rows from the Services_Weekly table. This is the dataset on which the calculation will be performed.

2. Aggregation Functions Evaluation:
2.1. SUM(Patients_Admitted): Adds up the values in the Patients_Admitted column to find the total number of patients admitted.
2.2. SUM(Patients_Refused): Totals the values in the Patients_Refused column to find the total number of refusals.
2.3. AVG(Patient_Satisfaction): Calculates the average value in the Patient_Satisfaction column for all rows.
2.4. ROUND(AVG(Patient_Satisfaction), 2): Takes the average calculated and rounds it to two decimal places.

3. SELECT clause (Output):
Presents the aggregated and calculated values, renaming the columns with the specified AS aliases for cleaner output.

4. Logical Flow Summary
4.1. FROM: Reads all data from the Services_Weekly table.
4.2. Aggregate Functions:
4.3. Sums the admitted and refused patient counts.
4.4. Averages satisfaction scores and then rounds the average.
4.5. SELECT: Outputs the aggregated totals and averages with specified names.

5. Result:
You get a single summary row giving the total admitted, total refused, average satisfaction, and rounded average satisfaction for all records in Services_Weekly. 
*/