# School Reporting Infrastructure – Snowflake + S3

This architecture supports mission-critical reporting and dashboards for a school district web portal. It enables teachers, students, parents, and administrators to interact with academic data and more.

---

## 🧊 Core Components

### 🔹 Source Systems
- **LMS (Learning Management System):** Tracks attendance, assignments, grades.
- **SIS (Student Information System):** Contains master data on students, courses, and schools.
- **Web Portal:** Facilitates file uploads, course access, and session logs.

### 🔄 ETL/ELT Pipeline
- **Airflow / dbt / Fivetran:** Extracts raw data from sources, transforms it into dimensional models, and loads it into the Snowflake data warehouse.

### 📦 Storage
- **Amazon S3:** Stores multimedia files (e.g., videos, PDFs, documents) uploaded by teachers and students.
- **Snowflake Data Warehouse:** Stores all analytical data in a dimensional schema optimized for reporting.

### 🧱 Dimension & Fact Tables
#### Dimension Tables:
- `dim_user`: Users and roles (student, teacher, parent, etc.)
- `dim_school`: School metadata
- `dim_course`: Class metadata and teacher relationships
- `dim_time`: Calendar and semester breakdown
- `dim_multimedia`: File metadata and S3 URL references

#### Fact Tables:
- `fact_student_performance`: Grades and attendance
- `fact_assignment_submissions`: Homework and due dates
- `fact_teacher_uploads`: Teaching resources by course
- `fact_user_sessions`: Login activity
- `fact_file_activity`: Uploads, downloads, deletions
- `fact_parent_logins`: Portal access and engagement

### 📊 BI Layer
- **Tools:** Tableau, Looker, Power BI
- **Purpose:** Visualizes KPIs, trends, and engagement metrics across roles.

### 🔐 Security & Governance
- **RBAC (Role-Based Access Control):** Enforces secure access by user role.
- **Secure Views:** Limits visibility by department or user type.
- **Signed URLs:** Allows secure access to S3-hosted files with expiration.

---

## ❓ Questions for the Client


### General Understanding
1. What are the key KPIs you expect to track across schools?
2. Who are the main users of the reporting dashboards (admin, teacher, parent)?
3. What is the expected data refresh frequency (e.g., daily, real-time)?

### User Roles and Permissions
1. Can one user have multiple roles (e.g., parent & teacher)?
2. Should parents or students have access to any personalized dashboards?
3. Are all users authenticated through a centralized system (e.g., SSO)?

### File & Multimedia
1. What types of files are expected (PDF, MP4, images, etc.)?
2. Do files need versioning or tagging for course association?
3. Should file access be tracked and audited for compliance?

### Reporting & Visuals
1. Are you interested in drill-down reports by student, class, or district?
2. Should dashboards compare grade trends, attendance, or engagement over time?
3. Are mobile dashboards or exports (PDF/CSV) a requirement?

### Compliance & Scaling
1. Are there any FERPA, COPPA, or GDPR considerations?
2. Do you anticipate onboarding new schools or regions in the future?
3. Should the system support multiple school districts (multi-tenancy)?

---

## 📘 DB Diagram


### Dimension Tables:
- **dim_user:** Users and roles (student, teacher, parent, etc.)
- **dim_school:** School metadata
- **dim_course:** Class metadata and teacher relationships
- **dim_time:** Calendar and semester breakdown
- **dim_multimedia:** File metadata and S3 URL references

### Fact Tables:
- **fact_student_performance:** Grades and attendance
- **fact_assignment_submissions:** Homework and due dates
- **fact_teacher_uploads:** Teaching resources by course
- **fact_user_sessions:** Login activity
- **fact_file_activity:** Uploads, downloads, deletions
- **fact_parent_logins:** Portal access and engagement


