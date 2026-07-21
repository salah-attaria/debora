import 'package:flutter/material.dart';

class DeleteConfirmationDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    required Future<void> Function() onConfirm,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

         title: Row(
            children: [
                const Icon(
                Icons.delete_forever,
                color: Colors.red,
                ),
                const SizedBox(width: 10),
                Expanded(
                child: Text(title),
                ),
            ],
            ),

          content: Text(message),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                Navigator.pop(context);
                await onConfirm();
              },
              icon: const Icon(Icons.delete),
              label: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}