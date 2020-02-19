SELECT COUNT(*)
FROM (
    SELECT *
    FROM category AS c, bid AS b
    WHERE c.itemID = b.itemID AND b.amount > 100.0
    GROUP BY c.category
    HAVING COUNT(*) >= 1
);