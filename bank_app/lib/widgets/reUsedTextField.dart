import 'Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:responsive_sizer/responsive_sizer.dart';

class ReUsedTextField extends StatelessWidget {
   const ReUsedTextField({super.key, 
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
          inputFormatters: inputFormatters, 
          decoration: InputDecoration(
            focusColor: whiteColor,
            hintText: hintText,
            hintStyle: const TextStyle(
              color:  Color.fromARGB(255, 104, 104, 104),
            ),
           focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            fillColor: whiteColor,
          ),
          onChanged: onChanged,
        ),
        SizedBox(height: 2.h), 
      ],
    );
  }
}

