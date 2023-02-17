import 'package:flutter/material.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String title;
  const DefaultOutlinedButton(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.teal, width: 2),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
