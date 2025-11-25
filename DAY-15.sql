/* Day - 15. Question: Create a COMPREHENSIVE SERVICE ANALYSIS Report For WEEK 20 Showing: SERVICE NAME, TOTAL PATIENTS ADMITTED That WEEK, TOTAL PATIENTS REFUSED, 
AVERAGE PATIENT SATISFACTION, COUNT of STAFF Assigned To SERVICE, and COUNT of STAFF Present That WEEK. ORDER BY PATIENTS Admitted DESCENDING.*/

-- FETCH Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- FETCH STAFF Table.
SELECT * FROM STAFF;

SELECT
	SW.SERVICE AS Service_Name,
    SUM(SW.Patients_Admitted) AS Total_Patients_Admitted,
    SUM(SW.Patients_Refused) AS Total_Patients_Refused,
    ROUND(AVG(SW.Patient_Satisfaction), 2) AS Average_Patient_Satisfaction,
    COUNT(DISTINCT S.STAFF_ID) AS Total_Staff_Assigned,
    COUNT(CASE WHEN SS.WEEK = 20 AND SS.PRESENT = 1 THEN SS.Staff_ID END) AS Staff_Present_In_Week_20
FROM Services_Weekly SW
LEFT JOIN STAFF S ON SW.Service = S.Service 
LEFT JOIN Staff_Schedule SS ON S.Staff_ID = SS.Staff_ID
WHERE SW.WEEK = 20
GROUP BY SW.SERVICE
ORDER BY Total_Patients_Admitted DESC;

