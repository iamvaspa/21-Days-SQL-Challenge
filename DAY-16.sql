/* Day - 16. Question: Find All PATIENTS Who Were ADMITTED To SERVICES That Had At Least One WEEK Where PATIENTS Were REFUSED AND 
The AVERAGE PATIENT SATISFACTION For That SERVICE Was Below The Overall HOSPITAL AVERAGE SATISFACTION. 
Show PATIENT_ID, NAME, SERVICE, And Their PERSONAL SATISFACTION SCORE.*/

-- SOLUTION:
SELECT
	P.PATIENT_ID,
    P.NAME,
    P.SERVICE,
    P.SATISFACTION AS Personal_Satisfaction_Score
FROM PATIENTS AS P
WHERE 
	P.SERVICE IN (
						SELECT DISTINCT SERVICE
						FROM Services_weekly
						WHERE Patients_Refused = 0
				 )
                    AND
				 (
						SELECT ROUND(AVG(Patient_Satisfaction), 2)
						FROM Services_Weekly SW
						WHERE SW.SERVICE = P.SERVICE
				 ) < (
						SELECT ROUND(AVG(Patient_Satisfaction), 2)
						FROM Services_Weekly
                     );

    