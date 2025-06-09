Firstly install the firewall using the command: sudo apt install ufw
Check the status of the firewall using the command: sudo ufw status numbered
Argument numbered is used to display rules with rule_number
Initially it'll be inactive.To activate it use the command: sudo ufw enable
Now check the status using the above given command which will show active
Check the applications supported by firewall using the command:sudo ufw app list
The above command will show that ssh and http are supported by the firewall 
By default, block all the incoming traffic and allow all the outgoing traffic
To  see detailed status of firewall use the command: sudo ufw status verbose
Here,I denied http traffic whose port number is 80 (for both incoming and outgoing)and allowed ssh traffic whose port number is 22
Write all the required commands in a shell script and give execution privilege
Http websites will open before running the script.When tried opening it after running the script it won't open because the firewall will block the traffic.
If you want to access http websites delete the rule using the command: sudo ufw delete rule_number
After deleting the rule http websites can be accessed.

Configuring Basic Firewall using UFW Demo Video:
