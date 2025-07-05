-- Список пользователей, у которых хотя бы один пост
SELECT u.user_id, u.username, COUNT(p.post_id) AS post_count
FROM SocialNetwork.users u
JOIN SocialNetwork.posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username
HAVING COUNT(p.post_id) >= 1
ORDER BY post_count DESC;
