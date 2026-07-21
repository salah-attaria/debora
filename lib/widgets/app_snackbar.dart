import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppSnackBar {
  static void success(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context)!,
      _buildSnackBar(
        color: Colors.green,
        icon: Icons.check_circle,
        message: message,
      ),
    );
  }

  static void error(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context)!,
      _buildSnackBar(
        color: Colors.red,
        icon: Icons.delete_forever,
        message: message,
      ),
    );
  }

  static void warning(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context)!,
      _buildSnackBar(
        color: Colors.orange,
        icon: Icons.warning_amber_rounded,
        message: message,
      ),
    );
  }

  static void info(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context)!,
      _buildSnackBar(
        color: const Color(0xff015254),
        icon: Icons.info,
        message: message,
      ),
    );
  }

  static Widget _buildSnackBar({
    required Color color,
    required IconData icon,
    required String message,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
                message,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.transparent,
                ),
            ),
          ),
        ],
      ),
    );
  }
}