SELECT s.*, c.subject, c.professor, c.total_credits 
  FROM t_student s JOIN t_course c ON s.major_course = c.code;
