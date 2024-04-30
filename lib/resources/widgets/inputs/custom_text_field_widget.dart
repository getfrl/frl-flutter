import 'package:flutter/material.dart';
import 'package:frl_flutter/bootstrap/helpers.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder; // Added placeholder parameter
  final String? helptext; // Added placeholder parameter
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final IconData? leadingIcon; // Added leadingIcon parameter
  final bool isRequired; // Added to indicate if the field is required

  const CustomTextField({
    Key? key,
    required this.label,
    required this.placeholder, // Added placeholder to constructor
    this.helptext, // Added helptext to constructor
    this.controller,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.leadingIcon, // Added leadingIcon to constructor
    this.isRequired = false, // Default is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 14.0,
                ), // Ensure the text color matches your theme
              ),
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: onChanged,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            filled: true,
            fillColor: Color(0xFF242424),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 12.0), // Decreased vertical padding
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ThemeColor.get(context).inputBorder),
              borderRadius: BorderRadius.all(
                  Radius.circular(50.0)), // Make corners fully rounded
            ),
            hintText: placeholder, // Set placeholder as the hint text
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 16.0,
              height:
                  1.8, // Adjusts the vertical position to center the hint text
            ),
            helperText: helptext, // Removed helper text
            helperStyle:
                TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11.0),
            prefixIcon: leadingIcon != null
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 8.0), // Increased left padding
                    child: Icon(leadingIcon,
                        color: ThemeColor.get(context).surfaceBackground),
                  )
                : null, // Conditionally added leadingIcon with increased left padding
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
