import 'package:flutter/material.dart';

class CardItemProfile extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final IconData icon;

  const CardItemProfile({
    super.key,
    required this.text,
    required this.onPressed,
    required this.borderRadius,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
