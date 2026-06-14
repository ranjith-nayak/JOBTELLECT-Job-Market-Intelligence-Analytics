-- ===================================
-- TOP SKILLS IN THE JOB MARKET
-- ===================================

SELECT
    s.skill_name,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
GROUP BY s.skill_name
ORDER BY demand DESC;

-- ===================================
-- ENTRY LEVEL SKILLS
-- ===================================

SELECT
    s.skill_name,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
JOIN jobs j
    ON js.job_id = j.job_id
WHERE j.formatted_experience_level = 'Entry level'
GROUP BY s.skill_name
ORDER BY demand DESC
LIMIT 15;

-- ===================================
-- TOP PAYING COMPANIES
-- ===================================

SELECT
    company_name,
    AVG(max_salary) AS avg_salary
FROM jobs
WHERE max_salary IS NOT NULL
AND company_name IS NOT NULL
GROUP BY company_name
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC
LIMIT 20;

-- ===================================
-- TOP PAYING LOCATIONS
-- ===================================

SELECT
    location,
    AVG(max_salary) AS avg_salary,
    COUNT(*) AS jobs_count
FROM jobs
WHERE max_salary IS NOT NULL
GROUP BY location
HAVING COUNT(*) >= 20
ORDER BY avg_salary DESC
LIMIT 20;

-- ===================================
-- HIGHEST PAYING SKILL CATEGORIES
-- ===================================

SELECT
    s.skill_name,
    AVG(j.max_salary) AS avg_salary,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
JOIN jobs j
    ON js.job_id = j.job_id
WHERE j.max_salary IS NOT NULL
GROUP BY s.skill_name
HAVING COUNT(*) >= 100
ORDER BY avg_salary DESC;

-- ===================================
-- EXPERIENCE LEVEL VS SALARY
-- ===================================

SELECT
    formatted_experience_level,
    AVG(max_salary) AS avg_salary,
    COUNT(*) AS jobs_count
FROM jobs
WHERE max_salary IS NOT NULL
AND formatted_experience_level IS NOT NULL
GROUP BY formatted_experience_level
ORDER BY avg_salary DESC;