-- Day - 12. Question: Analyze The Event Impact By Comparing WEEKS With EVENTS vs WEEKS Without Events. 
-- Show: Event Status ('With Event' or 'No Event'), COUNT of WEEKS, AVERAGE PATIENTS SATISFACTION, and AVERAGE STAFF MORALE. 
-- ORDER BY AVERAGE PATIENT SATISFACTION DESCENDING.

-- FETCH Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- SOLUTION:
SELECT
	 CASE
		WHEN EVENT <> 'NONE' THEN 'No Event'
        WHEN EVENT IS NOT NULL THEN 'With Event'
	END AS 'Event_Status',
    COUNT(WEEK) AS Count_Of_Weeks,
    ROUND(AVG(Patient_Satisfaction), 2) AS Average_Patient_Satisfaction,
    ROUND(AVG(Staff_Morale), 2) AS Average_Staff_Morale
FROM Services_Weekly
GROUP BY Event_Status
ORDER BY AVG(Patient_Satisfaction) DESC;