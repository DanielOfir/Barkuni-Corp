# Barkuni-Corp

This repo includes everything that is needed to create an EKS cluster and deploy the "barkuni-app" REST API application.

## Features

- Usage of aws-load-balancer-controller to deploy an ALB (installed with Helm provider of Terraform)
- Added configs for Helm to deploy application with service of type LoadBalancer, for when aws-load-balancer-controller is not installed
- Github Actions workflow to build and push a new docker image to Dockerhub when merging to main

## Technologies Used

- Programming Language: Python
- Kubernetes Manifest: Helm
- Containerization: Docker
- CI/CD: GitHub Actions
- Cloud Provider: AWS
- IAC: Terraform
