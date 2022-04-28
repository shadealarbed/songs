import 'package:flutter/material.dart';
class roundedBox extends StatelessWidget {
  const roundedBox(
      {required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              title,
            style: TextStyle(color: Colors.white),),
            onPressed: onPressed,
          ),
      ),
    );
  }
}
