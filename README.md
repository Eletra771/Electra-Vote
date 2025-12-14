# Electra-Vote
It is online voting system with face ditection created by RupX Lab
✨ Overview
ElectraVote is a secure, decentralized online voting system that integrates deep learning-based facial recognition for voter authentication. This project addresses critical challenges in traditional voting systems by providing a secure, accessible, and fraud-resistant digital voting platform.

**🎯 What Problem Does It Solve?
Traditional voting systems suffer from:**

✅ Security Vulnerabilities - Impersonation, duplicate voting

✅ Accessibility Issues - Remote voters, elderly, disabled individuals

✅ High Operational Costs - Paper ballots, polling stations, manpower

✅ Slow Results - Manual counting delays

💡 Our Solution
ElectraVote implements a CNN-based Siamese Network for facial verification that ensures:

One Person, One Vote - Through biometric authentication

Remote Accessibility - Vote from anywhere with internet

Real-time Results - Instant counting and analysis

Cost-Effective - Eliminates physical infrastructure

**🚀 Key Features
🔐 Security & Authentication**
Facial Biometric Verification - CNN-based with 98.7% accuracy

Liveness Detection - Prevents photo/video spoofing

Multi-Metric Comparison - Dot product, L1 distance, element-wise multiplication

End-to-End Encryption - AES-256 for vote security

Audit Trail - Complete transaction logging
**
🎨 User Experience**
Responsive Web Interface - Works on mobile/desktop

Intuitive Registration - Step-by-step guided process

Real-time Face Capture - Instant verification feedback

Admin Dashboard - Comprehensive election management

Multi-language Support - Accessibility for all users

**📊 Administration**
Election Creation - Customizable voting parameters

Voter Management - Bulk registration and verification

Real-time Analytics - Live participation monitoring

Result Computation - Instant vote counting

Export Capabilities - Reports in PDF/Excel formats

**🏗️ Architecture**

┌─────────────────────────────────────────────────────────┐
│                    ElectraVote System Architecture      │
├─────────────────────────────────────────────────────────┤
│  Frontend Layer       │  Backend Layer    │  AI Layer   │
│  ┌──────────────┐    │ ┌─────────────┐   │ ┌─────────┐ │
│  │   React      │─────▶│ Spring Boot │────▶│ FastAPI │ │
│  │   Bootstrap  │    │ │  Java 17    │   │ │ Python  │ │
│  │   HTML/CSS   │    │ │ PostgreSQL  │   │ │TensorFlow│ │
│  └──────────────┘    │ └─────────────┘   │ └─────────┘ │
└──────────────────────┼───────────────────┼─────────────┘
                       │                   │
                ┌──────▼──────┐    ┌──────▼──────┐
                │   Voter     │    │   Admin     │
                │  Portal     │    │  Dashboard  │
                └─────────────┘    └─────────────┘

**Face Verification Pipeline**
1. Face Capture → 2. MTCNN Detection → 3. Face Alignment 
   ↓
4. CNN Feature Extraction → 5. Embedding Generation (128D)
   ↓
6. Similarity Computation → 7. Decision (Match/No Match)

**🛠️ Tech Stack
Frontend**
HTML5/CSS3 - Semantic markup and styling

JavaScript - Interactive features

Bootstrap 5 - Responsive design framework

Chart.js - Data visualization

**Backend**
Java Spring Boot - REST API development

PostgreSQL - Relational database

Spring Security - Authentication & authorization

JPA/Hibernate - Object-relational mapping

**AI/ML Component**
Python 3.9 - Machine learning runtime

TensorFlow 2.8 - Deep learning framework

FastAPI - High-performance API framework

OpenCV - Image processing

MTCNN - Face detection and alignment

**DevOps & Tools**
Docker - Containerization

Postman - API testing

Git - Version control

Maven - Build automation
**📁 Project Structure**
electravote/
│
├── frontend/                 # Web interface
│
├── backend/                  # Java Spring Boot
│
├── face-verification/       # Python AI service
│
├── database/                # SQL scripts
│
├── docs/                    # Documentation
│   ├── api/
│   ├── architecture/
│   └── user_manual/
│
       # Container orchestration
├── README.md               # This file
└── LICENSE

**⚡ Quick Start**
Prerequisites
Java 17 or higher

Python 3.9 or higher

PostgreSQL 14 or higher

Node.js 16 or higher (for frontend)

Docker & Docker Compose (optional)
