CREATE TABLE netflix_server_table(
    show_id VARCHAR(20),
    type VARCHAR(100),
    title VARCHAR(1000),
    director VARCHAR(1000),
    actors TEXT,
    country TEXT,
    date_added DATE,
    release_year INT,
    rating VARCHAR(100),
    duration VARCHAR(100),
    listed_in VARCHAR(1000),
    description TEXT
);

DROP TABLE netflix_server_table;

COPY netflix_server_table
FROM 'E:\SQL_Own_Project\Project_3\netflix_titles.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);