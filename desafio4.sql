SELECT 
    j.JOB_TITLE AS `Cargo`,
    ROUND(AVG(e.SALARY), 2) AS `Média salarial`,
    CASE
        WHEN ROUND(AVG(e.SALARY)) BETWEEN 2000 AND 5800 THEN 'Júnior'
        WHEN ROUND(AVG(e.SALARY)) BETWEEN 5801 AND 7500 THEN 'Pleno'
        WHEN ROUND(AVG(e.SALARY)) BETWEEN 7501 AND 10500 THEN 'Sênior'
        WHEN ROUND(AVG(e.SALARY)) > 10501 THEN 'CEO'
        ELSE 'Estimando'
    END AS Senioridade
FROM
    hr.employees e
        INNER JOIN
    hr.jobs j ON e.JOB_ID = j.JOB_ID
GROUP BY JOB_TITLE
ORDER BY `Média salarial`;
