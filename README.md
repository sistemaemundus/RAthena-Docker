# Overview
This repository has been utilized as a practical learning environment for the automation of Docker instance deployment, as well as the integration and automation of Continuous Integration (CI) processes with Git.

## Contributors
- [florentortiz](https://github.com/florentortiz)
- [Mido-tw](https://github.com/Mido-tw)

## RAthena Docker Configuration - Version 20190605
This section details the pre-configured setup for the deployment of a Docker container. The container includes a Ragnarok Online server, FluxCP, MySQL, PHPMyAdmin, and a Web Client (RoBrowser + WSProxy).

## Using This Repository
To use this repository, first ensure you have Docker and Docker Compose installed on your system. Then, follow these steps:

1. Download the latest release version from the repository.
2. Navigate to the directory where the `docker-compose.yml` file is located.
3. Execute the command `docker-compose up -d` in your terminal.

This will start the services defined in the Docker Compose configuration in detached mode, running them in the background.

### Access Points
- **RoBrowser:** [http://localhost:22000](http://localhost:22000)
- **PHPMyAdmin:** [http://localhost:8080](http://localhost:8080)
- **FluxCP:** [http://localhost:8081](http://localhost:8081)

## Access Credentials
Secure access credentials are provided below for database and application management.

### Database Access
- **Database Name:** ragnarok
- **Username:** ragnarok
- **Password:** ragnarok

### FluxCP Installation
- **Installation Password:** secretpassword