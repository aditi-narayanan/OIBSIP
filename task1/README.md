
List of Open Ports & Significance


| Port         | Service     | Version / Notes            | Significance / Potential Risks                                                                                                   |
| ------------ | ----------- | -------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| **21/tcp**   | FTP         | vsftpd 2.3.4               | Legacy version with known vulnerabilities. Allows file transfers; often targeted for credential brute force or anonymous access. |
| **22/tcp**   | SSH         | OpenSSH 4.7p1              | Secure remote login, but older version. Ensure strong passwords and disable root login.                                          |
| **23/tcp**   | Telnet      | Linux telnetd              | Insecure remote login (unencrypted). Should be disabled and replaced by SSH.                                                     |
| **25/tcp**   | SMTP        | Postfix smtpd              | Mail server; can be abused for spam if misconfigured.                                                                            |
| **53/tcp**   | DNS         | ISC BIND 9.4.2             | Provides DNS services; known vulnerabilities in older BIND versions. Critical to secure.                                         |
| **80/tcp**   | HTTP        | Apache 2.2.8               | Web server; outdated version with known security issues.                                                                         |
| **111/tcp**  | RPCbind     | RPC #100000                | Maps RPC services; can be abused for information leakage or used in DoS attacks.                                                 |
| **139/tcp**  | NetBIOS-SSN | Samba smbd                 | File sharing (Windows/Samba). Often targeted by worms and ransomware.                                                            |
| **445/tcp**  | SMB         | Samba smbd                 | Critical for file sharing; common vector for lateral movement (e.g., EternalBlue exploit).                                       |
| **512/tcp**  | rexecd      | netkit-rsh rexecd          | Remote execution (unencrypted). Should be disabled.                                                                              |
| **513/tcp**  | login?      | Unknown                    | Legacy login service (unencrypted). High-risk if exposed.                                                                        |
| **514/tcp**  | rsh         | Netkit rshd                | Remote shell (unencrypted). Should be disabled.                                                                                  |
| **1099/tcp** | Java RMI    | GNU Classpath grmiregistry | Remote Java object management; can be used for remote code execution if not secured.                                             |
| **1524/tcp** | Bindshell   | Metasploitable root shell  | Intentional backdoor (root shell). HIGHLY dangerous if exposed.                                                                  |
| **2049/tcp** | NFS         | RPC                        | Network File System; exposes file shares. Must be well-secured.                                                                  |
| **2121/tcp** | FTP         | ProFTPD 1.3.1              | Alternate FTP port; same risks as Port 21.                                                                                       |
| **3306/tcp** | MySQL       | MySQL 5.0.51a              | Database server; old version, vulnerable to SQL injection and privilege escalation.                                              |
| **5432/tcp** | PostgreSQL  | 8.3.0-8.3.7                | Database server; old version with known vulnerabilities.                                                                         |
| **5900/tcp** | VNC         | Protocol 3.3               | Remote desktop access; encryption usually not enabled.                                                                           |
| **6000/tcp** | X11         | Access denied              | GUI display protocol; can allow remote GUI hijacking if not secured.                                                             |
| **6667/tcp** | IRC         | UnrealIRCd                 | Internet Relay Chat; can be used as a C\&C (command and control) channel by malware.                                             |
| **8009/tcp** | AJP13       | Apache Jserv               | Backend connector; often exploited (e.g., Ghostcat vulnerability).                                                               |
| **8180/tcp** | HTTP        | Apache Tomcat/Coyote JSP   | Alternate HTTP; typically admin or dev interface—must be secured and updated.                                                    |
