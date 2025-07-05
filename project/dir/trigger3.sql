CREATE TABLE IF NOT EXISTS SocialNetwork.deleted_posts_log (
    log_id SERIAL PRIMARY KEY,
    post_id INT,
    deleted_at TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION SocialNetwork.log_deleted_post()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO SocialNetwork.deleted_posts_log(post_id)
    VALUES (OLD.post_id);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_deleted_post
AFTER DELETE ON SocialNetwork.posts
FOR EACH ROW
EXECUTE FUNCTION SocialNetwork.log_deleted_post();
