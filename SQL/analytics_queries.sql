-- ===================================
-- WORK TYPE ANALYSIS
-- ===================================

SELECT
    formatted_work_type,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY formatted_work_type
ORDER BY total_jobs DESC;

-- ===================================
-- EXPERIENCE LEVEL ANALYSIS
-- ===================================

SELECT
    formatted_experience_level,
    COUNT(*) AS total_jobs
FROM jobs
WHERE formatted_experience_level IS NOT NULL
GROUP BY formatted_experience_level
ORDER BY total_jobs DESC;

-- ===================================
-- TOP HIRING LOCATIONS
-- ===================================

SELECT
    location,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY location
ORDER BY total_jobs DESC
LIMIT 15;

-- ===================================
-- TOP HIRING COMPANIES
-- ===================================

SELECT
    company_name,
    COUNT(*) AS total_jobs
FROM jobs
WHERE company_name IS NOT NULL
GROUP BY company_name
ORDER BY total_jobs DESC
LIMIT 20;