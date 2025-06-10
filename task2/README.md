Firstly, install the firewall using the command:
sudo apt install ufw

Check the status of the firewall using the command:
sudo ufw status numbered
The argument numbered is used to display rules with their rule numbers.

Initially, it will be inactive. To activate it, use the command:
sudo ufw enable

Now check the status again using the above command, which will show that it is active.

Check the applications supported by the firewall using the command:
sudo ufw app list
The above command will show that SSH and HTTP are supported by the firewall.

By default, block all incoming traffic and allow all outgoing traffic.

To see a detailed status of the firewall, use the command:
sudo ufw status verbose

Here, I denied HTTP traffic (port number 80) for both incoming and outgoing traffic, and allowed SSH traffic (port number 22).

Write all the required commands in a shell script and give it execution privileges.

HTTP websites will open before running the script. After running the script, they won't open because the firewall blocks the traffic.

If you want to access HTTP websites again, delete the rule using the command:
sudo ufw delete rule_number
After deleting the rule, HTTP websites can be accessed.

Configuring Basic Firewall using UFW Demo Video:

