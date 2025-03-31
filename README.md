# Cow wisdom web server
#  Wisecow Application - Kubernetes Deployment with CI/CD

This project automates the **containerization and deployment** of the **Wisecow** application using **Docker, Kubernetes, and GitHub Actions CI/CD pipeline**. It ensures seamless **build, push, and deploy** operations with **secure TLS communication** via Ingress.


## Features

- Automated CI/CD Pipeline: GitHub Actions build and deploy the application on every code push.

- Containerization: The application is packaged as a Docker container.

- Kubernetes Deployment: Uses manifests for deployment, service exposure, and ingress.

- TLS Security: Implements secure HTTPS communication.

- Version Control: Automatically updates the deployed version with new commits.

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use locally?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

## ⚙️ **Project Workflow**

###  **1. Containerization**
- The application is **packaged into a Docker container**.
- A **Dockerfile** is provided to build the image.

### **2. Kubernetes Deployment && Ingress setup that supports secure TLS communication**
## After building and pushing the Docker image, deploy the application using Kubernetes manifests:  
-  Define the **Wisecow application deployment**, specifying replicas, container image, and resource limits.
- Exposed the application internally within the cluster via a **ClusterIP** or externally using **NodePort**.
- Deployed the AWS load balancer controller that watches for the Ingress resource for routing and and secures access with **TLS encryption**


###  **3. CI/CD Pipeline (GitHub Actions)**
- **On push to `main` branch**, GitHub Actions:
  - Builds a **Docker image** of the application.
  - Pushes it to **Docker Hub** (or GitHub Container Registry).
  - Deploys the updated application to the **Kubernetes cluster**.
    
 
