/* Find the 3rd to 7th highest patient satisfaction scores from the patients table, 
showing patient_id, name, service, and satisfaction. Display only these 5 records. */

SELECT 
  patient_id, 
  name, 
  service, 
  satisfaction 
FROM 
  patients 
ORDER BY satisfaction DESC  -- Step 1: Sort by highest satisfaction first
LIMIT 5 OFFSET 2;           -- Step 2: Skip the top 2, and take the next 5 (rows 3 through 7)
