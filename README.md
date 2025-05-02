School Reporting Infrastructure – Snowflake + S3

1. Desired Architecture

This architecture supports mission-critical reporting and dashboards for a school district web portal. It enables teachers, students, parents, and administrators to interact with academic data and multimedia resources efficiently while maintaining scalability, performance, and governance.

🧊 Core Components

🔹 Source Systems

LMS (Learning Management System): Tracks attendance, assignments, grades.

SIS (Student Information System): Contains master data on students, courses, and schools.

Web Portal: Facilitates file uploads, course access, and session logs.

🔄 ETL/ELT Pipeline

Airflow / dbt / Fivetran: Responsible for extracting raw data from sources, transforming it into dimensional models, and loading it into the Snowflake data warehouse.

📦 Storage

Amazon S3: Stores multimedia files such as videos, PDFs, and documents uploaded by teachers and students.

Snowflake Data Warehouse: Stores all analytical data in a dimensional schema optimized for reporting.

🧱 Dimension & Fact Tables

Dimensions: dim_user, dim_school, dim_course, dim_time, dim_multimedia

Facts: fact_student_performance, fact_assignment_submissions, fact_teacher_uploads, fact_user_sessions, fact_file_activity, fact_parent_logins

📊 BI Layer

Tableau, Looker, Power BI: Connected directly to Snowflake to visualize KPIs, trends, and engagement metrics across roles.

🔐 Security & Governance

RBAC (Role-Based Access Control): Enforces secure access by user role.

Secure Views: Limit visibility by department or user type.

Signed URLs: Allow secure access to S3-hosted files with expiration.

2. Questions for the Client

To further tailor the data architecture and model to the district’s goals, the following questions should be addressed:

General Understanding

What are the key KPIs you expect to track across schools?

Who are the main users of the reporting dashboards (admin, teacher, parent)?

What is the expected data refresh frequency (e.g., daily, real-time)?

User Roles and Permissions

Can one user have multiple roles (e.g., parent & teacher)?

Should parents or students have access to any personalized dashboards?

Are all users authenticated through a centralized system (e.g., SSO)?

File & Multimedia

What types of files are expected (PDF, MP4, images, etc.)?

Do files need versioning or tagging for course association?

Should file access be tracked and audited for compliance?

Reporting & Visuals

Are you interested in drill-down reports by student, class, or district?

Should dashboards compare grade trends, attendance, or engagement over time?

Are mobile dashboards or exports (PDF/CSV) a requirement?

Compliance & Scaling

Are there any FERPA, COPPA, or GDPR considerations?

Do you anticipate onboarding new schools or regions in the future?

Should the system support multiple school districts (multi-tenancy)?

3. DB Diagram

The data model is designed using a dimensional (star schema) approach for optimized reporting.

📘 Dimension Tables

dim_user: Users and roles (student, teacher, parent, etc.)

dim_school: School metadata

dim_course: Class metadata and teacher relationships

dim_time: Calendar and semester breakdown

dim_multimedia: File metadata and S3 URL references

📊 Fact Tables

fact_student_performance: Grades and attendance

fact_assignment_submissions: Homework and due dates

fact_teacher_uploads: Teaching resources by course

fact_user_sessions: Login activity

fact_file_activity: Uploads, downloads, deletions

fact_parent_logins: Portal access and engagement

The schema supports slicing and aggregation by role, date, school, and course—enabling robust KPI tracking and drill-down analysis across the district.

