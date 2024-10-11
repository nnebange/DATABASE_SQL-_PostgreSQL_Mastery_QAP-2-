--creating a student table

CREATE TABLE students (
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 email VARCHAR(100),
 enrollment_date DATE
);

-- creating professors table 
CREATE TABLE professors (
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 department VARCHAR(100)
);

--creating table for courses 
CREATE TABLE courses (
 id INT PRIMARY KEY AUTO_INCREMENT,
 course_name VARCHAR(100),
 course_description TEXT,
 professor_id INT,
 FOREIGN KEY (professor_id) REFERENCES professors(id)
);

--Creating enrollment table 
CREATE TABLE enrollments (
 student_id INT,
 course_id INT,
 enrollment_date DATE,
 PRIMARY KEY (student_id, course_id),
 FOREIGN KEY (student_id) REFERENCES students(id),
 FOREIGN KEY (course_id) REFERENCES courses(id)
);
--inserting 5 rows of data into student table 
Insert Data
INSERT INTO students (first_name, last_name, email, enrollment_date)
VALUES
 ('John', 'Doe', 'john.doe@example.com', '2022-01-01'),
 ('Jane', 'Doe', 'jane.doe@example.com', '2022-01-05'),
 ('Bob', 'Smith', 'bob.smith@example.com', '2022-01-10'),
 ('Alice', 'Johnson', 'alice.johnson@example.com', '2022-01-15'),
 ('Mike', 'Williams', 'mike.williams@example.com', '2022-01-20');

 --inserting 4 rows of data into professors table
INSERT INTO professors (first_name, last_name, department)
VALUES
 ('Emily', 'Chen', 'Physics'),
 ('David', 'Lee', 'Mathematics'),
 ('Sarah', 'Taylor', 'Computer Science'),
 ('Kevin', 'White', 'Biology');

 --inserting 3 rows of data into courses table
INSERT INTO courses (course_name, course_description, professor_id)
VALUES
 ('Physics 101', 'Introduction to Physics', 1),
 ('Math 202', 'Calculus II', 2),
 ('CS 303', 'Data Structures', 3);

 --inserting 5 rows of data into enrollments table 
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
 (1, 1, '2022-01-05'),
 (1, 2, '2022-01-10'),
 (2, 1, '2022-01-15'),
 (3, 3, '2022-02-01'),
 (4, 2, '2022-02-05');

 -- Retrieve full names of students enrolled in "Physics 101"
select course_name, CONCAT(s.first_name,' 's.last_name) as full_name from student s
join enrollment e on s.id = e.student_id 
join courses c on e.course_id = c.id
where c.course_name = 'Physics 101';

--Retrieve list of courses with professor's full name.

select c.course_name,CONCAT(p.first_name,' 'p.last_name) as professor_name from courses c 
join professors p on c.professor_id = p.id;

--Retrieve courses with students enrolled.
select c.course_name from courses c join enrollments e on c.id = e.course_id;


-- Update Data 
update students
   set email= 'john.doe2@emaple.com' 
 where id = 1;

 -- Delete data 

 delete from students
  where id = 2;