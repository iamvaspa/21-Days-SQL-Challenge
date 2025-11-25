-- 8. Question: Create a PATIENT Summary That Shows PATIENT_ID, FULL NAME in UPPERCASE, SERVICE in LOWERCASE, 
-- AGE Category (if AGE >= 65 then 'SENIOR', if age >= 18 Then 'ADULT', Else 'MINOR'), And NAME LENGTH. 
-- Only show PATINETS Whose NAME LENGTH is Greater Than 10 Characters.

-- FETCH PATIENTS Table.
SELECT * FROM PATIENTS;

-- SOLUTION:
SELECT
	PATIENT_ID,
    UPPER(Name) AS Patients_Name,
    LOWER(SERVICE) AS Patients_Service,
    AGE,
    CASE
		WHEN AGE >= 65 THEN "SENIOR"
        WHEN AGE >= 18 THEN "ADULT"
        ELSE "MINOR"
	END AS Age_Category,
    LENGTH(Name) AS Patients_Name_Length
FROM PATIENTS
HAVING Patients_Name_Length > 10;

-- Flow of Execution:
/*
1. FROM PATIENTS.
The query begins by accessing all rows from the PATIENTS table.

2. SELECT + Functions - For every row:
2.1. PATIENT_ID is retrieved directly.
2.2. UPPER(Name) converts the Name to uppercase.
2.3. LOWER(SERVICE) converts the SERVICE to lowercase.
2.4. AGE is retrieved directly.
2.5. CASE determines the age category:
	≥ 65 → 'SENIOR'
	18–64 → 'ADULT'
	< 18 → 'MINOR'
2.6. LENGTH(Name) calculates the number of characters in the name.

3. HAVING Clause
Rows are filtered so that only those where Patients_Name_Length (i.e., the length of Name) is greater than 10 are included in the final result.

-- Brief Explanation of Each Function:
1. UPPER(Name)
Converts each patient’s Name to all uppercase letters.
Example: "xyz" → "XYZ"

2. LOWER(SERVICE)
Converts the value of SERVICE to all lowercase letters.
Example: "SURGERY" → "surgery"

3. CASE
Implements conditional logic to categorize AGE:
	If AGE is 65 or higher → returns "SENIOR"
	If AGE is 18 or higher → returns "ADULT"
	Otherwise → returns "MINOR"

3. LENGTH(Name)
Counts the number of characters in the patient’s Name.
Example: "Abc Xyz" → 7 (including whitespace)
*/