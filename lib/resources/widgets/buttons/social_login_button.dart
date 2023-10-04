import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData? icon;
  final ImageProvider? image;
  final String text;
  final Color backgroundColor;
  final Color color;
  final VoidCallback onPressed;

  SocialLoginButton({
    this.icon,
    this.image,
    required this.text,
    required this.backgroundColor,
    this.color = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (image != null)
            Image(
              image: image!,
              width: 20,
              height: 20,
            )
          else if (icon != null)
            Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: StadiumBorder(),
      ),
    );
  }
}
