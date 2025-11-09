/* For each hospital service, calculate the total number of patients admitted, 
total patients refused, and the admission rate (percentage of requests that were admitted). 
Order by admission rate descending. */

select 
  service, 
  sum(patients_admitted) AS Total_Patients_Admitted, 
  sum(patients_refused) AS Total_Patients_Refused, 
  concat(round(sum(patients_admitted)/ sum(patients_request) * 100, 2), "%"
  ) AS Admission_Rate 
from 
  services_weekly 
group by service 
order by Admission_Rate desc;
