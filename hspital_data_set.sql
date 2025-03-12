SELECT * FROM hospital_data.`hospital data analysis`;

#Total Cost spent on each Condition
select `Condition`, Sum(Cost) As Total_cost 
from hospital_data.`hospital data analysis` 
group by `Condition`;

# count of readmission patients by gender
select count(Patient_ID) AS Total_count , Gender 
from hospital_data.`hospital data analysis` 
where Gender in ('Female', 'Male') and Readmission = 'Yes' 
group by Gender;

#Average length of stay per procedure
select `Procedure`, Avg(Length_of_Stay) As Average_Stay 
from hospital_data.`hospital data analysis` 
group by `Procedure` 
order by Average_Stay;

# count of female patients treated for childbirth with no readmission
select count(Patient_ID) AS Total_count  
from hospital_data.`hospital data analysis` 
where Gender = 'Female' and `Condition` = 'Childbirth' and Readmission = 'No';


# count of readmission patients
SELECT COUNT(Readmission) as Total_count_of_Readmission, Readmission 
FROM hospital_data.`hospital data analysis` 
group by Readmission;

#Readmission rate by condition
SELECT `Condition`, Round(COUNT(CASE WHEN Readmission = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS Readmission_Rate
from hospital_data.`hospital data analysis`
GROUP BY `Condition`
ORDER BY Readmission_Rate DESC;


# count of  patients condition
SELECT DISTINCT `Condition`, count(`Patient_ID`) as Count_of_Patients_with_Condition 
FROM hospital_data.`hospital data analysis` 
group by `Condition`;

# Patients satisfaction by outcome
select Outcome, avg(Satisfaction) as Average_Satisfaction 
FROM hospital_data.`hospital data analysis` 
group by Outcome
order by Average_Satisfaction;

#Total count of patient per condition
select distinct `Condition`, `Procedure`, COUNT(Patient_ID) as Total_no 
FROM hospital_data.`hospital data analysis` 
group by `Condition`, `Procedure` 
order by Total_no;

#Condition per Age group
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Child (0-17)'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult (18-35)'
        WHEN Age BETWEEN 36 AND 50 THEN 'Middle-aged Adult (36-50)'
        WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult (51-65)'
        ELSE 'Elderly (66 and above)'
    END AS Age_group, 
    COUNT(*) AS Patient_Count,
	`Condition`
FROM hospital_data.`hospital data analysis`
GROUP BY Age_group, `Condition`
ORDER BY Age_group, `Condition`;

#condition by Gender (Female)
select `Condition`, `Procedure`, count(`Procedure`) as Total_count_per_condition 
FROM hospital_data.`hospital data analysis` 
where Gender = 'Female' 
group by `Condition`, `Procedure`;

#condition by Gender (Male)  
select `Condition`, `Procedure`, count(`Procedure`) as Total_count_per_condition 
FROM hospital_data.`hospital data analysis` 
where Gender = 'Male' 
group by `Condition`, `Procedure`;  

#Readmission rate by age group
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Child (0-17)'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult (18-35)'
        WHEN Age BETWEEN 36 AND 50 THEN 'Middle-aged Adult (36-50)'
        WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult (51-65)'
        ELSE 'Elderly (66 and above)'
    END AS Age_group, 
    COUNT(*) AS Total_Patients,
    COUNT(CASE WHEN Readmission = 'Yes' THEN 1 END) AS Readmitted_Patients,
    ROUND(COUNT(CASE WHEN Readmission = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS Readmission_Rate
FROM  hospital_data.`hospital data analysis`
GROUP BY Age_group
ORDER BY Readmission_Rate DESC;

#cost per procedure and age group 
SELECT 
   CASE 
        WHEN Age < 18 THEN 'Child (0-17)'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult (18-35)'
        WHEN Age BETWEEN 36 AND 50 THEN 'Middle-aged Adult (36-50)'
        WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult (51-65)'
        ELSE 'Elderly (66 and above)'
    END AS Age_group, 
    `Procedure`,
    AVG(Cost) AS Avg_Cost,
    SUM(Cost) AS Total_Cost,
    COUNT(*) AS Total_Cases
from hospital_data.`hospital data analysis`
GROUP BY Age_Group, `Procedure`
ORDER BY Total_Cost DESC;

#patient satisfactory by age group
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Child (0-17)'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult (18-35)'
        WHEN Age BETWEEN 36 AND 50 THEN 'Middle-aged Adult (36-50)'
        WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult (51-65)'
        ELSE 'Elderly (66 and above)'
    END AS Age_group, 
    ROUND(AVG(Satisfaction), 2) AS Avg_Satisfaction,
    COUNT(*) AS Total_Responses
from hospital_data.`hospital data analysis`
GROUP BY Age_Group
ORDER BY Avg_Satisfaction DESC;


#common procedure by age group
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Child (0-17)'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult (18-35)'
        WHEN Age BETWEEN 36 AND 50 THEN 'Middle-aged Adult (36-50)'
        WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult (51-65)'
        ELSE 'Elderly (66 and above)'
    END AS Age_group, 
    `Procedure`,
    COUNT(*) AS Procedure_Count
from hospital_data.`hospital data analysis`
GROUP BY Age_Group, `Procedure`
ORDER BY Age_Group, Procedure_Count DESC;

