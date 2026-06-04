SELECT
    EXTRACT(YEAR FROM date_added) AS year_added,
    COUNT(*) AS total_titles
FROM netflix_server_table
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;