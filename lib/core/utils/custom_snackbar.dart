import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(
    String? message, {
      bool isError = true,
      bool getXSnackBar = true,
    }) {
  if (message != null && message.isNotEmpty) {
    if (getXSnackBar) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: isError ? Colors.red.shade400 : Colors.green,
          message: message,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.all(10),
          borderRadius: 8,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    } else {
      final context = Get.context;
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            dismissDirection: DismissDirection.horizontal,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            duration: const Duration(seconds: 3),
            backgroundColor: isError ? Colors.red.shade400 : Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            content: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    }
  }
}
