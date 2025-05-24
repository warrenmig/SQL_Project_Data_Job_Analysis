/*
QUESTIONS: What are the top skills based on salary?
    - Look at the average salary associated with each skill for Data Analyst positions
    - Focuses on roles with specified salaries, regardless of location
    - Why? It reveals how different skills impact salary levels for Data Analyst and 
        helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Here are 3 concise insights based on the top 25 highest-paying data analysis skills:

Big Data & ML Tools Are Highly Valued: Skills like PySpark, DataRobot, Databricks, and Scikit-learn offer top salaries, reflecting strong demand for handling large-scale data and machine learning automation.

DevOps & Collaboration Skills Boost Pay: Tools such as Bitbucket, GitLab, Jenkins, and Atlassian suggest that integration with development workflows and team collaboration are becoming essential for data analysts.

Cloud & Engineering Know-How Pays Off: Proficiency in GCP, Kubernetes, Airflow, and PostgreSQL shows that companies favor analysts who can operate within cloud-native and scalable data infrastructures.
*/