import 'package:flutter/material.dart';

class GestureContainer extends StatelessWidget {
  final IconData genderIcon;
  final String gender;
  VoidCallback onPressed;
  Color color;
  GestureContainer(
      {required this.gender,
      required this.genderIcon,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        // height: 150.0,
        width: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genderIcon,
              size: 150.0,
              color: Colors.white,
            ),
            Text(
              gender,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
