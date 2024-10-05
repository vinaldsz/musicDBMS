-- Using CTE makes code more readable and can be broken into common parts that can be reused. Here CTE was not required. 
-- However I had written logic for lists all the customers that listen to longer-than-average tracks, excluding the tracks that are 15 minutes. Modified the same to meet the requirement.

WITH cte_aboveAvg AS (SELECT a.TrackId, a.Milliseconds, b.TrackId, d.CustomerId, CONCAT(d.FirstName,' ',d.LastName) CustomerName
FROM (
    SELECT TrackId, Milliseconds
    FROM tracks
    WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM tracks) and Milliseconds <=900000
) AS a
INNER JOIN invoice_items b ON a.TrackId = b.TrackId
INNER JOIN invoices c ON b.InvoiceId=c.InvoiceId
INNER JOIN customers d ON c.customerId=d.CustomerId)

select distinct CustomerName FROM cte_aboveAvg;