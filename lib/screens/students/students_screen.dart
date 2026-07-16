import 'package:flutter/material.dart';

import '../../models/student_model.dart';
import '../../services/hive_service.dart';
import 'add_student_screen.dart';
import 'edit_student_screen.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}


class _StudentsScreenState extends State<StudentsScreen> {

  List<StudentModel> students = [];


  @override
  void initState() {
    super.initState();
    loadStudents();
  }


  void loadStudents() {

    setState(() {
      students = HiveService.getStudents();
    });

  }


  void deleteStudent(int index) {

    HiveService.deleteStudent(index);

    loadStudents();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Student deleted successfully!",
        ),
      ),
    );

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Students"),
      ),


      body: students.isEmpty

          ? const Center(
              child: Text(
                "No students added yet",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )


          : ListView.builder(

              itemCount: students.length,


              itemBuilder: (context, index) {

                final student = students[index];


                return Card(

                  margin: const EdgeInsets.all(8),


                  child: ListTile(

                    leading: CircleAvatar(

                      child: Text(
                        student.name[0].toUpperCase(),
                      ),

                    ),


                    title: Text(
                      student.name,
                    ),


                    subtitle: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Father: ${student.fatherName}",
                        ),

                        Text(
                          "Class: ${student.studentClass}",
                        ),

                        Text(
                          "Phone: ${student.phone}",
                        ),

                      ],

                    ),


                    trailing: Row(

                      mainAxisSize: MainAxisSize.min,

                      children: [

                        // Edit Button
                        IconButton(

                          icon: const Icon(
                            Icons.edit,
                          ),


                          onPressed: () async {

                            await Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (context) => EditStudentScreen(

                                  student: student,

                                  index: index,

                                ),

                              ),

                            );


                            // Refresh after update
                            loadStudents();

                          },

                        ),



                        // Delete Button
                        IconButton(

                          icon: const Icon(

                            Icons.delete,

                            color: Colors.red,

                          ),


                          onPressed: () {

                            showDialog(

                              context: context,

                              builder: (context) {

                                return AlertDialog(

                                  title: const Text(
                                    "Delete Student",
                                  ),


                                  content: Text(
                                    "Delete ${student.name}?",
                                  ),


                                  actions: [

                                    TextButton(

                                      onPressed: () {

                                        Navigator.pop(context);

                                      },

                                      child: const Text(
                                        "Cancel",
                                      ),

                                    ),


                                    TextButton(

                                      onPressed: () {

                                        Navigator.pop(context);

                                        deleteStudent(index);

                                      },


                                      child: const Text(
                                        "Delete",
                                      ),

                                    ),

                                  ],

                                );

                              },

                            );

                          },

                        ),

                      ],

                    ),

                  ),

                );

              },

            ),



      floatingActionButton: FloatingActionButton(

        onPressed: () async {

          await Navigator.push(

            context,

            MaterialPageRoute(

              builder: (context) =>
                  const AddStudentScreen(),

            ),

          );


          loadStudents();

        },


        child: const Icon(Icons.add),

      ),

    );

  }

}