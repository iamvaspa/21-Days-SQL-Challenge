-- 7. Question: Identify Services That Refused More Than 100 Patients in Total and Had An Average Patient Satisfaction Below 80. Show Service Name, Total Refused, and Average Satisfaction.

-- FETCH Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- SOLUTION:
SELECT
	SERVICE,
    SUM(Patients_Refused) AS Total_Patients_Refused,
    AVG(Patient_Satisfaction) AS Average_Patient_Satisfaction
FROM Services_Weekly
GROUP BY SERVICE
HAVING Total_Patients_Refused > 100 AND Average_Patient_Satisfaction < 80;

-- FLOW of EXECUTION Of The Query:
/*
1. FROM Services_Weekly
The query begins by accessing all the rows in the Services_Weekly table.

2. GROUP BY SERVICE
Rows are grouped together by each unique value in the SERVICE column, with each group representing one service.

3. SELECT and Aggregate Functions
For each group (i.e., each unique service):

4. SUM(Patients_Refused) calculates the total number of refused patients.

5. AVG(Patient_Satisfaction) computes the average satisfaction score.

6. These results are given the aliases Total_Patients_Refused and Average_Patient_Satisfaction.

7. HAVING Clause
The grouped results are filtered:
Only include services where the total patients refused is greater than 100 and the average satisfaction is less than 80.

8. This step removes groups/services that do not meet both conditions.

9. Result (Output)
Displays the SERVICE name, total patients refused, and average satisfaction for only those services meeting the HAVING filter.

10. Summary:
The query finds services that have both a high number of patient refusals (over 100) and lower-than-desired satisfaction (below 80), returning these stats just for those service groups.
*/