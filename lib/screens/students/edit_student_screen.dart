import 'package:flutter/material.dart';

import '../../models/student_model.dart';
import '../../services/hive_service.dart';


class EditStudentScreen extends StatefulWidget {

  final StudentModel student;
  final int index;


  const EditStudentScreen({
    super.key,
    required this.student,
    required this.index,
  });


  @override
  State<EditStudentScreen> createState() =>
      _EditStudentScreenState();

}



class _EditStudentScreenState extends State<EditStudentScreen> {


  late TextEditingController nameController;
  late TextEditingController fatherController;
  late TextEditingController classController;
  late TextEditingController phoneController;



  @override
  void initState() {

    super.initState();


    nameController =
        TextEditingController(text: widget.student.name);

    fatherController =
        TextEditingController(text: widget.student.fatherName);

    classController =
        TextEditingController(text: widget.student.studentClass);

    phoneController =
        TextEditingController(text: widget.student.phone);

  }



  @override
  void dispose() {

    nameController.dispose();
    fatherController.dispose();
    classController.dispose();
    phoneController.dispose();

    super.dispose();

  }



  void updateStudent() {


    final updatedStudent = StudentModel(

      name: nameController.text,

      fatherName: fatherController.text,

      studentClass: classController.text,

      phone: phoneController.text,

    );


    HiveService.updateStudent(
      widget.index,
      updatedStudent,
    );


    Navigator.pop(context);


  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Edit Student",
        ),
      ),


      body: Padding(

        padding: const EdgeInsets.all(16),


        child: ListView(

          children: [


            TextField(

              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Student Name",
              ),

            ),


            const SizedBox(height:16),


            TextField(

              controller: fatherController,

              decoration: const InputDecoration(
                labelText: "Father Name",
              ),

            ),


            const SizedBox(height:16),


            TextField(

              controller: classController,

              decoration: const InputDecoration(
                labelText: "Class",
              ),

            ),


            const SizedBox(height:16),


            TextField(

              controller: phoneController,

              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),

            ),


            const SizedBox(height:30),


            ElevatedButton(

              onPressed: updateStudent,


              child: const Text(
                "Update Student",
              ),

            ),


          ],

        ),

      ),

    );

  }

}