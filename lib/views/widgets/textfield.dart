import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;

  const TextFieldWidget({super.key,required this.controller,required this.hintText});


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        
        hintStyle: const TextStyle(fontSize: 17,color: Colors.black),

        contentPadding:const EdgeInsets.all(8),
        
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: Colors.grey
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: Colors.grey
          )
        ),

      ),
    );
  }
}

