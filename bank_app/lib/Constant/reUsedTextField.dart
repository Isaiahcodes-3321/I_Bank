import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

import 'Themes.dart';

class ReUsedTextField extends StatelessWidget {
  ReUsedTextField({
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.onChanged,
    this.inputFormatters,
  });

  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChanged;
   final List<TextInputFormatter>? inputFormatters; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters, // Add the formatter here
          decoration: InputDecoration(
            focusColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color.fromARGB(255, 104, 104, 104),
            ),
           focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            fillColor: Colors.white,
          ),
          onChanged: onChanged,
        ),
        SizedBox(height: 10), // Adjust the spacing as needed
      ],
    );
  }
}

