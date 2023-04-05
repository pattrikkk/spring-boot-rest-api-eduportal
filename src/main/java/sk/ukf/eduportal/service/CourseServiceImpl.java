package sk.ukf.eduportal.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sk.ukf.eduportal.dao.CourseRepository;
import sk.ukf.eduportal.dao.StudentRepository;
import sk.ukf.eduportal.entity.Course;
import sk.ukf.eduportal.entity.Student;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private StudentRepository studentRepository;
    @Override
    @Transactional
    public void addStudentToCourse(int courseId, int studentId) {
        Course course = courseRepository.findById(courseId)
                .orElseThrow(() -> new RuntimeException("Course not found with id " + courseId));
        Student student = studentRepository.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student not found with id " + studentId));
        List<Course> courses = student.getCourses();
        if (courses == null) { courses = new ArrayList<>(); }
        courses.add(course);
        student.setCourses(courses);
        studentRepository.save(student);
    }

    @Override
    @Transactional
    public void removeStudentFromCourse(int courseId, int studentId) {
        Course course = courseRepository.findById(courseId)
                .orElseThrow(() -> new RuntimeException("Course not found with id " + courseId));
        Student student = studentRepository.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student not found with id " + studentId));
        List<Course> courses = student.getCourses();
        if (courses == null) { return; }
        courses.remove(course);
        student.setCourses(courses);
        studentRepository.save(student);
    }

    @Override
    @org.springframework.transaction.annotation.Transactional
    public List<Course> findAll() {
        return courseRepository.findAll();
    }
    @Override
    @org.springframework.transaction.annotation.Transactional
    public Course findById(int theId) {
        return courseRepository.findById(theId)
                .orElseThrow(() -> new RuntimeException("Employee not found with id: " + theId));
    }

    @Override
    public void save(Course course) {
        courseRepository.save(course);
    }

    @Override
    public void deleteById(int theId) {
        courseRepository.deleteById(theId);
    }
}
