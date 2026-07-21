import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color = const Color(0xff015254),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: color.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(.1),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}