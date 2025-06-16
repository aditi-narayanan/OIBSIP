# Nikto Scan Analysis: 192.168.56.101

## To install nikto type the following command

sudo apt install nikto

## Scan Summary

- **Server:** Apache/2.2.8 (Outdated)
- **PHP Version:** 5.2.4-2ubuntu5.10 (Outdated)
- **Port:** 80
- **Directory Indexing:** Enabled on multiple paths
- **Security Headers:** Largely missing

---

## Key Vulnerabilities and Misconfigurations

### 1. 🔴 Outdated Software
- Apache 2.2.8 is outdated and EOL (Latest in 2.x: 2.2.34).
- PHP 5.2.4 is deprecated and contains multiple known vulnerabilities.

**Mitigation:** Upgrade to supported versions of Apache (≥ 2.4.54) and PHP (≥ 7.4 or 8.x).

---

### 2. 🟠 Missing Security Headers
- `X-Frame-Options`: Not set, allowing potential clickjacking attacks.
- `X-Content-Type-Options`: Not set, allowing MIME sniffing attacks.

**Mitigation:** Configure the web server to include these headers.

---

### 3. 🔴 HTTP TRACE Enabled
- TRACE method is active → vulnerable to Cross Site Tracing (XST).

**Mitigation:** Disable TRACE in Apache (`TraceEnable Off`).

---

### 4. 🟠 phpinfo.php Exposed
- Publicly accessible `phpinfo.php` reveals system internals (e.g., paths, config).

**Mitigation:** Remove or restrict access to `phpinfo.php`.

---

### 5. 🔴 phpMyAdmin Accessible
- Found multiple phpMyAdmin files and directories exposed.
- Contains files like `ChangeLog`, `README`, and `Documentation`.

**Mitigation:** Restrict access to `phpMyAdmin` via IP whitelisting, authentication, or VPN.

---

### 6. 🟡 Sensitive Query String Responses
- URLs with special query strings leak sensitive info:
  - `?=PHPE9568F36-D428...`, etc.
- These are PHP Easter Eggs revealing logos, credits, and internal data.

**Mitigation:** Disable `expose_php` in `php.ini`.

---

### 7. 🟠 Directory Browsing Enabled
- Directories such as `/doc/`, `/icons/`, `/test/`, and `/phpMyAdmin/` are browsable.

**Mitigation:** Disable directory listing via `.htaccess` or Apache config.

---

### 8. 🟡 Mod_negotiation Enabled
- `MultiViews` feature allows filename brute-force via content negotiation.

**Mitigation:** Disable `MultiViews` where not needed.

---

### 9. 🔴 Sensitive File Found
- `#wp-config.php#`: A backup or autosave of WordPress config with DB credentials.

**Mitigation:** Remove any backup/config files from web root.

---

## Summary of Risk

| Risk Level | Findings |
|------------|----------|
| 🔴 Critical | Outdated Apache/PHP, phpMyAdmin exposed, TRACE enabled |
| 🟠 High     | Directory indexing, missing security headers, exposed `phpinfo` |
| 🟡 Medium   | Sensitive query strings, uncommon HTTP headers |
| 🟢 Low      | Apache default files, test directories |

---

## Recommendations

- Patch and update all outdated software.
- Remove or restrict access to sensitive files (`phpinfo.php`, `wp-config.php#`).
- Apply secure HTTP headers.
- Disable directory browsing and HTTP TRACE.
- Harden Apache config (e.g., disable `MultiViews`).
- Limit access to admin tools like `phpMyAdmin`.

## Scan Output

![Image](https://github.com/user-attachments/assets/cb69df51-d0e7-4c55-96b2-816b87f0eded)

## Demo Video

https://github.com/user-attachments/assets/64b7324b-ede4-4e41-875d-380abb919347

