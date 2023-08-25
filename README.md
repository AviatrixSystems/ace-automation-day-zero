![ACE Automation Speciality](docs/images/ace-automation-banner.png)

## Summary

The Aviatrix Certified Engineer Multicloud Network Automation Specialty (IaC) course brings the concepts of DevOps together by automating network infrastructure through hands-on labs. The training includes solved walkthrough guides of each lab. Students can expect to enter the training with no coding background and complete the training with an understanding of how to use IaC tools (GitHub and Terraform Cloud) to build, enhance, and secure cloud networks at scale in an automated fashion.

## Course Format and System Requirements

The ACE Automation Specialty course is in a virtual, self-paced format with lecture content, demos, and 3 hands-on labs.

Duration: 4 Hours

### Course Objectives

- Automate secure cloud networks using the Aviatrix cloud network platform and the principles of DevOps and Infrastructure as Code
- Collaborate with other stakeholders in your organization by building CI/CD pipelines to apply a very common use case in the cloud – Egress Security

### Intended Audience

- DevOps Teams
- SecOps Teams
- NetSecOps Teams
- Operations Teams
- Infrastructure Teams

### Network Topology

This repository builds out the following infrastructure for the Aviatrix ACE Automation course:

- Aviatrix Transit in AWS
- Aviatrix Spoke(s) in AWS
- Aviatrix Spoke in Azure
- Ubuntu VMs with password authentication (1 per spoke)
- Aviatrix Network Segmentation (2 network domains)

![Topology](docs/images/intro-topology.png)

### Software Requirements

| Component                   | Version                    |
| --------------------------- | -------------------------- |
| Aviatrix Controller         | UserConnect-7.1.1906 (7.1) |
| Aviatrix Terraform Provider | ~> 3.1.0                   |
| Terraform                   | > 1.2.0                    |
| AWS Terraform Provider      | ~> 5.0                     |

### Prerequisites

- An ACE Associate certificate.
- An Aviatrix Controller deployed to AWS using the [Aviatrix Self-Service tool](https://selfservice.aviatrix.com).
- Sufficient AWS EIPs for region in scope.
- A [GitHub](https://github.com) account.
- A [Terraform Cloud](https://app.terraform.io) account.
