# Terraform Minecraft Server

This Terraform project automates the deployment of a Minecraft server on the Vultr cloud platform. It utilizes Terraform for infrastructure provisioning and Ansible for configuration management. Additionally, it supports integrating with Cloudflare for DNS management and using a custom domain.

## Prerequisites

- Terraform version 1.7.3 or later
- Vultr account with an API key
- Cloudflare (optional, for DNS management)

## Setup Instructions

1. Clone the Repository
2. Copy **terraform.tfvars.example** to **terraform.tfvars**
3. In **terraform.tfvars** set *vultr_api_key*
4. **(Optional for Cloudflare DNS)** 
- set *cloudflare* to `true`
- set *cloudflare_api_key* and *cloudflare_zone_id*
5. Initialize terraform
```
cd terraform
terraform init
```
6. Review Terraform execution plan
```
terraform plan
```
7. Apply Terraform changes
```
terraform apply
```
8. Once the deployment is complete, you will receive information about IP adress
9. If you want server to stop (!it will remove saves!)
```
terraform destroy
```
