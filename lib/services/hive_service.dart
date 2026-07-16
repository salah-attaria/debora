import 'package:hive/hive.dart';

import '../models/student_model.dart';


class HiveService {

  static final Box<StudentModel> _studentBox =
      Hive.box<StudentModel>('students');


  // Add new student
  static void addStudent(StudentModel student) {

    _studentBox.add(student);

  }


  // Get all students
  static List<StudentModel> getStudents() {

    return _studentBox.values.toList();

  }


  // Delete student
  static void deleteStudent(int index) {

    _studentBox.deleteAt(index);

  }


  // Update student
  static void updateStudent(
    int index,
    StudentModel student,
  ) {

    _studentBox.putAt(
      index,
      student,
    );

  }

}