SELECT 
    g.genre_name,
    ROUND(AVG((SPLIT_PART(duration, ' ', 1))::NUMERIC), 2) AS avg_duration
FROM netflix_server_table
CROSS JOIN LATERAL
    unnest(string_to_array(listed_in, ', ')) AS g(genre_name)
WHERE type = 'Movie'
GROUP BY
    g.genre_name
ORDER BY
    avg_duration DESC
LIMIT 10