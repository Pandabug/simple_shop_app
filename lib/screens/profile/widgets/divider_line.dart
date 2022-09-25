import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  final Size size;

  const DividerLine({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 65,
        right: 25,
      ),
      child: Container(
        height: 1,
        width: size.width,
        color: Colors.grey[300],
      ),
    );
  }
}
