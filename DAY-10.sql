-- 10. Question: Create a Service Performance Report Showing Service Name, Total Patients Admitted, and a Performance Category Based on The Following: 
-- 'Excellent' if AVG_SATISFACTION >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by AVERAGE SATISFACTION DESCENDING.

-- FETCH Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- SOLUTION:
SELECT
	SERVICE,
    SUM(Patients_Admitted) AS Total_Patients_Admitted,
    ROUND(AVG(Patient_Satisfaction), 2) AS Average_Satisfaction,
    CASE
		WHEN AVG(Patient_Satisfaction) >= 85 THEN 'EXCELLENT'
        WHEN AVG(Patient_Satisfaction) >= 75 THEN 'GOOD'
        WHEN AVG(Patient_Satisfaction) >= 65 THEN 'FAIR'
        ELSE 'Needs Improvement'
	END AS 'Performance Category'
FROM 
	Services_Weekly
GROUP BY 
	SERVICE
ORDER BY AVG(Patient_Satisfaction) DESC;