import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final String text;
  final Color dividerColor;
  final Color textColor;

  DividerWidget({
    required this.text,
    this.dividerColor = const Color.fromARGB(255, 177, 180, 180),
    this.textColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Divider(
              color: dividerColor,
              height: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Divider(
              color: dividerColor,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
