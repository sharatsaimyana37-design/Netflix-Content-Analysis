-- This is the count of countries who watch movies
SELECT
    TRIM(n.country_name) AS country,
    COUNT(*) AS total_count
FROM
    netflix_server_table
CROSS JOIN LATERAL
    unnest(string_to_array(country, ', ')) AS n(country_name)
WHERE
    type = 'Movie'
GROUP BY
    n.country_name
ORDER BY
    total_count DESC
LIMIT 10

-- This is the count of countries who watch TV Shows
SELECT
    n.country_name,
    COUNT(*) AS total_count
FROM
    netflix_server_table
CROSS JOIN LATERAL
    unnest(string_to_array(country, ', ')) AS n(country_name)
WHERE
    type = 'TV Show'
GROUP BY
    n.country_name
ORDER BY
    total_count DESC
LIMIT 10

-- Combining the table from the above two tables
SELECT
    TRIM(n.country_name) AS country,
    type,
    COUNT(*) AS total_titles
FROM netflix_server_table
CROSS JOIN LATERAL
    unnest(string_to_array(country, ',')) AS n(country_name)
WHERE country IS NOT NULL
GROUP BY
    TRIM(n.country_name),
    type
ORDER BY
    total_titles DESC;