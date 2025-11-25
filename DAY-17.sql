/* Day - 17. Question: CREATE a REPORT Showing Each Service With: SERVICE NAME, TOTAL PATIENTS ADMITTED, The Difference 
Between Their TOTAL ADMISSIONS And The AVERAGE ADMISSIONS Across All Services, And a RANK INDICATOR ('Above Average', 'Average', 'Below Average'). 
ORDER BY Total Patients Admitted DESCENDING. */

-- FETCH Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- SOLUTION.
SELECT
    SW.SERVICE AS Service_Name,
    SUM(SW.Patients_Admitted) AS Total_Admissions,
    SUM(SW.Patients_Admitted) - AVG_TABLE.AVG_ADMISSIONS AS DIFF_FROM_AVG,
    CASE
        WHEN SUM(SW.Patients_Admitted) > AVG_TABLE.AVG_ADMISSIONS THEN 'Above Average'
        WHEN SUM(SW.Patients_Admitted) < AVG_TABLE.AVG_ADMISSIONS THEN 'Below Average'
        ELSE 'Average'
    END AS RANK_INDICATOR
FROM Services_Weekly SW
JOIN (
    SELECT ROUND(AVG(Total_Admissions), 2) AS AVG_ADMISSIONS
    FROM (
        SELECT SERVICE, SUM(Patients_Admitted) AS Total_Admissions
        FROM Services_Weekly
        GROUP BY SERVICE
    ) SUB
) AVG_TABLE
GROUP BY SW.SERVICE, AVG_TABLE.AVG_ADMISSIONS
ORDER BY Total_Admissions DESC;
