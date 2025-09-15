# Penetration Testing Report for Cisco Ethical Hacker Capstone Project

## Executive Summary

This penetration testing report documents the findings from the Cisco Ethical Hacker Capstone Project, a simulated ethical hacking engagement conducted as part of the Cisco Networking Academy's Ethical Hacker course. The assessment targeted simulated networks to identify and exploit vulnerabilities in a controlled environment using the Damn Vulnerable Web Application (DVWA) and other tools. The objective was to perform reconnaissance, scanning, exploitation, and post-exploitation activities to locate flag values across four challenges, while proposing remediation strategies.

Key findings include successful exploits of SQL injection, web server misconfigurations, open SMB shares, and packet capture analysis vulnerabilities. No actual harm was caused, as this was a lab-based simulation. Recommendations focus on implementing secure coding practices, access controls, and encryption to mitigate risks.

The test was conducted during  Cyber Shujaa Cisco Ethical Hacker  learning, using the Ethical-Hacker-Kali VM. Total flags captured: 4/4.

## Background and Scope

The scenario simulates a client-requested penetration test to evaluate security posture. Access was granted to the specified networks, with the goal of discovering vulnerabilities, exploiting them ethically, and reporting findings. The assessment followed the five stages of penetration testing: Reconnaissance, Scanning, Exploitation, Post-Exploitation, and Reporting.

Tools used:
- Nmap for scanning
- Nikto for web reconnaissance
- SQL injection tools (manual and automated)
- Enum4linux and smbclient for SMB enumeration
- Wireshark for PCAP analysis
- CrackStation password cracker 

Limitations: Testing was confined to the lab environment; no real-world systems were targeted.

## Methodology

The penetration test adhered to standard ethical hacking methodologies, including:
1. **Reconnaissance**: Gathering information about targets using passive and active techniques.
2. **Scanning**: Identifying open ports, services, and vulnerabilities.
3. **Exploitation**: Attempting to exploit identified weaknesses to gain access or extract data.
4. **Post-Exploitation**: Maintaining access and locating flags.
5. **Reporting**: Documenting findings and remediation.

All activities were performed in a virtual environment to ensure safety and compliance.

## Findings and Exploits

The assessment identified vulnerabilities across four challenges. Each is detailed below, including exploitation steps (high-level) and evidence.

### Challenge 1: SQL Injection
- **Description**: A web application at 10.5.5.12 was vulnerable to SQL injection due to lack of input sanitization.
- **Exploitation**:
  - Logged into DVWA with default credentials and set security to low.
  - Used SQL injection to retrieve user hashes   - Cracked the hash using CrackStation to obtain the password.
  - Accessed a flag file at 192.168.0.10 using the compromised credentials.
- **Severity**: High (potential for data leakage and unauthorized access).
- **Evidence**: Flag value captured.

### Challenge 2: Web Server Vulnerabilities
- **Description**: HTTP servers on the network allowed directory listings and exposed sensitive files.
- **Exploitation**:
  - Scanned the 10.6.6.100 network with Nmap to identify web servers.
  - Used the firefox browser  to enumerate directories (e.g., /docs, /config).
  - Employed Nikto to detect misconfigurations like missing security headers.
  - Located and downloaded a flag file from an exposed directory.
- **Severity**: Medium (risk of information disclosure).
- **Evidence**: Directory listing output; flag file contents.

### Challenge 3: Exploit Open SMB Server Shares
- **Description**: SMB servers permitted anonymous access to shares containing sensitive data.
- **Exploitation**:
  - Scanned for SMB services using Nmap.
  - Enumerated shares with enum4linux and smbclient.
  - Accessed an unsecured share and retrieved a flag file.
- **Severity**: High (unauthorized file access).
- **Evidence**: Share enumeration results; flag value.

### Challenge 4: Analyze a PCAP File
- **Description**: A packet capture file revealed clear-text transmissions and file locations.
- **Exploitation**:
  - Opened the SA.pcap file in Wireshark.
  - Filtered for HTTP traffic and followed TCP streams to identify URLs and IP addresses.
  - Navigated to the revealed URL to access a flag file.
- **Severity**: Medium (exposure of sensitive data in transit).
- **Evidence**: Wireshark stream output; flag file location.

| Challenge | Vulnerability Type | Severity | Exploit Success | Flag Captured |
|-----------|--------------------|----------|-----------------|---------------|
| 1        | SQL Injection     | High    | Yes            | Yes          |
| 2        | Web Misconfiguration | Medium | Yes            | Yes          |
| 3        | Open SMB Shares   | High    | Yes            | Yes          |
| 4        | PCAP Exposure     | Medium  | Yes            | Yes          |

## Recommendations and Remediation

For each vulnerability, the following high-level remediations are proposed based on best practices.

### Challenge 1: SQL Injection
- Use parameterized queries or stored procedures.
- Implement input validation and sanitization.
- Deploy a Web Application Firewall (WAF).
- Apply least privilege principles to database accounts.

### Challenge 2: Web Server Vulnerabilities
- Disable directory listings in server configurations.
- Add security headers (e.g., X-Frame-Options, X-Content-Type-Options).
- Restrict access to sensitive directories via .htaccess or equivalent.
- Regularly scan for misconfigurations using tools like Nikto.

### Challenge 3: Open SMB Shares
- Enforce strong authentication for SMB access.
- Disable anonymous logins.
- Use firewalls to restrict SMB ports (e.g., 445).
- Audit and monitor share permissions regularly.

### Challenge 4: Analyze a PCAP File
- Encrypt sensitive data in transit (e.g., use HTTPS).
- Implement Access Control Lists (ACLs) on servers.
- Avoid transmitting clear-text credentials.
- Use secure file transfer protocols like SFTP.

## Conclusion

This capstone project demonstrated practical application of ethical hacking skills, successfully identifying and exploiting vulnerabilities in a simulated environment. Implementing the recommended remediations will significantly enhance security. For further details on the course, refer to the Cisco Networking Academy resources.




