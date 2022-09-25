import 'package:flutter/material.dart';

void snackBar(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        error,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
