import 'package:flutter/material.dart';

import 'package:debora/models/student_model.dart';
import 'package:debora/services/hive_service.dart';
import 'package:debora/widgets/app_button.dart';
import 'package:debora/widgets/app_snackbar.dart';
import 'package:debora/widgets/custom_app_bar.dart';
import 'package:debora/widgets/custom_text_field.dart';
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    fatherController.dispose();
    classController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  Future<void> saveStudent() async {
    if (_formKey.currentState!.validate()) {
      final student = StudentModel(
        name: nameController.text.trim(),
        fatherName: fatherController.text.trim(),
        studentClass: classController.text.trim(),
        phone: phoneController.text.trim(),
      );

      await HiveService.addStudent(student);

      if (!mounted) return;

      AppSnackBar.success(
        context,
        "Student added successfully!",
      );

      Navigator.pop(context);
    }
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

    appBar: const CustomAppBar(
      title: "Add Student",
    ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffFACC15),
              child: Icon(
                Icons.school,
                color: Color(0xff015254),
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Student Information",
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
              text: "Save Student",
              icon: Icons.save,
              onPressed: saveStudent,
            ),
          ],
        ),
      ),
    );
  }
}