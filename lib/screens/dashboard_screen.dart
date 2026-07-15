import 'package:flutter/material.dart';
import 'students/students_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debora School'),
      ),
     body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
            dashboardCard(
                context,
                Icons.school,
                "Students",
                () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentsScreen(),
                    ),
                    );
                },
             ),
            dashboardCard(
                context,
                Icons.person,
                "Teachers",
                () {},
            ),

            dashboardCard(
                context,
                Icons.check_circle,
                "Attendance",
                () {},
            ),

            dashboardCard(
                context,
                Icons.payments,
                "Fees",
                () {},
            ),

            dashboardCard(
                context,
                Icons.class_,
                "Classes",
                () {},
            ),

            dashboardCard(
                context,
                Icons.settings,
                "Settings",
                () {},
            ),
            ],
        ),
    ),
    );
  }
 Widget dashboardCard(
  BuildContext context,
  IconData icon,
  String title,
  VoidCallback onTap,
) {
  return Card(
    elevation: 5,
    child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.indigo,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
}