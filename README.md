# AWS Infrastructure Deployment with Terraform

Complete cloud infrastructure automation using Terraform, AWS, Docker, and Linux for deploying a containerized Flask application.

## 🏗️ Architecture

```
Internet → AWS VPC → Security Groups → EC2 (Ubuntu) → Docker → Flask Application
```

## 🛠️ Tech Stack

- **Terraform** - Infrastructure as Code (IaC)
- **AWS** - Cloud Platform (EC2, VPC, Security Groups, IAM)
- **Docker** - Application Containerization
- **Linux** - Ubuntu Server Management
- **Flask** - Python Web Application
- **Bash** - Automation Scripts

## 📋 What This Project Does

This project demonstrates end-to-end cloud infrastructure automation:

1. ✅ Automated AWS EC2 infrastructure provisioning using Terraform
2. ✅ Configured security groups for SSH (port 22) and application access (port 5000)
3. ✅ Secure SSH authentication using PEM key pairs
4. ✅ Docker installation and container deployment on cloud server
5. ✅ Flask application deployment from Docker Hub
6. ✅ Public application hosting with port mapping
7. ✅ Infrastructure lifecycle management with `terraform destroy`

## 🚀 Deployment Process

### Prerequisites

- AWS Account (Free Tier eligible)
- Terraform installed locally
- AWS CLI configured
- SSH client

### Step 1: Configure AWS Credentials

```bash
# Configure AWS CLI with your credentials
aws configure

# Enter:
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region (e.g., ap-south-1 for Mumbai)
# - Output format (json)
```

### Step 2: Initialize Terraform

```bash
# Clone repository
git clone https://github.com/Gurmann11/terraform-aws-infrastructure.git
cd terraform-aws-infrastructure

# Initialize Terraform (downloads AWS provider)
terraform init
```

### Step 3: Deploy Infrastructure

```bash
# Preview changes
terraform plan

# Deploy resources
terraform apply

# Type 'yes' when prompted
# Note the public IP address from output
```

### Step 4: Connect to EC2 Instance

```bash
# SSH into EC2 instance
ssh -i <your-key.pem> ubuntu@<PUBLIC_IP>

# Update package manager
sudo apt update
```

### Step 5: Install Docker

```bash
# Install Docker
sudo apt install docker.io -y

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
docker --version
```

### Step 6: Deploy Flask Application

```bash
# Pull Flask app from Docker Hub
docker pull guru1213/flask-app

# Run container with port mapping
docker run -d -p 5000:5000 guru1213/flask-app

# Verify container is running
docker ps
```

### Step 7: Access Application

```bash
# Open in browser:
http://<PUBLIC_IP>:5000

# You should see "DevSecOps Security Pipeline Running"
```

### Step 8: Cleanup Resources

```bash
# Destroy all created resources (IMPORTANT: Avoid AWS charges)
terraform destroy

# Type 'yes' when prompted
```
### 1. Terraform Apply Success
<img src="screenshots/terraform-apply.png" width="600">

### 2. AWS EC2 Running Instance  
<img src="screenshots/ec2-instance.png" width="600">

### 3. Flask App Live on AWS
<img src="screenshots/flask-app-live.png" width="600">

## 🎯 Key Learnings

Through this project, I gained hands-on experience with:

✅ **Infrastructure as Code (IaC)** - Automating cloud provisioning with Terraform  
✅ **AWS Cloud Services** - EC2, VPC, Security Groups, IAM  
✅ **Linux System Administration** - Ubuntu server management, package installation  
✅ **Container Deployment** - Docker installation, image management, container orchestration  
✅ **Network Security** - Security group configuration, SSH authentication, port management  
✅ **DevOps Workflow** - Complete deployment lifecycle from code to production  
✅ **Cost Management** - Infrastructure cleanup and AWS Free Tier optimization  

## 📁 Repository Structure

```
terraform-aws-infrastructure/
├── main.tf                 # Terraform configuration
├── screenshots/            # Project documentation images
│   ├── terraform-apply.png
│   ├── ec2-instance.png
│   └── flask-app-live.png
└── README.md              # Project documentation
```

## 💰 Cost Optimization

- **t2.micro instance** - AWS Free Tier eligible (750 hours/month)
- **Automated cleanup** - `terraform destroy` removes all resources
- **No idle resources** - Infrastructure created only when needed
- **Security best practices** - Minimal open ports, SSH key authentication

## 🔮 Future Enhancements

- [ ] Add Terraform variables file (`variables.tf`) for configuration
- [ ] Implement Terraform outputs file (`outputs.tf`) for IP/DNS
- [ ] Add CloudWatch monitoring and alarms
- [ ] Implement Auto Scaling for high availability
- [ ] Add Application Load Balancer for traffic distribution
- [ ] Store Terraform state in S3 backend for team collaboration
- [ ] Add user-data script for automated Docker installation
- [ ] Implement CI/CD pipeline for infrastructure updates

## ⚠️ Important Notes

1. **Always run `terraform destroy`** after testing to avoid AWS charges
2. **Never commit AWS credentials** to version control
3. **Use IAM users with minimal permissions** for security
4. **Restrict SSH access** to your IP address in production
5. **Monitor AWS billing** regularly to avoid unexpected charges

## 📝 What Makes This Project Different

Unlike basic "hello world" deployments, this project demonstrates:

- **Real-world workflow** - Complete deployment from infrastructure to application
- **Security awareness** - SSH keys, security groups, proper authentication
- **Cost consciousness** - Free Tier usage, cleanup automation
- **Documentation** - Step-by-step reproducibility
- **Best practices** - IaC, containerization, automation

## 🔗 Related Projects

- [DevSecOps Security Pipeline](https://github.com/Gurmann11/devsecops-security-pipeline) - Multi-layer security scanning in CI/CD

## 📧 Contact

**Gurmann Singh Dhillon**  
📍 Kalamboli, Navi Mumbai  
📧 gurmanndhillon84@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/gurmanndhillon)  
💻 [GitHub](https://github.com/Gurmann11)

---

**Project Status:** ✅ Completed  
**Last Updated:** May 2026
