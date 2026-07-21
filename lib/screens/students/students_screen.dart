import 'package:flutter/material.dart';

import 'package:debora/models/student_model.dart';
import 'package:debora/services/hive_service.dart';
import 'package:debora/widgets/app_button.dart';
import 'package:debora/widgets/app_snackbar.dart';
import 'package:debora/widgets/custom_app_bar.dart';
import 'package:debora/widgets/custom_search_bar.dart';
import 'package:debora/widgets/empty_state_widget.dart';
import 'package:debora/widgets/delete_confirmation_dialog.dart';
import 'package:debora/widgets/student_card.dart';

import 'add_student_screen.dart';
import 'edit_student_screen.dart';
class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  final TextEditingController searchController = TextEditingController();

  List<StudentModel> students = [];
  List<StudentModel> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void loadStudents() {
    students = HiveService.getStudents();

    setState(() {
      filteredStudents = List.from(students);
    });
  }

  void searchStudent(String value) {
    setState(() {
      filteredStudents = students.where((student) {
        return student.name
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            student.fatherName
                .toLowerCase()
                .contains(value.toLowerCase()) ||
            student.studentClass
                .toLowerCase()
                .contains(value.toLowerCase());
      }).toList();
    });
  }

  Future<void> deleteStudent(StudentModel student) async {
    await HiveService.deleteStudent(student);

    loadStudents();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Student deleted successfully!"),
      ),
    );
  }

  Future<void> openEdit(StudentModel student) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditStudentScreen(
          student: student,
        ),
      ),
    );

    loadStudents();
  }

  Future<void> openAddStudent() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddStudentScreen(),
      ),
    );

    loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

     appBar: const CustomAppBar(
        title: "Students",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFACC15),
        foregroundColor: const Color(0xff015254),
        onPressed: openAddStudent,
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
                    // Statistics Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xffFACC15),
                width: 2,
              ),
            boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
            ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color(0xff015254),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 34,
                  ),
                ),

                const SizedBox(width: 18),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Students",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    Text(
                      students.length.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff015254),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomSearchBar(
            controller: searchController,
            hintText: "Search by name, class or father...",
            onChanged: searchStudent,
          ),
        ),

          const SizedBox(height: 15),

          Expanded(
            child:filteredStudents.isEmpty
            ? const EmptyStateWidget(
                icon: Icons.school_outlined,
                title: "No students found",
                subtitle: "Tap the + button to add a student.",
              )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    itemCount: filteredStudents.length,
                    itemBuilder: (context, index) {
                      final student = filteredStudents[index];

             return StudentCard(
                student: student,

                onEdit: () {
                  openEdit(student);
                },

                onDelete: () {
                  DeleteConfirmationDialog.show(
                    context: context,
                    title: "Delete Student",
                    message:
                        "Are you sure you want to delete ${student.name}?",
                    onConfirm: () async {
                      await HiveService.deleteStudent(student);

                      loadStudents();

                      AppSnackBar.error(
                        context,
                        "Student deleted successfully!",
                      );
                    },
                  );
                },
              );
                  },
                ),
          ),
        ],
      ),
    );
  }
}