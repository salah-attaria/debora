import 'package:flutter/material.dart';

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
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: fatherController,
                decoration: const InputDecoration(
                  labelText: "Father's Name",
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: classController,
                decoration: const InputDecoration(
                  labelText: "Class",
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
               onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                    content: Text("Student saved successfully!"),
                    ),
                );
                },
                child: const Text("Save Student"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}