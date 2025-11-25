-- 6. Question: For each hospital service, calculate the total number of patients admitted, total patients refused, 
-- and the admission rate (percentage of requests that were admitted). Order by admission rate descending.

-- Fetch Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- SOLUTION:
SELECT 
	SERVICE,
	SUM(PATIENTS_ADMITTED) AS Total_Patients_Admitted,
	SUM(PATIENTS_REFUSED) AS Total_Patients_Refused,
    (SUM(Patients_Admitted) * 100.0) / SUM(Patients_Request) AS Admission_Rate
FROM Services_Weekly
GROUP BY SERVICE
ORDER BY Admission_Rate DESC;

-- FLOW OF EXECUTION Of The Query.
/*
1. For each unique hospital service, it:
1.1. Counts total admitted patients (SUM(PATIENTS_ADMITTED))
1.2. Counts total refused patients (SUM(PATIENTS_REFUSED))
1.3. Calculates the admission rate as a percentage of admitted out of all requests ((admitted / requested) × 100)

Then, it sorts all services in descending order of their admission rate to show the most successful services at the top.

2. Flow of Execution
2.1. FROM Services_Weekly
The query starts by accessing all the rows in the Services_Weekly table.

2.2. GROUP BY SERVICE
Rows are grouped together by each unique value in the SERVICE column (one group for each hospital service).

2.3. SELECT & Aggregate Functions
For each group, the aggregate functions are calculated:

2.3.1. SUM(PATIENTS_ADMITTED) computes total patients admitted per service.
2.3.2. SUM(PATIENTS_REFUSED) computes total patients refused per service.
2.3.3. (SUM(Patients_Admitted) * 100.0) / SUM(Patients_Request) computes the admission rate as a percentage for each service.
2.3.4. ORDER BY Admission_Rate DESC

The results (one per service) are sorted by the computed admission rate, highest to lowest.
*/        