package sk.ukf.eduportal.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sk.ukf.eduportal.entity.Course;
import sk.ukf.eduportal.entity.Student;
import sk.ukf.eduportal.service.CourseService;

import java.util.List;

@RestController
@RequestMapping("/api/courses")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @GetMapping
    public List<Course> findAll() {
        return courseService.findAll();
    }

    @GetMapping("/{courseId}")
    public Course getCourse(@PathVariable int courseId) {
        return courseService.findById(courseId);
    }

    @PostMapping
    public ResponseEntity<Course> addCourse(@RequestBody Course course) {
        course.setId(0); // ensure that a new course is created instead of updating an existing one
        courseService.save(course);
        return new ResponseEntity<>(course, HttpStatus.CREATED);
    }

    @PutMapping
    public ResponseEntity<Course> updateCourse(@RequestBody Course course) {
        courseService.save(course);
        return new ResponseEntity<>(course, HttpStatus.OK);
    }

    @DeleteMapping("/{courseId}")
    public ResponseEntity<Void> deleteCourse(@PathVariable int courseId) {
        courseService.deleteById(courseId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PostMapping("/{courseId}/students/{studentId}")
    public ResponseEntity<Void> addStudentToCourse(@PathVariable int courseId, @PathVariable int studentId) {
        courseService.addStudentToCourse(courseId, studentId);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @DeleteMapping("/{courseId}/students/{studentId}")
    public ResponseEntity<Void> removeStudentFromCourse(@PathVariable int courseId, @PathVariable int studentId) {
        courseService.removeStudentFromCourse(courseId, studentId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}