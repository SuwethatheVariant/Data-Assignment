-- A) Marketing Analysis:

-- 1 Loyal User Reward:

select id, username from users 
order by created_at asc
LIMIT 5;

-- 2. Inactive User Engagement:

select id from users where id not in (select user_id from photos);

-- 3. Contest Winner Declaration:

select photo_id, count(user_id) as no_of_users from likes 
group by photo_id
having photo_id in (select id from photos)
ORDER BY no_of_users DESC ;


-- 4. Hashtag Research: 
select t.id, t.tag_name, count(pt.photo_id) as no_of_photos from tags t join photo_tags pt on t.id = pt.tag_id
group by t.id, t.tag_name
order by no_of_photos DESC
LIMIT 5;


-- 5. Ad Campaign Launch:
select   dayname(created_at) as day_of_week, count(username) as c from users
group by day_of_week
order by c DESC
LIMIT 3;

-- B) Investor Metrics:


-- 1 User Engagement:

with t as (select user_id, count(*) as no_of_photos from photos group by user_id)
select avg(no_of_photos) as average_no_of_posts from t;


 -- Provide the total number of photos on Instagram divided by the total number of users.

select (select count(*) from photos) / (select count(*) from users) as Total_Engagement_rate;


-- 2 Bots & Fake Accounts: 


with t1 as(select l.user_id, u.username, count(photo_id) no_of_photos_likes from likes l join users u on l.user_id = u.id 
group by l.user_id)
select * from t1 where no_of_photos_likes = (select count(*) from photos);



























