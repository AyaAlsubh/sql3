-- Step 1: Create Database

--CREATE DATABASE aya_movies;


USE aya_movies;
GO

-- Step 2: Drop table if exists
IF OBJECT_ID('movie_watchlist', 'U') IS NOT NULL
DROP TABLE movie_watchlist;
GO

-- Step 3: Create Table
CREATE TABLE movie_watchlist (
    movie_id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(100) NOT NULL,
    rating DECIMAL(3,2),
    genre VARCHAR(50),
    watch_date DATE,
    platform VARCHAR(50) NOT NULL,
    duration_minutes INT,
    watched_again BIT,
    mood VARCHAR(50)
);
GO

-- Step 4: Insert Data
INSERT INTO movie_watchlist 
(title, rating, genre, watch_date, platform, duration_minutes, watched_again, mood)
VALUES
('Inception', 9.0, 'Sci-Fi', '2023-08-10', 'Netflix', 148, 1, 'Excited'),
('The Dark Knight', 9.2, 'Action', '2023-06-05', 'Cinema', 152, 1, 'Focused'),
('Interstellar', 8.8, 'Sci-Fi', '2023-09-15', 'Disney+', 169, 1, 'Emotional'),
('Parasite', 8.6, 'Thriller', '2023-07-20', 'Shahid', 132, 0, 'Shocked'),
('Joker', 8.4, 'Drama', '2023-10-01', 'Cinema', 122, 0, 'Serious'),
('Avengers: Endgame', 8.9, 'Action', '2023-05-10', 'Disney+', 181, 1, 'Excited'),
('Soul', 8.1, 'Animation', '2023-11-01', 'YouTube', 100, 0, 'Relaxed'),
('Tenet', 7.9, 'Action', '2023-09-25', 'Netflix', 150, 0, 'Confused');
GO

-- Step 5: Select All
SELECT * FROM movie_watchlist;
GO

-- Step 6: Summary
SELECT 
AVG(rating) AS avg_rating,
MAX(rating) AS max_rating,
COUNT(*) AS total_movies
FROM movie_watchlist;
GO

-- Step 7: Update Top 3
UPDATE movie_watchlist
SET rating = rating + 0.5
WHERE movie_id IN (
    SELECT TOP 3 movie_id
    FROM movie_watchlist
    ORDER BY rating DESC
);
GO

-- Step 8: Delete 2 Shortest
DELETE FROM movie_watchlist
WHERE movie_id IN (
    SELECT TOP 2 movie_id
    FROM movie_watchlist
    ORDER BY duration_minutes ASC
);
GO

-- Step 9: Alter Table
ALTER TABLE movie_watchlist
ADD review_notes VARCHAR(255);
GO

-- Step 10: Final Check
SELECT * FROM movie_watchlist;
GO