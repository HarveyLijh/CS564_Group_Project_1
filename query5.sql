SELECT COUNT(*)
FROM (
    SELECT *
    FROM item INNER JOIN user on item.userID = user.userID
    WHERE rating > 1000
    GROUP BY item.userID
);