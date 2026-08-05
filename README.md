# Terraform for DevOps

Provision a production-style AWS infrastructure using **Terraform** and configure a private EC2 instance using **Ansible**.

This project demonstrates how Infrastructure as Code (Terraform) and Configuration Management (Ansible) work together to automate server provisioning and software installation in AWS.

---

# Architecture

```
                        Internet
                            │
                            ▼
                  Internet Gateway (IGW)
                            │
          ┌─────────────────┴─────────────────┐
          │                                   │
          ▼                                   ▼
     Public Subnet                      Private Subnet
          │                                   │
          ▼                                   ▼
  Public EC2 (Bastion)                 Private EC2
          │                                   │
          └──────────── SSH ──────────────────►
                                              │
                                              ▼
                                            Nginx
```

The private EC2 instance does not have a public IP address. Ansible connects to it through the public EC2 (Bastion Host) using SSH ProxyJump.

---

# Features

- Custom AWS VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Public and Private Route Tables
- Security Groups
- Public EC2 (Bastion Host)
- Private EC2
- Dynamic Ubuntu 24.04 AMI selection
- Automatic Python installation using EC2 User Data
- Ansible configuration through SSH ProxyJump
- Automatic Nginx installation
- Custom web page deployment

---

# Project Structure

```text
terraform-for-devops/
│
├── ansible/
│   ├── files/
│   │   └── index.html
│   ├── inventory.ini.example
│   └── playbook.yml
│
├── data.tf
├── ec2.tf
├── elastic-ip.tf
├── internet-gateway.tf
├── nat-gateway.tf
├── outputs.tf
├── provider.tf
├── route-table.tf
├── security-group.tf
├── subnet.tf
├── terraform.tf
├── variables.tf
├── vpc.tf
│
├── .gitignore
└── README.md
```

---

# Technologies Used

- AWS EC2
- AWS VPC
- AWS NAT Gateway
- AWS Internet Gateway
- AWS Security Groups
- Terraform
- Ansible
- Ubuntu Server 24.04
- Nginx
- SSH ProxyJump

---

# Deployment Workflow

## 1. Clone the repository

```bash
git clone https://github.com/rahulmoorthy786/terraform-for-devops.git
cd terraform-for-devops
```

---

## 2. Initialize Terraform

```bash
terraform init
```

---

## 3. Review the execution plan

```bash
terraform plan
```

---

## 4. Provision the infrastructure

```bash
terraform apply
```

Terraform creates:

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Public EC2
- Private EC2

---

## 5. Update the Ansible inventory

Copy:

```text
inventory.ini.example
```

to

```text
inventory.ini
```

Update:

- Public EC2 IP
- Private EC2 IP

---

## 6. Load the SSH key

```bash
eval "$(ssh-agent -s)"

ssh-add terra-key
```

---

## 7. Test connectivity

```bash
ansible -i ansible/inventory.ini private_servers -m ping
```

Expected output:

```text
private-ec2 | SUCCESS => {
    "ping": "pong"
}
```

---

## 8. Run the playbook

```bash
ansible-playbook -i ansible/inventory.ini ansible/playbook.yml
```

The playbook will:

- Update APT packages
- Install Nginx
- Start and enable the Nginx service
- Deploy a custom HTML page

---

# Verification

SSH to the private EC2 through the Bastion Host:

```bash
ssh -J ubuntu@<PUBLIC_IP> -i terra-key ubuntu@<PRIVATE_IP>
```

Verify Nginx:

```bash
systemctl status nginx
```

Verify the deployed page:

```bash
curl http://localhost
```

Expected output:

```html
<h1>Deployment Successful</h1>
<p>This EC2 instance was provisioned with Terraform and configured with Ansible.</p>
```

---

# Why a Bastion Host?

The application server is deployed in a private subnet and does not have a public IP address.

Instead of exposing the private server to the Internet, Ansible connects through a Bastion Host using SSH ProxyJump.

This is a common approach for securely managing private infrastructure.

---

# What I Learned

Through this project I learned:

- Building a custom AWS VPC using Terraform
- Designing public and private subnet architectures
- Configuring Internet and NAT Gateways
- Managing Route Tables and Security Groups
- Using Terraform Data Sources for dynamic Ubuntu AMIs
- Bootstrapping EC2 instances with User Data
- Connecting to private instances using a Bastion Host
- Configuring servers with Ansible
- Deploying applications automatically with Ansible Playbooks
- Understanding Infrastructure as Code and Configuration Management together

---

# Future Improvements

- Terraform Remote State (S3)
- State Locking
- Terraform Modules
- Dynamic Ansible Inventory
- Docker deployment with Ansible
- Application Load Balancer (ALB)
- Auto Scaling Group
- GitHub Actions CI/CD

---

# Cleanup

To remove all AWS resources:

```bash
terraform destroy
```

---

# Author

**Rahul Thandavmoorthy**

Cloud & DevOps Engineer

GitHub: https://github.com/rahulmoorthy786
