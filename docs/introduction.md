# Introduction

The ACE Automation Specialty Training (Infrastructure as Code - IaC) brings the concepts of DevOps together by automating a secure multicloud network infrastructure through 3 hands-on labs.

## Pre-requisites

  ACE Associate certification
  Active AWS account
  Active Azure account
  Aviatrix Controller deployed in AWS. The training materials expect you have deployed your Controller using the Sandbox Starter Tool. If you use the Sandbox Starter Tool to deploy your Controller, keep in mind that it will also deploy a CoPilot instance.
  GitHub accounts (3). Sign up at https://github.com/signup. Sign in at https://github.com/login. You need to create 3 GitHub accounts for 3 separate roles (NetOps, DevOps, and SecOps). It is highly recommended to maintain separate browser login sessions for each of these 3 accounts. The accounts will be used in Lab 3.
  Terraform Cloud Organization account (1). Sign up at https://app.terraform.io/signup/account (read a tutorial here). Sign in at https://app.terraform.io/session. First-time users should click Start from scratch.

![TFC Setup](images/intro-tfc-1.png)

On the next page, specify a new Organization name within Terraform Cloud and click Create Organization.

![TFC Org](images/intro-tfc-2.png)

No coding experience is required.

There are 3 labs in this training, intended to be performed in sequence. Terraform is used as the base code for these labs. Many of Aviatrix's largest customers do not even visit the Aviatrix Controller UI. They perform every change in their infrastructure using Terraform. At no point in this training will you be making any changes on the Aviatrix Controller UI. This training is intended get you on the path of automating your multi-cloud network infrastructure.

## Recommended Localizations

While you could perform the tasks for these labs directly on the GitHub.com UI, there are certain localizations on your PC that we recommend for working in a larger environment and/or Production. These include:

Terraform - Even though you are issuing your Plans and Applies in Terraform Cloud, there are several benefits to having Terraform installed locally on your PC. 
git - Depending on the OS of your PC, there are several different ways to install
Integrated Development Environment (IDE) capable of connecting to GitHub. For this training, we recommend Visual Studio Code. Download it at https://code.visualstudio.com/download.

For this training, all these localizations are optional. We will be using the web interface for GitHub and Terraform (i.e. Terraform Cloud).

## Focus

Gain familiarity with tools at disposal for automating real-world multi-cloud networks
Only a subset of Aviatrix use cases will be covered

## Scenario

ACE Inc. is a fictitious company with infrastructure in AWS with 3 teams/stakeholders:

Network Operators, aka NetOps
Application Developers, aka DevOps
InfoSec team, aka SecOps

In Lab 1, you will deploy ACE's infrastructure from scratch as follows:

![Topology](images/intro-topology.png)

The infrastructure is built in AWS US East 2 region by default, although you can adjust the code to build it anywhere you want.

As shown in the diagram, inside the region, there are the following resources:

Transit VPC with single Aviatrix Transit Gateway
Spoke VPC with single Aviatrix Spoke Gateway for a workload called BU1 Bastion in a Network Domain called BU1. This host has a Public IP as well as a Private IP. You can SSH to it as ubuntu. Set a strong password.
Spoke VPC with single Aviatrix Spoke Gateway for a workload called BU2 App in a Network Domain called BU2. This host has only a Private IP. The Spoke Gateway is configured for Single IP Source NAT to allow egress traffic to the internet.
In Lab 2, you will configure a Connection Policy via Terraform to connect BU1 and BU2. At that point, you will be able to SSH to BU2 App by first connecting to BU1 Bastion Public IP.
In Lab 2, you will also resize the Aviatrix gateways via Terraform.
In Lab 3, you will collaborate with other stakeholders in ACE (Application Developers and InfoSec teams) to form a CI/CD pipeline for securing Egress traffic in BU2. And you will see the results of this in action when doing Lab 3 by filtering Egress traffic to certain FQDNs.

## A Note about Terraform State

Terraform maintains its view of the infrastructure in a file called Terraform state.

Note: Sandbox Starter Tool is an Aviatrix-developed tool that maintains its own Terraform State. However, one the goals of this training is to deploy cloud infrastructure via Terraform in a separate Terraform state file using tools that are more commonly used in production environments, such as Terraform Cloud.

There will be a total of 3 Terraform State files used during this training residing in these locations:

Sandbox Starter Tool
Terraform Cloud Workspace that is used for Labs 1 and 2
Terraform Cloud Workspace that is used for Lab 3

Important: To avoid excess CSP charges, the lifecycle of these State files should follow a Last-In-First-Out (LIFO) strategy. In other words, after deploying your Controller and CoPilot using Sandbox Starter Tool, you will carry out Labs 1, 2, and 3 in that sequence. However, when cleaning up your environment, you must destroy the resources in the reverse order with Lab 3 first, followed by Labs 1 and 2 (they share the same State file) before finally destroying your Controller and CoPilot created by the Sandbox Starter Tool. During the whole period of the training, the Sandbox Starter Tool instance must be Running and not in Stopped state or else you could lose your Terraform State file. If that happens, you will need to destroy your resources manually!

## Labs

### Lab  1 for Day 0 (Build)

VCS-driven workflow
Connect GitHub with Terraform Cloud
Write no code
Deploy infrastructure

### Lab 2 for Day 1 (Enhance)

VCS-driven workflow
Modify the Terraform code in Lab 1 to enhance existing infrastructure 

### Lab 3 for Day 2 (Secure)

API-driven workflow
Create, Automate, and Secure a GitHub Branch
Build a CI/CD pipeline
Apply use case for Egress security with IaC guardrails by collaborating with different stakeholders (Network Operators, Application Developers, Security)

When you are ready to begin, click here to begin Lab 1.
