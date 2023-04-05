package sk.ukf.eduportal.service;

import jakarta.transaction.Transactional;
import sk.ukf.eduportal.entity.Course;
import sk.ukf.eduportal.entity.Student;

import java.util.ArrayList;
import java.util.List;

public interface CourseService {
    public void addStudentToCourse(int courseId, int studentId);

    @Transactional
    void removeStudentFromCourse(int courseId, int studentId);

    public List<Course> findAll();

    @org.springframework.transaction.annotation.Transactional
    Course findById(int theId);

    public void save(Course course);
    public void deleteById(int theId);
}
