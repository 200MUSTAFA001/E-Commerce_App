// Flutter imports:
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(BuildContext context) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: const Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.green, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Product added",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}

// void showSnackBar(String message, BuildContext context){
// scaffoldMessengerKey.currentState?.showSnackBar(
//   SnackBar(
//     content: Text(message),
//     duration: const Duration(seconds: 3),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//     behavior: SnackBarBehavior.floating,
//     action: SnackBarAction(
//         label: "label",
//         onPressed: () {
//           Navigator.pop(context);
//         }),
//   ),
// );
// }
