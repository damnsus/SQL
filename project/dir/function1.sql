CREATE OR REPLACE FUNCTION SocialNetwork.count_post_likes(post_id_input INT)
RETURNS INT AS $$
BEGIN
    RETURN (
        SELECT COUNT(*) 
        FROM SocialNetwork.likes 
        WHERE post_id = post_id_input
    );
END;
$$ LANGUAGE plpgsql;
