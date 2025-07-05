CREATE OR REPLACE VIEW SocialNetwork.post_stats AS
SELECT 
    p.post_id,
    p.user_id,
    u.username,
    p.content,
    p.created_at,
    COUNT(DISTINCT l.like_id) AS like_count,
    COUNT(DISTINCT c.comment_id) AS comment_count
FROM SocialNetwork.posts p
LEFT JOIN SocialNetwork.likes l ON p.post_id = l.post_id
LEFT JOIN SocialNetwork.comments c ON p.post_id = c.post_id
JOIN SocialNetwork.users u ON p.user_id = u.user_id
GROUP BY p.post_id, u.username;
