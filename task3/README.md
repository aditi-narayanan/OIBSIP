To perform an SQL injection attack on DVWA (Damn Vulnerable Web Application) using a shell script with sqlmap, you first need to start the Metasploit virtual machine and open DVWA in a browser such as Mozilla Firefox using the VM's IP address. 
After logging in with default credentials (admin / password), navigate to the "DVWA Security" tab and set the security level to "Low". 
Then, go to the "SQL Injection" section, enter a numeric ID in the input field (like 1), but do not submit it yet. 
Next, configure your browser to use a proxy by setting it to manual configuration with the HTTP proxy set to 127.0.0.1 and port 8080. 
Launch Burp Suite and make sure intercept is turned on. Now submit the ID in DVWA, and Burp Suite will intercept the HTTP request. 
In the intercepted request, copy the full URL (including parameters like id=1&Submit=Submit) and the session cookie from the headers. 
Use these two pieces of information to run your shell script by executing the command: ./sql_injection_exploit.sh "<intercepted_url>" "<copied_cookie>".
The purpose of the sql_injection_exploit.sh script is to automate an SQL injection attack on the vulnerable DVWA endpoint using sqlmap. 
The script first checks if exactly two arguments are provided—the target URL and the session cookie. If not, it prints usage instructions and exits. 
It then stores the first argument as the URL and the second as the cookie. 
These variables are then used to construct a sqlmap command that performs the actual attack.
The -u flag is used to specify the URL that contains the vulnerable SQL injection parameter (such as id=1&Submit=Submit), and the --cookie flag provides the session cookie necessary to authenticate the request as a logged-in user. 
The --batch option ensures that sqlmap runs in non-interactive mode, automatically accepting default choices for any prompts, which makes the script suitable for automated use. 
Finally, the --dbs option tells sqlmap to enumerate and list all the databases present on the backend database server if the injection is successful.
Overall, the script simplifies the process of conducting an SQL injection attack by combining required input validation, session handling, and payload execution in a single automated command.

Exploiting SQL injection in DVWA (low security) Demo video:
