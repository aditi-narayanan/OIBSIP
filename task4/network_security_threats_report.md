# Network Security Threats Report<br/>

## Table of Contents<br/>

#### 1.)Introduction<br/>

#### 2.)Denial-of-Service (DoS) Attacks<br/>

2.1 How It Works<br/>

2.2 Impact<br/>

2.3 Real-World Example<br/>

2.4 Mitigation Measures<br/>

#### 3.)Man-in-the-Middle (MITM) Attacks<br/>

3.1 How It Works<br/>

3.2 Impact<br/>

3.3 Real-World Example<br/>

3.4 Mitigation Measures<br/>

#### 4.)Spoofing Attacks<br/>

4.1 How It Works<br/>

4.2 Impact<br/>

4.3 Real-World Example<br/>

4.4 Mitigation Measures<br/>

#### 5.)Conclusion<br/>

#### 6.)References<br/>



## 1. Introduction

In the digital age, networks are the backbone of communication and data exchange. However, they are vulnerable to various security threats that can compromise data integrity, confidentiality, and availability. This report focuses on three common network security threats: Denial-of-Service (DoS) attacks, Man-in-the-Middle (MITM) attacks, and spoofing. We explore how these threats operate, their impact, real-world examples, and possible mitigation strategies. The goal is to provide readers with an in-depth understanding of each threat and equip them with best practices for prevention and response.

## 2. Denial-of-Service (DoS) Attacks

### 2.1 How It Works

A Denial-of-Service (DoS) attack is designed to shut down a machine or network, making it inaccessible to its intended users by overwhelming the target with a flood of internet traffic. In a more advanced form, known as Distributed Denial-of-Service (DDoS), attackers use multiple compromised systems (often infected with malware) to send excessive requests to the target system simultaneously. This creates a massive surge of traffic that exceeds the target’s capacity to respond.

Attackers typically exploit vulnerabilities in servers, routers, or IoT (Internet of Things) devices to form a botnet — a network of infected machines under their control — to amplify the attack.

![Image](https://github.com/user-attachments/assets/4e8c4769-9265-4862-93d3-a6292708339a)

#### The image illustrates how multiple compromised systems (bots) are coordinated by an attacker to flood a target server with overwhelming traffic in a Distributed Denial-of-Service (DDoS) attack.

### 2.2 Impact

Service Disruption: Users are unable to access websites or applications.<br/>

Revenue Loss: E-commerce sites or financial services can lose significant income during downtime.<br/>

Reputation Damage: Customer trust may erode following a successful attack.<br/>

Operational Costs: Costs increase due to incident response, mitigation tools, and potential legal liabilities.<br/>

### 2.3 Real-World Example

GitHub Attack (2018): In February 2018, GitHub suffered a 1.35 Tbps DDoS attack using misconfigured memcached servers. Attackers sent small queries to these servers with a spoofed IP address pointing to GitHub, which then responded with massive volumes of traffic — up to 50 times the original request. This amplification overwhelmed GitHub's infrastructure. Fortunately, GitHub employed Akamai Prolexic's DDoS mitigation service, which rerouted and filtered the traffic, effectively neutralizing the attack within 20 minutes. 

### 2.4 Mitigation Measures

Firewalls and Intrusion Prevention Systems (IPS): Detect and block malicious traffic patterns.<br/>

Rate Limiting: Restricts the number of requests a user can make in a certain time frame.<br/>

Load Balancing and Redundancy: Spreads traffic across multiple servers.<br/>

Cloud-Based DDoS Protection: Services like Cloudflare and AWS Shield offer scalable DDoS mitigation.<br/>

Incident Response Planning: Prepares organizations to detect and respond quickly.<br/>

## 3. Man-in-the-Middle (MITM) Attacks

### 3.1 How It Works

A Man-in-the-Middle (MITM) attack occurs when an attacker secretly intercepts and potentially alters communication between two parties who believe they are directly communicating with each other. Common techniques include:<br/>

Address Resolution Protocol (ARP) Spoofing: Attacker sends fake ARP messages to link their MAC address to the IP address of a legitimate device.<br/>

Domain Name System (DNS) Spoofing: Redirects users to malicious websites by corrupting the DNS resolver cache.<br/>

Session Hijacking: Attacker steals a user's session ID to impersonate them.<br/>

MITM attacks can occur over unsecured Wi-Fi networks or via compromised routers and network switches.<br/>

![Image](https://github.com/user-attachments/assets/33d403da-3e8b-4968-b03b-3363a5683542)

#### The image shows a Man-in-the-Middle (MITM) attack where an attacker intercepts and relays data between a client and server without their knowledge.

### 3.2 Impact

Data Theft: Confidential data like login credentials, credit card numbers, or personal messages can be stolen.<br/>

Unauthorized Transactions: Especially damaging in online banking or e-commerce.<br/>

Brand Erosion and Legal Risks: Organizations may face regulatory scrutiny after data breaches.<br/>

### 3.3 Real-World Example

Equifax Breach (2017): Although not a textbook MITM attack, this incident included behaviors MITM attackers exploit. Hackers took advantage of a vulnerability in Apache Struts (CVE-2017-5638) to gain entry into Equifax’s network. Once inside, attackers moved laterally through internal systems and exfiltrated data undetected for months. Internal communications lacked sufficient encryption and segmentation, enabling surveillance and data theft typical of MITM-style attacks. The breach exposed sensitive data of over 147 million Americans.

### 3.4 Mitigation Measures

HTTPS and TLS (Transport Layer Security): Ensures encrypted communications.<br/>

VPNs (Virtual Private Networks): Encrypt data even over insecure networks.<br/>

Multi-Factor Authentication (MFA): Adds extra verification layers beyond passwords.<br/>

Network Monitoring and Segmentation: Detects anomalies and limits attacker movement.<br/>

Public Key Infrastructure (PKI): Ensures trusted identities for all endpoints.<br/>

## 4. Spoofing Attacks

### 4.1 How It Works

Spoofing attacks involve an attacker pretending to be a trusted source to gain unauthorized access or mislead users. Key types include:<br/>

Internet Protocol (IP) Spoofing: Alters the packet's source IP to disguise its origin.<br/>

Email Spoofing: Forges email headers to appear as if sent from a trusted source.<br/>

DNS Spoofing: Redirects queries to malicious IP addresses.<br/>

These attacks are often used to facilitate phishing, malware delivery, or to bypass firewalls and authentication mechanisms.<br/>

![Image](https://github.com/user-attachments/assets/3ac51395-8668-4fde-adba-779d1ced68f6)

#### The image illustrates an IP spoofing attack where the attacker sends packets to a web server using a forged source IP address, making it appear as though they originate from a spoofed victim.

### 4.2 Impact

Security Breaches: Access to restricted systems or networks.<br/>

Spread of Malware: Through seemingly legitimate communications.<br/>

Loss of Data Integrity: Alteration or deletion of data.<br/>

Customer Confusion and Trust Issues: Especially damaging in spoofed emails from known brands.<br/>

### 4.3 Real-World Example

Twitter Bitcoin Scam (2020): Attackers used social engineering, phishing, and internal email spoofing to compromise Twitter’s internal tools. By impersonating Twitter staff, attackers accessed admin panels and hijacked high-profile accounts including Elon Musk, Barack Obama, and Apple. They posted tweets promoting a Bitcoin scam that led users to send over $100,000 to fraudulent wallets. The incident highlighted how spoofing and weak internal controls can be exploited at scale.

### 4.4 Mitigation Measures

Email Authentication Protocols:<br/>

SPF (Sender Policy Framework): Verifies that email servers are authorized.<br/>

DKIM (DomainKeys Identified Mail): Ensures the integrity of email content.<br/>

DMARC (Domain-based Message Authentication, Reporting, and Conformance): Enforces email policies and provides reporting.<br/>

DNS Security Extensions (DNSSEC): Validates the authenticity of DNS records.<br/>

Anti-Spoofing Filters: Detect and block spoofed packets.<br/>

Security Awareness Training: Empowers users to recognize spoofing attempts.<br/>

## 5. Conclusion

Network security threats such as DoS, MITM, and spoofing attacks are not only common but also highly damaging if left unaddressed. The evolving sophistication of attackers demands proactive security measures at every layer of the network. Organizations must invest in prevention tools, continuous monitoring, and user training to build a resilient security posture. A combination of technical solutions, policy enforcement, and informed personnel is essential for long-term cybersecurity.

## 6. References

Cloudflare: What is a DDoS attack?<br/>

OWASP: Man-in-the-Middle Attack<br/>

US-CERT: Spoofing and Sniffing Attacks<br/>

GitHub Engineering Blog: DDoS attack analysis<br/>

Equifax: Data Breach Announcement<br/>

Twitter Blog: Incident Report<br/>

Imperva: What is Email Spoofing?<br/>
