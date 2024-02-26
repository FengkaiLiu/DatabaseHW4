INSERT INTO Music_Video (trackId, videoDirector) VALUES
(1, 'Director A'),
(2, 'Director B'),
(3, 'Director C'),
(4, 'Director D'),
(5, 'Director E'),
(6, 'Director F'),
(7, 'Director G'),
(8, 'Director H'),
(9, 'Director I'),
(10, 'Director J');

INSERT INTO Music_Video (trackId, videoDirector)
VALUES ((SELECT trackId FROM tracks WHERE Name = 'Voodoo'), 'Director K');

SELECT DISTINCT c.CustomerId, c.FirstName, c.LastName
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
JOIN tracks t ON ii.TrackId = t.TrackId
WHERE t.Milliseconds > (SELECT AVG(Milliseconds) FROM tracks WHERE Milliseconds < 900000) -- 15 minutes in milliseconds
AND t.Milliseconds < 900000;

SELECT t.TrackId, t.Name
FROM tracks t
WHERE t.GenreId NOT IN (
    SELECT g.GenreId
    FROM genres g
    JOIN tracks t ON g.GenreId = t.GenreId
    GROUP BY g.GenreId
    ORDER BY SUM(t.Milliseconds) DESC
    LIMIT 5
);

SELECT a.Name AS ArtistName, COUNT(ii.TrackId) AS TracksSold
FROM invoice_items ii
JOIN tracks t ON ii.TrackId = t.TrackId
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists a ON al.ArtistId = a.ArtistId
GROUP BY a.ArtistId
ORDER BY TracksSold DESC
LIMIT 5;