import 'package:hive/hive.dart';
import '../models/student_model.dart';

class HiveService {
  static final Box<StudentModel> _studentBox =
      Hive.box<StudentModel>('students');

  // Add Student
  static Future<void> addStudent(StudentModel student) async {
    await _studentBox.add(student);
  }

  // Get All Students
  static List<StudentModel> getStudents() {
    return _studentBox.values.toList();
  }

  // Delete Student
  static Future<void> deleteStudent(StudentModel student) async {
    await student.delete();
  }

  // Update Student
  static Future<void> updateStudent(StudentModel student) async {
    await student.save();
  }
}