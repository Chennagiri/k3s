# k3s CI/CD Deployment on AWS EC2

## Overview
This project demonstrates automated deployment to a k3s Kubernetes cluster running on AWS EC2 using GitHub Actions.

## Architecture
Developer → GitHub → GitHub Actions → k3s Cluster (EC2) → Application exposed via NodePort

## Components
- AWS EC2 instance (Amazon Linux)
- k3s Kubernetes cluster
- Nginx sample application
- GitHub Actions CI/CD pipeline

## Deployment
On every push to main branch, GitHub Actions deploys the application to the k3s cluster.

## Access Application
http://<EC2-PUBLIC-IP>:30007

## Files
- hello-nginx.yaml — Kubernetes Deployment & Service
- deploy.yml — CI/CD workflow
