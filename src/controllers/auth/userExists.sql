SELECT *
FROM users
WHERE user.username=$1 AND user.password=$2;