import 'package:flutter/material.dart';

void modalLoading(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black45,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Authentication check...',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 15.0),
                Text(text),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
