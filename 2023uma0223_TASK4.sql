use universitydb;
SELECT s.StudentID, s.StudentName, d.DeptName
FROM students s
INNER JOIN departments d
    on s.StudentID = d. DeptID ;
    
Select c.CourseID , c.CourseName 
from courses c
INNER JOIN coursefaculty f
    on c.CourseID = f.CourseID;
    
#left outer join 
Select s.StudentName , s.ProgramID , p.ProgramName 
from students s 
LEFT JOIN programs p
   on s.ProgramID = p.ProgramID ;
   
#right joim
Select  h.HostelID,
       s.StudentID,
       s.StudentName,
       ha.RoomNo 
FROM  students s 
RIGHT JOIN Hostelallotment ha
       ON ha.studentID = s.studentID
 JOIN hostels h 
      ON ha.HostelID = h.HostelID;
      
#fully outer  
SELECT b.BookID , b.IssueID ,
s.StudentName , s.StudentID
FROM students s
FULL JOIN bookissues b
ON s.StudentID = b.StudentID ;

SELECT s.StudentID,
       s.StudentName,
       b.BookID,
       b.IssueID
FROM   students s
LEFT JOIN bookissues b
       ON s.StudentID = b.StudentID

UNION

SELECT s.StudentID,
       s.StudentName,
       b.BookID,
       b.IssueID
FROM   students s
RIGHT JOIN bookissues b
       ON s.StudentID = b.StudentID;
       
#aggregatw join
SELECT d.DeptName,
       COUNT(DISTINCT e.StudentID) AS total_students
FROM   Departments d
       LEFT JOIN Courses     c ON d.DeptID = c.DeptID
       LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DeptName;

SELECT c.CourseName,
       COUNT(e.StudentID) AS total_students,
       cf.FacultyID
FROM   Courses c
       LEFT JOIN Enrollments  e ON c.CourseID = e.CourseID
       LEFT JOIN CourseFaculty cf ON c.CourseID = cf.CourseID
GROUP BY c.CourseID, c.CourseName, cf.FacultyID;

#Condn Join
SELECT DISTINCT s.StudentID,
       s.StudentName,
       d.DeptName
FROM   Students s
       JOIN Attendance a  ON s.StudentID = a.StudentID
       LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
       LEFT JOIN Courses     c ON e.CourseID = c.CourseID
       LEFT JOIN Departments d ON c.DeptID   = d.DeptID
WHERE  a.Status = 'late';

SELECT s.StudentID,
       s.StudentName,
       p.PaymentID,
       p.Amount,
       p.Status      AS PaymentStatus,
       p.PaymentType
FROM   Students s
       LEFT JOIN Payments p ON s.StudentID = p.StudentID;

