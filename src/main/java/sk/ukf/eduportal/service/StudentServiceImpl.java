package sk.ukf.eduportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sk.ukf.eduportal.dao.StudentRepository;
import sk.ukf.eduportal.entity.Student;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentRepository studentRepository;
    @Override
    @org.springframework.transaction.annotation.Transactional
    public List<Student> findAll() {
        return studentRepository.findAll();
    }
    @Override
    @org.springframework.transaction.annotation.Transactional
    public Student findById(int theId) {
        return studentRepository.findById(theId)
                .orElseThrow(() -> new RuntimeException("Student not found with id: " + theId));
    }

    @Override
    public void save(Student student) {
        studentRepository.save(student);
    }

    @Override
    public void deleteById(int theId) {
        studentRepository.deleteById(theId);
    }
}
