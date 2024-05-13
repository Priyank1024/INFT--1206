/*
--NAME - PRIYANK PAWAR
--ID - 100949832
--COURSE - INFT 1105 02
--IN CLASS ASSIGNMENT 8
USING BOTH GROUPING AND SUB QUERIES
1) USING SUB QUERIES , DISPLAY THE FULL NAME, DEPARTMENT NAME NAD SALARY FOR THE LOWEST PAID (BY SALARY ONLY ) EMPLOYES IN EACH DEPARTMENT*?.


answer */
SELECT 
    CONCAT(e.firstName, ' ', e.lastName) AS FullName,
    d.departmentName AS'DepartmentName',
    e.salary AS 'Salary'
FROM employees e
 JOIN departments d ON e.departmentID = d.departmentID
 WHERE 
  e.salary = (
        SELECT 
            MIN(salary)
        FROM 
            employees
   WHERE 
            departmentID = e.departmentID
			);