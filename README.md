# LAMP Project

The LAMP project involves deploying a LAMP (Linux, Apache, MySQL, PHP) stack to AWS using Terraform for provisioning infrastructure and Ansible for configuration management. The project structure and key components are outlined below.

## Project Overview

The goal of this project is to deploy a LAMP stack on AWS, consisting of Linux as the operating system, Apache as the web server, MySQL as the database, and PHP for server-side scripting. This is achieved through the use of Terraform for provisioning AWS infrastructure, network components, and EC2 instances. Ansible is utilized to configure the EC2 instances, with one instance acting as the frontend (hosting PHP) and the other as the backend (MySQL database).

## Project Structure

The project structure is organized as follows:

```bash
.
├── playbooks
│   ├── ansible.cfg
│   ├── assets
│   │   └── db-load-script.sql
│   ├── db.yml
│   ├── frontend.yml
│   ├── inventory-aws_ec2.yml
│   ├── ping.yml
│   └── vars
│       └── variables.yml
└── servers
    ├── dev.tfvars
    ├── infrastructure
    │   ├── compute
    │   │   ├── ec2.tf
    │   │   ├── outputs.tf
    │   │   ├── ssh_key.tf
    │   │   └── variables.tf
    │   └── network
    │       ├── net.tf
    │       ├── outputs.tf
    │       ├── security_group.tf
    │       ├── subnet.tf
    │       ├── variables.tf
    │       └── vpc.tf
    ├── main.tf
    ├── provider.tf
    └── variables.tf
```

## Components

1. **playbooks**: This directory holds Ansible playbooks and related files for provisioning and configuring the LAMP stack on AWS instances.

   - **ansible.cfg**: Configuration file for Ansible settings and options.
   - **assets**: Contains assets like the `db-load-script.sql` which is a SQL script for loading data into the MySQL database.
   - **db.yml**: Ansible playbook for provisioning and configuring the MySQL database server.
   - **frontend.yml**: Ansible playbook for provisioning and configuring the frontend server with PHP and Apache.
   - **inventory-aws_ec2.yml**: Ansible dynamic inventory file that gathers information about AWS EC2 instances.
   - **ping.yml**: Ansible playbook to test connectivity to managed nodes.
   - **vars**: Holds variable files used in playbooks, such as `variables.yml` for defining configuration settings.
2. **servers**: This directory contains files related to Terraform provisioning of AWS infrastructure.

   - **infrastructure**: Subdirectory for Terraform configurations related to network and compute infrastructure.

     - **compute**: Holds Terraform configurations for provisioning EC2 instances.

       - **ec2.tf**: Defines AWS EC2 instances, specifying instance type, key pair, security group, etc.
       - **outputs.tf**: Specifies output values to display after Terraform execution.
       - **ssh_key.tf**: Configures SSH key for EC2 instances.
       - **variables.tf**: Declares input variables used in the compute module.
     - **network**: Contains Terraform configurations for networking components.

       - **net.tf**: Defines AWS networking resources like routes.
       - **vpc.tf**: Defines AWS VPC.
       - **outputs.tf**: Specifies output values related to networking.
       - **security_group.tf**: Configures security groups for EC2 instances.
       - **subnet.tf**: Defines subnets within the VPC.
       - **variables.tf**: Declares input variables used in the network module.
   - **main.tf**: Main Terraform configuration file specifying modules used for infrastructure provisioning.
   - **provider.tf**: Configures the AWS provider and credentials.
   - **variables.tf**: Declares common input variables used across Terraform configurations.

## Deployment

1. Use Terraform to provision the AWS infrastructure, including networking components and EC2 instances.
2. Ansible's dynamic inventory retrieves information about the provisioned EC2 instances.
3. Update the variable `db_host`  in playbook variables file with the private ip output of the db_node.
4. Execute Ansible playbooks to configure the EC2 instances: `db.yml` for MySQL backend and `frontend.yml` for Apache frontend with PHP.
5. The `db-load-script.sql` is used to initialize the MySQL database.
6. The LAMP stack is deployed and configured, ready to serve web applications.

Please refer to specific playbooks and configuration files for more details on how each component is deployed and configured.

**Note**: In this project, Ansible roles are not used, and the EC2 instances are directly configured using playbooks.
