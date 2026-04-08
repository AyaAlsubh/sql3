
SELECT * FROM movie_watchlist;  

-- بعد تحديث أعلى 3 تقييمات
WITH Top3 AS (
    SELECT TOP 3 movie_id
    FROM movie_watchlist
    ORDER BY rating DESC
)
UPDATE movie_watchlist
SET rating = rating + 0.5
WHERE movie_id IN (SELECT movie_id FROM Top3);

SELECT * FROM movie_watchlist;  -- هنا سترى التقييمات المحدثة

-- بعد حذف أقصر فيلمين
WITH Shortest2 AS (
    SELECT TOP 2 movie_id
    FROM movie_watchlist
    ORDER BY duration_minutes ASC
)
DELETE FROM movie_watchlist
WHERE movie_id IN (SELECT movie_id FROM Shortest2);

SELECT * FROM movie_watchlist;  

-- بعد إضافة عمود review_notes
ALTER TABLE movie_watchlist
ADD review_notes NVARCHAR(255);

SELECT * FROM movie_watchlist; 