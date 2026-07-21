import 'package:flutter/material.dart';

import 'package:debora/models/student_model.dart';
import 'package:debora/services/hive_service.dart';
import 'package:debora/widgets/app_button.dart';
import 'package:debora/widgets/app_snackbar.dart';
import 'package:debora/widgets/custom_app_bar.dart';
import 'package:debora/widgets/custom_text_field.dart';
class EditStudentScreen extends StatefulWidget {
  final StudentModel student;

  const EditStudentScreen({
    super.key,
    required this.student,
  });

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController fatherController;
  late TextEditingController classController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: widget.student.name,
    );

    fatherController = TextEditingController(
      text: widget.student.fatherName,
    );

    classController = TextEditingController(
      text: widget.student.studentClass,
    );

    phoneController = TextEditingController(
      text: widget.student.phone,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherController.dispose();
    classController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  Future<void> updateStudent() async {
    if (_formKey.currentState!.validate()) {
      widget.student.name = nameController.text;
      widget.student.fatherName = fatherController.text;
      widget.student.studentClass = classController.text;
      widget.student.phone = phoneController.text;

      await HiveService.updateStudent(widget.student);

      if (!mounted) return;

   AppSnackBar.success(
      context,
      "Student updated successfully!",
    );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

    appBar: const CustomAppBar(
      title: "Edit Student",
    ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffFACC15),
              child: Icon(
                Icons.edit,
                size: 50,
                color: Color(0xff015254),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Update Student",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff015254),
                ),
              ),
            ),

            const SizedBox(height: 30),

            CustomTextField(
              controller: nameController,
              label: "Student Name",
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter student name";
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

          CustomTextField(
            controller: fatherController,
            label: "Father's Name",
            icon: Icons.family_restroom,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter father's name";
              }
              return null;
            },
          ),

            const SizedBox(height: 18),

           CustomTextField(
            controller: classController,
            label: "Class",
            icon: Icons.class_,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter class";
              }
              return null;
            },
            ),
            const SizedBox(height: 18),

           CustomTextField(
              controller: phoneController,
              label: "Phone Number",
              icon: Icons.phone,
              keyboardType: TextInputType.number,
              numbersOnly: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter phone number";
                }

                if (value.length < 10) {
                  return "Phone number must be at least 10 digits";
                }

                return null;
              },
            ),

            const SizedBox(height: 35),

          AppButton(
              text: "Update Student",
              icon: Icons.save,
              onPressed: updateStudent,
            ),
          ],
        ),
      ),
    );
  }
}