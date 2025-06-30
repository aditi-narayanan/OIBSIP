# Discovery and Mitigation of SQL Injection Vulnerability in DVWA 

## Vulnerability Discovery

### Manual Input Fuzzing

During initial testing, the `id` parameter in the URL was manually fuzzed using a basic SQL payload: http://<target-ip>/dvwa/vulnerabilities/sqli/?id='&Submit=Submit

The server returned a MySQL error message:

You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version...

This indicated that the input was being directly injected into a SQL query without sufficient sanitization or parameterization, confirming a SQL Injection vulnerability.

---
## Exploitation

### Pre-Exploitation Setup

- **Application**: DVWA (Damn Vulnerable Web Application)
- **Security Level**: Medium
- **Tools Used**: Firefox, Burp Suite, sqlmap
- **Authentication**: Logged into DVWA with a valid session cookie

### Configuration Steps

1. **Configure Firefox to Use Burp Suite as Proxy**:
   - Firefox → Settings → Network Settings → Manual proxy configuration
   - Set HTTP Proxy to `127.0.0.1` and Port `8080`

2. **Intercept Login in Burp Suite**:
   - Launch Burp Suite and enable interception
   - Log into DVWA and capture the login request and session cookie

3. **Run the Automated Exploit Script**:
   ./sql_injection_exploit.sh <url> <cookie>

---

## Root Cause Analysis of SQL Injection Vulnerability

### Vulnerable PHP Code

```php
$id = $_GET['id'];
$id = mysql_real_escape_string($id);
$getid = "SELECT first_name, last_name FROM users WHERE user_id = $id";
```

- mysql_real_escape_string() escapes special characters but does not prevent SQL injection when the input is numeric.
- The $id is inserted into the SQL query without quotes, so payloads like 1 OR 1=1 are interpreted as valid SQL.
- This allows attackers to modify query logic and retrieve unauthorized data.

##  Patching the Vulnerability

### Step 1: Input Validation

Ensure that only numeric values are accepted:

```php
if (!ctype_digit($id)) {
    die("Invalid ID.");
}
```

### Step 2: Use PDO with Prepared Statements

Use parameterized queries to safely interact with the database.
#### Secure PHP Code Using PDO

```php
<?php
if (isset($_GET['Submit'])) {

    $id = $_GET['id'];

    // Step 1: Validate numeric input
    if (!ctype_digit($id)) {
        die("Invalid ID.");
    }

    try {
        // Step 2: Secure PDO connection
        $pdo = new PDO('mysql:host=localhost;dbname=dvwa', 'dvwa_user', 'dvwa_pass');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Step 3: Parameterized query
        $stmt = $pdo->prepare("SELECT first_name, last_name FROM users WHERE user_id = ?");
        $stmt->execute([$id]);

        // Step 4: Secure output
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo '<pre>';
            echo 'ID: ' . htmlentities($id) . '<br>First name: ' . htmlentities($row['first_name']) . '<br>Surname: ' . htmlentities($row['last_name']);
            echo '</pre>';
        }

    } catch (PDOException $e) {
        die("Database error.");
    }
}
?>
```
### Patch Analysis

| Mitigation Element | Purpose |
|--------------------|---------|
| `ctype_digit()`     | Validates that the input contains only digits |
| `PDO::prepare()`    | Prevents SQL Injection by using placeholders |
| `execute([$id])`    | Binds user input as data, not as executable SQL code |
| `htmlentities()`    | Escapes output to prevent XSS attacks |
| `try/catch block`   | Handles exceptions securely and avoids leaking internal details |


## Conclusion
The SQL injection vulnerability in DVWA (medium security) was caused by improper handling of user input in an SQL query. By validating input and using prepared statements, the vulnerability was effectively mitigated.
