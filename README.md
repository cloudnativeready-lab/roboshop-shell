# 🛒 RoboShop - E-commerce Microservices Application

A comprehensive e-commerce platform built with microservices architecture, featuring multiple services, databases, and message queues for a complete online shopping experience.

## 📋 Table of Contents
- [🏗️ Architecture Overview](#️-architecture-overview)
- [🔧 Services & Components](#-services--components)
- [📦 Deployment Scripts](#-deployment-scripts)
- [🗄️ Database Setup](#️-database-setup)
- [🚀 Quick Start Guide](#-quick-start-guide)
- [🔍 Service Details](#-service-details)
- [📊 System Requirements](#-system-requirements)
- [🛠️ Troubleshooting](#️-troubleshooting)

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        RoboShop Architecture                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐         │
│  │   Frontend  │    │    Nginx    │    │   Payment   │         │
│  │   (Static)  │◄──►│  (Reverse   │◄──►│   Service   │         │
│  │             │    │   Proxy)    │    │  (Python)   │         │
│  └─────────────┘    └─────────────┘    └─────────────┘         │
│                              │                    │             │
│                              ▼                    ▼             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐         │
│  │    User     │    │    Cart     │    │  Shipping   │         │
│  │  Service    │◄──►│  Service    │◄──►│  Service    │         │
│  │ (Node.js)   │    │ (Node.js)   │    │  (Java)     │         │
│  └─────────────┘    └─────────────┘    └─────────────┘         │
│         │                    │                    │             │
│         ▼                    ▼                    ▼             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐         │
│  │ Catalogue   │    │   Redis     │    │   MySQL     │         │
│  │  Service    │    │  (Cache)    │    │  (Orders)   │         │
│  │ (Node.js)   │    │             │    │             │         │
│  └─────────────┘    └─────────────┘    └─────────────┘         │
│         │                    │                    │             │
│         ▼                    ▼                    ▼             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐         │
│  │  MongoDB    │    │  RabbitMQ   │    │  Dispatch   │         │
│  │ (Products & │    │ (Message    │    │  Service    │         │
│  │   Users)    │    │  Queue)     │    │  (Go)       │         │
│  └─────────────┘    └─────────────┘    └─────────────┘         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## 🔧 Services & Components

### 🎯 Core Business Services

| Service | Technology | Purpose | Port | Database |
|---------|------------|---------|------|----------|
| **Frontend** | Static HTML/CSS/JS | User interface | 80 | - |
| **User Service** | Node.js | User management & authentication | 8080 | MongoDB |
| **Catalogue Service** | Node.js | Product catalog management | 8080 | MongoDB |
| **Cart Service** | Node.js | Shopping cart operations | 8080 | Redis |
| **Shipping Service** | Java (Spring Boot) | Order processing & shipping | 8080 | MySQL |
| **Payment Service** | Python (Flask) | Payment processing | 8080 | - |
| **Dispatch Service** | Go | Order dispatch notifications | - | - |

### 🗄️ Infrastructure Services

| Service | Purpose | Configuration |
|---------|---------|---------------|
| **Nginx** | Reverse proxy & load balancer | `nginx.conf` |
| **Redis** | Caching & session storage | Port 6379 |
| **MongoDB** | Document database for users & products | Port 27017 |
| **MySQL** | Relational database for orders | Port 3306 |
| **RabbitMQ** | Message queue for async communication | Port 5672 |

## 📦 Deployment Scripts

### 🚀 Service Deployment Scripts

#### **Frontend Setup** (`frontend.sh`)
```bash
# Purpose: Deploy the web frontend
# Key Actions:
# - Install Nginx 1.24
# - Configure reverse proxy
# - Deploy static files
```

#### **User Service** (`user.sh`)
```bash
# Purpose: Deploy user management service
# Key Actions:
# - Install Node.js 20
# - Setup MongoDB connection
# - Deploy user service
# - Initialize user database
```

#### **Catalogue Service** (`catalogue.sh`)
```bash
# Purpose: Deploy product catalog service
# Key Actions:
# - Install Node.js 20
# - Setup MongoDB connection
# - Deploy catalogue service
# - Initialize product database
```

#### **Cart Service** (`cart.sh`)
```bash
# Purpose: Deploy shopping cart service
# Key Actions:
# - Install Node.js 20
# - Setup Redis connection
# - Deploy cart service
```

#### **Shipping Service** (`shipping.sh`)
```bash
# Purpose: Deploy order processing service
# Key Actions:
# - Install Maven & Java
# - Setup MySQL connection
# - Deploy shipping service
# - Initialize order database
```

#### **Payment Service** (`payment.sh`)
```bash
# Purpose: Deploy payment processing service
# Key Actions:
# - Install Python 3 & dependencies
# - Deploy payment service
# - Setup uWSGI configuration
```

#### **Dispatch Service** (`dispatch.sh`)
```bash
# Purpose: Deploy order dispatch notifications
# Key Actions:
# - Install Go
# - Deploy dispatch service
# - Setup RabbitMQ integration
```

### 🗄️ Database Setup Scripts

#### **Redis Setup** (`redis.sh`)
```bash
# Purpose: Configure Redis cache server
# Key Actions:
# - Install Redis 7
# - Configure for external access
# - Enable and start service
```

#### **MySQL Setup** (`mysql.sh`)
```bash
# Purpose: Configure MySQL database server
# Key Actions:
# - Install MySQL Server
# - Secure installation
# - Set root password
```

#### **MongoDB Setup** (`mongodb.sh`)
```bash
# Purpose: Configure MongoDB document database
# Key Actions:
# - Install MongoDB
# - Configure for external access
# - Enable and start service
```

#### **RabbitMQ Setup** (`rabbitmq.sh`)
```bash
# Purpose: Configure message queue server
# Key Actions:
# - Install RabbitMQ
# - Create user and permissions
# - Enable and start service
```

## 🗄️ Database Setup

### 📊 Database Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Database Architecture                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────┐    ┌─────────────────┐                │
│  │    MongoDB      │    │     MySQL       │                │
│  │  (Document DB)  │    │ (Relational DB) │                │
│  ├─────────────────┤    ├─────────────────┤                │
│  │ • Users         │    │ • Orders        │                │
│  │ • Products      │    │ • Shipping      │                │
│  │ • Categories    │    │ • Inventory     │                │
│  └─────────────────┘    └─────────────────┘                │
│           │                        │                       │
│           ▼                        ▼                       │
│  ┌─────────────────┐    ┌─────────────────┐                │
│  │     Redis       │    │    RabbitMQ     │                │
│  │   (Cache DB)    │    │ (Message Queue) │                │
│  ├─────────────────┤    ├─────────────────┤                │
│  │ • Sessions      │    │ • Order Events  │                │
│  │ • Cart Data     │    │ • Notifications │                │
│  │ • Temp Data     │    │ • Async Tasks   │                │
│  └─────────────────┘    └─────────────────┘                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## 🚀 Quick Start Guide

### 📋 Prerequisites
- CentOS/RHEL 9 or compatible system
- Root access or sudo privileges
- Internet connectivity for package downloads
- Minimum 4GB RAM, 20GB storage

### 🔧 Installation Steps

1. **Setup Infrastructure Services**
   ```bash
   # Install databases and message queues
   ./redis.sh
   ./mysql.sh
   ./mongodb.sh
   ./rabbitmq.sh
   ```

2. **Deploy Core Services**
   ```bash
   # Deploy backend services
   ./user.sh
   ./catalogue.sh
   ./cart.sh
   ./shipping.sh
   ./payment.sh
   ./dispatch.sh
   ```

3. **Deploy Frontend**
   ```bash
   # Deploy web interface
   ./frontend.sh
   ```

4. **Verify Installation**
   ```bash
   # Check service status
   systemctl status nginx
   systemctl status user
   systemctl status catalogue
   systemctl status cart
   systemctl status shipping
   systemctl status payments
   systemctl status dispatch
   ```

## 🔍 Service Details

### 🎯 Service Responsibilities

#### **Frontend Service**
- **Purpose**: Provides the user interface for the e-commerce platform
- **Technology**: Static HTML/CSS/JavaScript served by Nginx
- **Key Features**: Product browsing, cart management, checkout process
- **Dependencies**: Nginx reverse proxy

#### **User Service**
- **Purpose**: Manages user accounts, authentication, and profiles
- **Technology**: Node.js with Express.js
- **Database**: MongoDB
- **Key Features**: User registration, login, profile management
- **Dependencies**: MongoDB, Redis (for sessions)

#### **Catalogue Service**
- **Purpose**: Manages product catalog and inventory
- **Technology**: Node.js with Express.js
- **Database**: MongoDB
- **Key Features**: Product listing, search, category management
- **Dependencies**: MongoDB

#### **Cart Service**
- **Purpose**: Handles shopping cart operations
- **Technology**: Node.js with Express.js
- **Database**: Redis (for fast cart operations)
- **Key Features**: Add/remove items, cart persistence, price calculation
- **Dependencies**: Redis, Catalogue Service (for product validation)

#### **Shipping Service**
- **Purpose**: Processes orders and manages shipping
- **Technology**: Java with Spring Boot
- **Database**: MySQL
- **Key Features**: Order processing, shipping calculations, inventory updates
- **Dependencies**: MySQL, Cart Service

#### **Payment Service**
- **Purpose**: Handles payment processing and transactions
- **Technology**: Python with Flask/uWSGI
- **Key Features**: Payment gateway integration, transaction processing
- **Dependencies**: Cart Service, User Service, RabbitMQ

#### **Dispatch Service**
- **Purpose**: Sends notifications and manages order dispatch
- **Technology**: Go
- **Key Features**: Email notifications, order status updates
- **Dependencies**: RabbitMQ (for message consumption)

### 🔄 Service Communication Flow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Frontend  │───►│    Nginx    │───►│   Services  │
└─────────────┘    └─────────────┘    └─────────────┘
                           │                    │
                           ▼                    ▼
                   ┌─────────────┐    ┌─────────────┐
                   │   RabbitMQ  │◄──►│  Databases  │
                   │ (Messages)  │    │ (Data)      │
                   └─────────────┘    └─────────────┘
```

## 📊 System Requirements

### 💻 Hardware Requirements
- **CPU**: 2+ cores
- **RAM**: 4GB minimum, 8GB recommended
- **Storage**: 20GB minimum
- **Network**: Stable internet connection

### 🖥️ Software Requirements
- **OS**: CentOS/RHEL 9 or compatible
- **Package Manager**: DNF
- **User**: Root or sudo access
- **Firewall**: Ports 80, 8080, 3306, 27017, 6379, 5672

### 🌐 Network Configuration
```bash
# Required open ports
80    - HTTP (Nginx)
8080  - Application services
3306  - MySQL
27017 - MongoDB
6379  - Redis
5672  - RabbitMQ
```

## 🛠️ Troubleshooting

### 🔍 Common Issues

#### **Service Not Starting**
```bash
# Check service status
systemctl status <service-name>

# Check logs
journalctl -u <service-name> -f

# Check configuration
systemctl daemon-reload
```

#### **Database Connection Issues**
```bash
# Test MongoDB connection
mongosh --host mongodb-dev.shr-eng.com

# Test MySQL connection
mysql -h mysql-dev.shr-eng.com -uroot -p

# Test Redis connection
redis-cli -h redis-dev.shr-eng.com
```

#### **Port Conflicts**
```bash
# Check port usage
netstat -tulpn | grep :8080

# Kill process using port
kill -9 <PID>
```

### 📝 Log Locations
- **Nginx**: `/var/log/nginx/`
- **Systemd Services**: `journalctl -u <service-name>`
- **MongoDB**: `/var/log/mongodb/`
- **MySQL**: `/var/log/mysqld.log`
- **Redis**: `/var/log/redis/`

### 🔧 Maintenance Commands
```bash
# Restart all services
systemctl restart nginx user catalogue cart shipping payments dispatch

# Check disk space
df -h

# Check memory usage
free -h

# Check running processes
ps aux | grep roboshop
```

### Non Functional Requirements
- Keep Code DRY (Don't Repeat Your code)
- Rerun shouldn't fail
- Password shouldn't hard-code

---

## 📞 Support

For issues and questions:
1. Check the troubleshooting section above
2. Review service logs for error messages
3. Verify network connectivity between services
4. Ensure all dependencies are properly installed

## 📄 License

This project is part of the RoboShop training environment for learning microservices architecture and DevOps practices.

