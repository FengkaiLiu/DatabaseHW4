-- Question1
SELECT c.LastName, c.Email
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.Email IS NOT NULL;


-- Question2
SELECT a.Title AS AlbumName, ar.Name AS ArtistName
FROM albums a
JOIN artists ar ON a.ArtistId = ar.ArtistId;


-- Question3
SELECT State, COUNT(DISTINCT CustomerId) AS TotalCustomers
FROM customers
WHERE State IS NOT NULL
GROUP BY State
ORDER BY State;


-- Question4
SELECT State, COUNT(DISTINCT CustomerId) AS TotalCustomers
FROM customers
WHERE State IS NOT NULL
GROUP BY State
HAVING COUNT(DISTINCT CustomerId) > 10
ORDER BY State;


-- Question5
SELECT DISTINCT ar.Name AS ArtistName
FROM artists ar
JOIN albums a ON ar.ArtistId = a.ArtistId
WHERE a.Title LIKE '%symphony%';

-- Question6
SELECT DISTINCT ar.Name AS ArtistName
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
JOIN media_types m ON t.MediaTypeId = m.MediaTypeId
JOIN playlist_track pt ON t.TrackId = pt.TrackId
JOIN playlists p ON pt.PlaylistId = p.PlaylistId
WHERE (m.Name LIKE '%MPEG%' OR m.Name LIKE '%video%' OR m.Name LIKE '%audio%')
AND (p.Name = 'Brazilian Music' OR p.Name = 'Grunge');


-- Question7
SELECT COUNT(*) AS NumberOfArtists
FROM (
    SELECT ar.ArtistId
    FROM artists ar
    JOIN albums al ON ar.ArtistId = al.ArtistId
    JOIN tracks t ON al.AlbumId = t.AlbumId
    JOIN media_types m ON t.MediaTypeId = m.MediaTypeId
    WHERE m.Name LIKE '%MPEG%'
    GROUP BY ar.ArtistId
    HAVING COUNT(t.TrackId) >= 10
) AS artist_counts;


-- Question8
SELECT 
    p.PlaylistId, 
    p.Name AS PlaylistName, 
    ROUND(SUM(t.Milliseconds) / (1000 * 60 * 60), 2) AS PlaylistLengthHours
FROM 
    playlists p
JOIN 
    playlist_track pt ON p.PlaylistId = pt.PlaylistId
JOIN 
    tracks t ON pt.TrackId = t.TrackId
GROUP BY 
    p.PlaylistId, p.Name
HAVING 
    PlaylistLengthHours > 2
ORDER BY 
    PlaylistLengthHours DESC;


-- Question9
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    i.InvoiceId,
    i.InvoiceDate,
    SUM(ii.UnitPrice * ii.Quantity) OVER (PARTITION BY c.CustomerId) AS TotalAmountSpent
FROM 
    customers c
JOIN 
    invoices i ON c.CustomerId = i.CustomerId
JOIN 
    invoice_items ii ON i.InvoiceId = ii.InvoiceId
ORDER BY 
    c.CustomerId, i.InvoiceDate;
