# Cow wisdom web server -  Problem statement-1
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
    
 
# Problem statement-2 

# System Health Check Script

This is a simple Bash script that performs a system health check by monitoring key system metrics: CPU usage, memory usage, disk space, and the number of running processes. It logs any potential issues, such as high resource usage, to a log file located in the user's home directory (system_health.log`).

## Features

- **CPU Usage**: Checks if the CPU usage exceeds 80%.
- **Memory Usage**: Checks if memory usage exceeds 80%.
- **Disk Space**: Checks if the disk space usage exceeds 80%.
- **Running Processes**: Checks if the number of running processes exceeds 200.

## How it works

1. **Log File**: The script creates a log file called `system_health.log` in the home directory to store the results of the health check.
2. **Log Messages**: Each time a threshold is exceeded (e.g., high CPU or memory usage), a message is logged with a timestamp.
3. **Commands Used**:
   - `top`: For checking CPU usage.
   - `free`: For checking memory usage.
   - `df`: For checking disk space.
   - `ps`: For counting running processes.
4. **Alert Thresholds**:
   - CPU usage > 80%
   - Memory usage > 80%
   - Disk space usage > 80%
   - Running processes > 200


# Web Server Log Analysis Script

This is a Bash script designed to analyze web server logs (e.g., Apache or Nginx) and generate a report summarizing key statistics such as the total number of requests, 404 errors, most requested pages, and the top IP addresses making requests.