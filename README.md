# 🚀 AWS Auto Scaling Project using Terraform

## 📘 Overview
This project demonstrates how to deploy a **highly available and scalable web application** on AWS using **Terraform**.  
It provisions EC2 instances behind an **Application Load Balancer (ALB)**, configured with **Auto Scaling Groups (ASG)** for automatic scaling based on CPU utilization.

---

## 🧱 Architecture
- **VPC** with two public subnets across different availability zones  
- **EC2 Launch Template** running Nginx web server  
- **Application Load Balancer (ALB)** to distribute traffic  
- **Auto Scaling Group** with CloudWatch alarms (scale in/out)  
- **Security Groups** for controlled access  

---

## ⚙️ Technologies Used
- AWS (EC2, ALB, Auto Scaling, CloudWatch, VPC)
- Terraform
- Nginx Web Server
- Ubuntu AMI

---

## 🪜 Steps to Deploy
1. Clone this repository:
   ```bash
   git clone https://github.com/PargiChandana/aws-autoscaling-project.git
2.Initialize Terraform:
terraform init
3.Review the plan:
terraform plan
4.Deploy:
terraform apply

📸 Screenshots
<img width="1695" height="1017" alt="Screenshot 2025-10-28 161218" src="https://github.com/user-attachments/assets/10be0cd5-e6bc-484a-80ac-d2251fc20375" />

<img width="630" height="61" alt="Screenshot 2025-10-28 155800" src="https://github.com/user-attachments/assets/d62d33e9-0434-44b1-ac91-67c672edf03b" />

<img width="1599" height="805" alt="Screenshot 2025-10-27 182928" src="https://github.com/user-attachments/assets/593b9e77-79c6-40fb-9d34-4d25ea468680" />





🔗 Connect

If you found this useful, connect with me on www.linkedin.com/in/chandanapargi






