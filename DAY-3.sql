-- 3. Question: Retrieve the top 5 weeks with the highest patient refusals across all services, 
-- showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.

-- Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- Fetch Only Selected Columns Such As, WEEK, SERVICE, Patients_Refused, Patients_Request.
SELECT
	WEEK, SERVICE, Patients_Refused, Patients_Request
FROM Services_Weekly;

-- SORT The Table Based On Services Refused By Patients (Patients_Refused).
SELECT
	WEEK, SERVICE, Patients_Refused, Patients_Request
FROM Services_Weekly
ORDER BY Patients_Refused DESC;

-- FETCH Only Top 5 WEEKS.
SELECT
	WEEK, SERVICE, Patients_Refused, Patients_Request
FROM Services_Weekly
ORDER BY Patients_Refused DESC
LIMIT 5;

-- Final SOLUTION:
SELECT
	WEEK, SERVICE, Patients_Refused, Patients_Request
FROM Services_Weekly
ORDER BY Patients_Refused DESC
LIMIT 5;