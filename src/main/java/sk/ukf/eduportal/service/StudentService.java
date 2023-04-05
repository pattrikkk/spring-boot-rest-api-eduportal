package sk.ukf.eduportal.service;

import sk.ukf.eduportal.entity.Student;

import java.util.List;

public interface StudentService {
    @org.springframework.transaction.annotation.Transactional
    List<Student> findAll();

    @org.springframework.transaction.annotation.Transactional
    Student findById(int theId);

    void save(Student student);

    void deleteById(int theId);
}
