# Secure Multi-AZ Private Web Infrastructure (Terraform)

## Project Overview

This project demonstrates how I designed and implemented a **secure, highly available AWS web infrastructure** using **Terraform**.

The infrastructure is **plan-only**, meaning no AWS resources are created. This allows me to showcase **real-world cloud architecture, Terraform skills, and security best practices** without incurring any cost.

---

## What I Implemented

In this project, I personally implemented the following:

- Designed a **custom VPC** with DNS support enabled
- Created **public and private subnets across multiple Availability Zones**
- Configured **Internet Gateway** for public subnets
- Configured **NAT Gateways per AZ** for secure outbound internet access from private subnets
- Implemented **route tables and associations** for correct traffic flow
- Built **zero-trust security groups** for ALB and EC2 instances
- Deployed an **Application Load Balancer** with health checks
- Created a **Launch Template** using Ubuntu AMI
- Configured an **Auto Scaling Group** in private subnets
- Automated **Terraform validation and plan** using GitHub Actions

---

## Architecture Summary

- Public Subnets:
  - Application Load Balancer
  - NAT Gateways

- Private Subnets:
  - EC2 instances managed by Auto Scaling Group

- Traffic Flow:
  - Internet → ALB → Private EC2
  - Private EC2 → NAT Gateway → Internet

This design ensures **high availability, security, and scalability**.

---

## Skills Demonstrated

This project demonstrates my knowledge of:

- AWS VPC, Subnets, Route Tables, IGW, NAT Gateway
- Application Load Balancer & Target Groups
- Auto Scaling Groups and Launch Templates
- Terraform variables, providers, and best practices
- Infrastructure as Code (IaC)
- Secure cloud networking design
- CI/CD automation using GitHub Actions

---

## Why I Built This Project

I built this project to:

- Practice **real-world AWS infrastructure design**
- Apply **Terraform best practices**
- Demonstrate **cloud security and high availability concepts**
- Create a **portfolio-ready project** for interviews

---

## How to Review This Project

This project is **plan-only ,To avoid cost on aws**.

To review:

```bash
terraform init
terraform plan
