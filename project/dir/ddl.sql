CREATE SCHEMA SocialNetwork;

CREATE TABLE SocialNetwork.users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    bio TEXT,
    avatar_url VARCHAR(255)
);

CREATE TABLE SocialNetwork.posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES SocialNetwork.users(user_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    parent_post_id INT REFERENCES SocialNetwork.posts(post_id) ON DELETE SET NULL
);

CREATE TABLE SocialNetwork.comments (
    comment_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES SocialNetwork.users(user_id) ON DELETE CASCADE,
    post_id INT NOT NULL REFERENCES SocialNetwork.posts(post_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE SocialNetwork.likes (
    like_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES SocialNetwork.users(user_id) ON DELETE CASCADE,
    post_id INT NOT NULL REFERENCES SocialNetwork.posts(post_id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE (user_id, post_id)  -- Один лайк от пользователя на пост
);

CREATE TABLE SocialNetwork.follows (
    follow_id SERIAL PRIMARY KEY,
    follower_id INT NOT NULL REFERENCES SocialNetwork.users(user_id) ON DELETE CASCADE,
    following_id INT NOT NULL REFERENCES SocialNetwork.users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE (follower_id, following_id)  -- Уникальная подписка
);