-- Пользователи, не написавшие ни одного комментария
SELECT u.user_id, u.username
FROM SocialNetwork.users u
WHERE NOT EXISTS (
    SELECT 1 FROM SocialNetwork.comments c WHERE c.user_id = u.user_id
);
