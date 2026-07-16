import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  String fatherName;

  @HiveField(2)
  String studentClass;

  @HiveField(3)
  String phone;

  StudentModel({
    required this.name,
    required this.fatherName,
    required this.studentClass,
    required this.phone,
  });
}