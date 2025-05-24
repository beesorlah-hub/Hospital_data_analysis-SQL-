# Hospital_data_analysis

## TABLE OF CONTENT
- [Overview](#overview)  
- [Data Source](#data-source)  
- [Insights](#insights) 
- [Recommendation](#recommendation)
- [Conclusion](#conclusion) 

## Overview
This project analyzes Hospital data using Structured Query Language(SQL) to extract insights related to :
- Readmission rates
- Patient Satisfaction
- Cost per condition and procedure
- Length of stay tends

## Data Source
- Source: Kaggle
- link: https://www.kaggle.com/datasets/blueblushed/hospital-dataset-for-practice/data
  
## Insights
  **Total Cost spent on each Condition**
  
      SELECT `Condition`, FORMAT(SUM(Cost), 2) AS `Total Cost ($)`
      FROM hospital_data.`hospital data analysis`
      GROUP BY `Condition`
      ORDER BY SUM(Cost);
      
![Screenshot 2025-05-24 115347](https://github.com/user-attachments/assets/e8aeaa46-85e6-466e-a4a8-fcbdddeea5a3)

**Count of readmission patients** 

    SELECT COUNT(Readmission) as Total_count_of_Readmission, Readmission 
    FROM hospital_data.`hospital data analysis` 
    group by Readmission;

![Screenshot 2025-05-24 123140](https://github.com/user-attachments/assets/2b8aa589-62e5-4632-8640-9c51f0d6531a)


**Count of readmission patients by gender**

     select  Gender, count(Patient_ID) AS Total_readmission
     from hospital_data.`hospital data analysis` 
     where Gender in ('Female', 'Male') and Readmission = 'Yes' 
     group by Gender;

![Screenshot 2025-05-24 120258](https://github.com/user-attachments/assets/9ff0d008-d3af-4736-826d-8d8b1b57c563)


**Readmission by Childbirth**

    SELECT 
    COUNT(CASE WHEN Readmission = 'Yes' THEN Patient_ID END) AS Childbirth_with_Readmission,
    COUNT(CASE WHEN Readmission = 'No' THEN Patient_ID END) AS Childbirth_without_Readmission
    FROM hospital_data.`hospital data analysis` 
    WHERE Gender = 'Female' AND `Condition` = 'Childbirth';
    
![Screenshot 2025-05-24 122924](https://github.com/user-attachments/assets/fc6538a8-37f2-4d97-8336-b344a2444e20)

    

 **Average length of stay per Condition**
 
     select `Condition`, round(Avg(Length_of_Stay),0) As Average_Stay 
    from hospital_data.`hospital data analysis` 
    group by `Condition`
    order by Average_Stay;

![Screenshot 2025-05-24 121505](https://github.com/user-attachments/assets/a6e328d7-68d0-48ec-afc6-f4274ed38dab)


**Readmission rate by condition**

    SELECT `Condition`, Round(COUNT(CASE WHEN Readmission = 'Yes' THEN 1 END) * 100.0 /              COUNT(*), 0) AS Readmission_Rate
    from hospital_data.`hospital data analysis`
    GROUP BY `Condition`
    ORDER BY Readmission_Rate DESC;
    
![Screenshot 2025-05-24 123752](https://github.com/user-attachments/assets/f998459b-bbd5-4c0b-9e6b-d173a612e7a9)

**Patients satisfaction by outcome** 

    select Outcome, avg(Satisfaction) as Average_Satisfaction 
    FROM hospital_data.`hospital data analysis` 
    group by Outcome
    order by Average_Satisfaction;

![image](https://github.com/user-attachments/assets/d4e7e141-7f11-4553-a0c5-1b3f63857021)

**Condition per Age group**

      SELECT 
    CASE 
        WHEN Age < 18 THEN 'Child (0-17)'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult'
        WHEN Age BETWEEN 36 AND 50 THEN 'Middle-aged Adult'
        WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult'
        ELSE 'Elderly'
    END AS Age_group, 
    COUNT(*) AS Patient_Count,
	`Condition`
    FROM hospital_data.`hospital data analysis`
    GROUP BY Age_group, `Condition`
    ORDER BY Age_group, `Condition`, Patient_Count;

![image](https://github.com/user-attachments/assets/53309999-56ab-4640-aefb-53d71f367fbd)

**condition by Gender**

	SELECT 
 	   Gender,
 	   `Condition`, 
 	   `Procedure`, 
  	  COUNT(`Procedure`) AS Total_count_per_condition 
	FROM hospital_data.`hospital data analysis` 
	WHERE Gender IN ('Female', 'Male') 
	GROUP BY Gender, `Condition`, `Procedure`
	ORDER BY Gender, `Condition`, Total_count_per_condition DESC;

![image](https://github.com/user-attachments/assets/da223794-0443-45e9-b74e-4c8b250d3116)

  **patient satisfaction by age group**

 
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

![image](https://github.com/user-attachments/assets/8927884f-2373-4e2c-b0d0-2c71378cf0e1)



## Recommendation
- Cost Management :- Implement preventive measures and early detection programs to reduce long-term cancer treatment expenses.
- Improving Length of Stay Efficiency:- Since surgeries and chemotherapy have the highest average stay, hospitals should optimize care pathways to reduce unnecessary hospital stays.
- Patient Satisfaction Improvement:- Since recovered patients have higher satisfaction (3.8) than those with stable outcomes (3.2), focus on enhancing the recovery process and patient support systems.
- Targeted Healthcare Programs for Elderly Patients:- As patients aged 65 and above have a high prevalence of severe conditions (Heart Attack, Hypertension, Stroke, etc.), hospitals should develop specialized geriatric healthcare programs.
Conduct regular screenings and preventive measures for these conditions in elderly populations.
- Gender-Specific Healthcare Initiatives:- With female patients having more health conditions, specialized women's health programs should be implemented.
Ensure gender-inclusive healthcare policies for better medical accessibility and treatment outcomes.
## Conclusion
The analysis highlights critical areas of healthcare efficiency, cost distribution, patient demographics, and readmission trends. The findings suggest the need for cost management, readmission reduction strategies, improved patient satisfaction initiatives, and specialized care for elderly and female patients. By implementing these recommendations, healthcare institutions can optimize resource utilization, enhance patient outcomes, and improve overall healthcare quality.
