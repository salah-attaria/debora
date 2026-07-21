import 'package:flutter/material.dart';

import '../models/student_model.dart';

class StudentCard extends StatelessWidget {
  final StudentModel student;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const StudentCard({
    super.key,
    required this.student,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(
          color: Color(0xffFACC15),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xff015254),
              child: const Icon(
                Icons.school,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff015254),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text("Father: ${student.fatherName}"),

                  const SizedBox(height: 4),

                  Text("Class: ${student.studentClass}"),

                  const SizedBox(height: 4),

                  Text("Phone: ${student.phone}"),
                ],
              ),
            ),

            Column(
              children: [

                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Color(0xff015254),
                  ),
                ),

                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}