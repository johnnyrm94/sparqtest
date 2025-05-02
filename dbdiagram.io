Diagram: https://dbdiagram.io/d/Sparq-Challenge-68146eab1ca52373f52d9c2a

Code that generates the diagram:

Table dim_school {
  school_id integer [primary key]
  name varchar
  district varchar
}

Table dim_user {
  user_id integer [primary key]
  name varchar
  email varchar
  role varchar [note: 'student, teacher, parent, clerk']
  school_id integer
}

Table dim_course {
  course_id integer [primary key]
  title varchar
  grade_level varchar
  teacher_id integer
}

Table dim_time {
  date_id integer [primary key]
  full_date date
  day_of_week varchar
  month integer
  year integer
  semester varchar
}

Table dim_multimedia {
  media_id integer [primary key]
  user_id integer
  file_type varchar [note: 'pdf, image, video']
  course_id integer
  file_url varchar
}


Table fact_student_performance {
  id integer [primary key]
  user_id integer
  course_id integer
  date_id integer
  grade float
  attendance_flag varchar [note: 'P, A, L']
}

Table fact_assignment_submissions {
  id integer [primary key]
  student_id integer
  course_id integer
  date_id integer
  submission_status varchar [note: 'on_time, late, missing']
  grade float
}



Table fact_teacher_uploads {
  id integer [primary key]
  teacher_id integer
  course_id integer
  date_id integer
  file_type varchar
  file_size_mb float
}



Table fact_parent_logins {
  id integer [primary key]
  parent_id integer
  date_id integer
  session_start timestamp
  session_end timestamp
}




Table fact_file_activity {
  id integer [primary key]
  user_id integer
  media_id integer
  action varchar [note: 'upload, download, delete']
  date_id integer
}

Table fact_user_sessions {
  session_id integer [primary key]
  user_id integer
  date_id integer
  session_start timestamp
  session_end timestamp
  pages_viewed integer
}


// FK

Ref: dim_school.school_id > dim_user.school_id
Ref: dim_user.user_id > dim_course.teacher_id
Ref: dim_user.user_id > dim_multimedia.user_id
Ref: dim_course.course_id > dim_multimedia.course_id

Ref: dim_user.user_id > fact_student_performance.user_id
Ref: dim_course.course_id > fact_student_performance.course_id
Ref: dim_time.date_id > fact_student_performance.date_id

Ref: dim_user.user_id > fact_assignment_submissions.student_id
Ref: dim_course.course_id > fact_assignment_submissions.course_id
Ref: dim_time.date_id > fact_assignment_submissions.date_id

Ref: dim_user.user_id > fact_teacher_uploads.teacher_id
Ref: dim_course.course_id > fact_teacher_uploads.course_id
Ref: dim_time.date_id > fact_teacher_uploads.date_id

Ref: dim_user.user_id > fact_parent_logins.parent_id
Ref: dim_time.date_id > fact_parent_logins.date_id

Ref: dim_user.user_id > fact_file_activity.user_id
Ref: dim_multimedia.media_id > fact_file_activity.media_id
Ref: dim_time.date_id > fact_file_activity.date_id

Ref: dim_user.user_id > fact_user_sessions.user_id
Ref: dim_time.date_id > fact_user_sessions.date_id
