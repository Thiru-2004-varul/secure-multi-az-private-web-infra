<<<<<<< HEAD
# secure-multi-az-private-web-infra
=======
# Secure Multi-AZ Private Web Infrastructure (Terraform – Plan Only)

## What This Project Is About

This project is my take on building a **secure, highly available web infrastructure on AWS** using Terraform. The twist: everything is **plan-only**, so nothing is actually deployed. This lets me focus on **design, security, and architecture** without worrying about costs.  

The project is built **step by step**, adding each piece carefully so I can explain **why it’s needed** — perfect for interviews. I wanted to show that I know how to think like an engineer, not just copy-paste code from tutorials.

---

## Key Highlights

- **Multi-AZ setup**: Everything runs across two availability zones for high availability.  
- **Private EC2 instances**: The servers never face the public internet directly.  
- **Public ALB**: Single entry point for users, routing traffic securely to private EC2.  
- **NAT gateways**: Let private instances access the internet safely.  
- **Security groups**: ALB and EC2 have separate groups, implementing a zero-trust model.  
- **Auto Scaling**: Automatically scales private EC2 instances based on load.  
- **Ubuntu 22.04 AMI**: Shows that I know how to configure launch templates with real AMIs.

---

## How I Built It

- **Phase 1:** Set up Terraform with provider, version constraints, and variables.  
- **Phase 2:** Created a VPC with DNS enabled. Learned why VPC is the blast radius.  
- **Phase 3:** Created public and private subnets across 2 AZs.  
- **Phase 4:** Set up routing tables: IGW for public, NAT for private.  
- **Phase 5:** Added NAT gateways in public subnets for secure outbound internet access.  
- **Phase 6:** Designed security groups: ALB open to the world, EC2 only allows ALB traffic.  
- **Phase 7:** Built the ALB, target group, and listener. Configured health checks.  
- **Phase 8:** Created a launch template with Ubuntu 22.04, configured ASG in private subnets, and connected it to the ALB.

---

## Why This Matters

By doing this project I can **talk confidently in interviews** about:

- How private instances reach the internet safely using NAT.  
- Why you never expose EC2 directly to the internet.  
- How ALB, target groups, and health checks keep applications highly available.  
- How to write modular, production-level Terraform without incurring AWS costs.  

---

>>>>>>> dce39fd (Add README, Terraform configuration, variables, and CI workflow)
