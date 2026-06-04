SELECT 
    release_year::NUMERIC,
    COUNT(*) AS total_counts
FROM 
    netflix_server_table
GROUP BY
    release_year
ORDER BY
    total_counts DESC