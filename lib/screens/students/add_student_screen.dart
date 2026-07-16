import 'package:flutter/material.dart';

import '../../models/student_model.dart';
import '../../services/hive_service.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Student Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter student name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),


              TextFormField(
                controller: fatherController,
                decoration: const InputDecoration(
                  labelText: "Father's Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Father's name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),


              TextFormField(
                controller: classController,
                decoration: const InputDecoration(
                  labelText: "Class",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter class";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),


              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter phone number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),


              ElevatedButton(
                onPressed: () {

                  if (_formKey.currentState!.validate()) {

                    final student = StudentModel(
                      name: nameController.text,
                      fatherName: fatherController.text,
                      studentClass: classController.text,
                      phone: phoneController.text,
                    );


                    HiveService.addStudent(student);


                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Student saved successfully!",
                        ),
                      ),
                    );


                    Navigator.pop(context);

                  }

                },

                child: const Text(
                  "Save Student",
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}