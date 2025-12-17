create database StudentResult;
use studentResult;
create table Students (StudentID int  primary key, Name varchar(255), Department varchar(255), Year int);
create table Subjects (SubjectID int primary key, SubjectName varchar(255), Credits int);
create table Marks(MarkID int, StudentID int, foreign key(studentID)REFERENCES Students(studentID), SubjectID int,foreign key(SubjectID)REFERENCES Subjects(SubjectID), Marks int);
INSERT INTO Students (StudentID, Name, Department, Year) VALUES
(1, 'Anu', 'Computer Science', 2),
(2, 'Rahul', 'Computer Science', 3),
(3, 'Meera', 'Electronics', 1),
(4, 'Arjun', 'Electronics', 2),
(5, 'Kavya', 'Mechanical', 4),
(6, 'Suresh', 'Mechanical', 3);
INSERT INTO Subjects (SubjectID, SubjectName, Credits) VALUES
(101, 'Data Structures', 4),
(102, 'Mathematics', 4),
(103, 'Digital Electronics', 3);
INSERT INTO Marks (MarkID, StudentID, SubjectID, Marks) VALUES
-- Anu (Good scorer)
(1, 1, 101, 88),
(2, 1, 102, 82),
(3, 1, 103, 85),

-- Rahul (Average)
(4, 2, 101, 75),
(5, 2, 102, 70),
(6, 2, 103, 72),

-- Meera (Topper)
(7, 3, 101, 92),
(8, 3, 102, 90),
(9, 3, 103, 94),

-- Arjun (Mixed)
(10, 4, 101, 65),
(11, 4, 102, 58),
(12, 4, 103, 60),

-- Kavya (Low but pass)
(13, 5, 101, 45),
(14, 5, 102, 48),
(15, 5, 103, 42),

-- Suresh (FAILED in all 3 subjects ❌)
(16, 6, 101, 30),
(17, 6, 102, 28),
(18, 6, 103, 35);

#Get top 3 students in each subject
Select s.StudentID,sb.SubjectID,m.Marks,s.Name
FROM marks as m  inner join Students as s on s.StudentID=m.StudentID
inner join Subjects as sb on sb.SubjectID=m.SubjectID
where sb.SubjectID=101
ORDER BY m.Marks DESC limit 3; 
Select s.StudentID,sb.SubjectID,m.Marks,s.Name
FROM marks as m  inner join Students as s on s.StudentID=m.StudentID
inner join Subjects as sb on sb.SubjectID=m.SubjectID
where sb.SubjectID=102
ORDER BY m.Marks DESC limit 3; 
Select s.StudentID,sb.SubjectID,m.Marks,s.Name
FROM marks as m  inner join Students as s on s.StudentID=m.StudentID
inner join Subjects as sb on sb.SubjectID=m.SubjectID
where sb.SubjectID=103
ORDER BY m.Marks DESC limit 3; 
#Calculate average marks per department
Select s.Department,AVG(m.Marks) as average_marks
from Students as s 
join marks as m on s.StudentID=m.StudentID
GROUP BY s.department;
#Find students who failed in more than 2 subjects
select
s.StudentID,s.Name,s.Department,count(m.SubjectID) as failed_subjects
from students as s
JOIN marks as  m on m.StudentID=s.StudentID
WHERE m.Marks<60
GROUP BY s.StudentID,s.Name having count(m.SubjectID)>2;





