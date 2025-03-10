-- Visualizar las primeras 10 filas
SELECT * 
FROM hr_analytics
LIMIT 10;

-- Tasa de attrition general de la empresa
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0)/ COUNT(*), 2) AS attrition_rate
FROM hr_analytics;

-- Perfil Demográfico
-- Análisis por género
SELECT 
	Gender, 
	COUNT(*) AS total_gender,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0)/ COUNT(*), 2) AS attrition_rate
FROM hr_analytics
GROUP BY Gender;

-- Análisis por edad 
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+' 
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS attrition_rate
FROM hr_analytics
GROUP BY age_group
ORDER BY attrition_rate DESC;

-- Análisis por nivel educativo
SELECT 
	Education,
	CASE WHEN Education = 1 THEN "Below College"
		WHEN Education = 2 THEN "College"
        WHEN Education = 3 THEN "Bachelor"
        WHEN Education = 4 THEN "Master"
        WHEN Education = 5 THEN "Doctor"
	END AS education_name,
    COUNT(*) AS total,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY Education, education_name
ORDER BY attrition_rate DESC;

-- Análisis por estado civil
SELECT 
	MaritalStatus,
    COUNT(*) AS total_employess,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS attrition_rate
FROM hr_analytics
GROUP BY MaritalStatus
ORDER BY attrition_rate;

-- Cargo e departamento
-- Análisis por departamento
SELECT 
	Department,
    COUNT(*) AS total_employees,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY Department;

-- Análisis por departamento, cargo y salario promedio
SELECT 
	Department,
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS avg_income,
    ROUND((SUM(CASE WHEN Attrition =  'Yes' THEN 1 ELSE 0 END)  * 100.0)/ COUNT(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY Department, JobRole
ORDER BY attrition_rate DESC;

-- Análisis por nivel de cargo
SELECT 
	JobLevel,
    COUNT(*) AS total_employee,
	ROUND((SUM(CASE WHEN Attrition =  'Yes' THEN 1 ELSE 0 END)  * 100.0)/ COUNT(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY JobLevel
ORDER BY attrition_rate DESC;


-- Equilibrio entre Vida y Trabajo
-- Análisis por horas extra (OverTime)
SELECT 
	OverTime,
    COUNT(*) AS total_employees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),2) AS rate_attrition
FROM hr_analytics
GROUP BY OverTime;

-- Análisis por equilibrio entre vida personal y profesional
SELECT
WorkLifeBalance,
	CASE 
		WHEN WorkLifeBalance = 1 THEN 'Bad' 
        WHEN WorkLifeBalance = 2 THEN 'Good' 
        WHEN WorkLifeBalance = 3 THEN 'Better'
        WHEN WorkLifeBalance = 4 THEN  'Best'
	END AS work_life_category,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS rate_attrition
FROM hr_analytics
GROUP BY WorkLifeBalance;

-- Análisis por frecuencia de viajes
SELECT 
	BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS rate_attrition
FROM hr_analytics
GROUP BY BusinessTravel;

-- Análisis por distancia al trabajo
SELECT 
    CASE 
        WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5 km'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20 km'
        WHEN DistanceFromHome > 20 THEN '20+ km'
    END AS distance_category,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS attrition_rate
FROM hr_analytics
GROUP BY distance_category
ORDER BY attrition_rate DESC;


-- Satisfacción y Compromiso
-- Análisis por nivel de satisfacción - Ambiente, Trabajo y Relaciones
SELECT 
	Attrition,
    ROUND(AVG(RelationshipSatisfaction),2) AS avg_rel_satisfaction,
    ROUND(AVG(JobSatisfaction),2) AS avg_job_satisfaction,
    ROUND(AVG(EnvironmentSatisfaction),2) AS avg_environment_satisfaction
FROM hr_analytics
GROUP BY Attrition;

-- Análisis por nivel de compromiso con el trabajo
SELECT 
	JobInvolvement,
    CASE
		WHEN JobInvolvement = 1 THEN 'Low'
        WHEN JobInvolvement = 2 THEN 'Medium'
        WHEN JobInvolvement = 3 THEN 'High'
        WHEN JobInvolvement = 4 THEN 'Very High'
	END AS involvement_level,
	ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100) / COUNT(*),2) AS attrition_rate
FROM hr_analytics
GROUP BY JobInvolvement
ORDER BY attrition_rate DESC;

-- Análisis por aumento salarial
SELECT 
	Attrition, 
	ROUND(AVG(PercentSalaryHike),2) AS avg_salary_hike
FROM hr_analytics
GROUP BY Attrition;

-- Tiempo en la Empresa y Desarollo Profesional
-- Análisis por tiempo en la empresa
SELECT 
    CASE 
        WHEN YearsAtCompany <= 1 THEN '0-1 ano'
        WHEN YearsAtCompany BETWEEN 2 AND 4 THEN '2-4 anos'
        WHEN YearsAtCompany BETWEEN 5 AND 7 THEN '5-7 anos'
        WHEN YearsAtCompany BETWEEN 8 AND 10 THEN '8-10 anos'
        ELSE '10+ anos'
    END AS time_range,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS attrition_rate
FROM hr_analytics
GROUP BY time_range
ORDER BY attrition_rate DESC;


-- Análisis por entrenamientos
SELECT 
	TrainingTimesLastYear,
    COUNT(*) AS total_employees,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS attrition_rate
    FROM hr_analytics
GROUP BY TrainingTimesLastYear
ORDER BY attrition_rate DESC;



