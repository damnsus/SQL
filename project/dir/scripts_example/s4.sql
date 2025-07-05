-- Пользователи, у которых больше среднего кол-во подписчиков
SELECT f.follower_id, COUNT(*) AS subscriptions
FROM SocialNetwork.follows f
GROUP BY f.follower_id
HAVING COUNT(*) > (
    SELECT AVG(subs)
    FROM (
        SELECT COUNT(*) AS subs
        FROM SocialNetwork.follows
        GROUP BY follower_id
    ) subquery
);
