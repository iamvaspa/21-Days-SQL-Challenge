-- Day 11. Question: Find All UNIQUE Combinations of SERVICE and EVENT TYPE From The Services_Weekly Table Where Events Are NOT NULL or NONE, 
-- Along With The Count of Occurrences For Each Combination. ORDER BY Count DESCENDING.

-- FETCG Services_Weekly Table.
SELECT * FROM Services_Weekly;

-- SOLUTION:
SELECT
	SERVICE,
    EVENT,
	COUNT(*) AS Unique_Combinations
FROM Services_Weekly
WHERE 
	EVENT IS NOT NULL 
AND EVENT <> 'NONE'
GROUP BY SERVICE, EVENT
ORDER BY Unique_Combinations DESC;