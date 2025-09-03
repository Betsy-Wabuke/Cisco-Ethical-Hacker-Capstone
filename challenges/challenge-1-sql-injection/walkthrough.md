# Challenge 1: SQL Injection

## Objective
Exploit an SQL injection vulnerability on the DVWA server at `10.5.5.12` to retrieve Bob Smith's credentials, crack his password, and access the flag file on `192.168.0.10`.

## Step 1: Preliminary Setup
1. Open a browser and navigate to `http://10.5.5.12` (remove `https://` if needed).
2. Log in with credentials: `admin` / `password`.
3. Set DVWA security level to **Low** and click Submit.

## Step 2: Retrieve Bob Smith's Credentials
- [SQL Commands](./code.sql)
1. **Check for SQL Vulnerability**:
   - Navigate to the SQL Injection tab.
   - In the User ID field, enter: `' OR 1=1 #`
   - **Output**: Displays all user data, confirming SQL injection vulnerability.
   - Screenshot: ![SQL Vulnerability](./screenshots/image4.png)
...
- Screenshot: ![Field Count](./screenshots/image2.png)
- Screenshot: ![DBMS Version](./screenshots/image5.png)
- Screenshot: ![Database Name](./screenshots/image10.png)
- Screenshot: ![Table Names](./screenshots/image8.png)
- Screenshot: ![Column Names](./screenshots/image3.png)
- Screenshot: ![Credentials](./screenshots/image11.png)
- Screenshot: ![Cracked Password](./screenshots/image9.png)
- Screenshot: ![Flag File](./screenshots/image1.png)