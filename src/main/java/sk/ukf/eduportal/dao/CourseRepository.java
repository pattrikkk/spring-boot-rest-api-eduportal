package sk.ukf.eduportal.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import sk.ukf.eduportal.entity.Course;
import sk.ukf.eduportal.entity.Student;

public interface CourseRepository extends JpaRepository<Course, Integer> {
}
