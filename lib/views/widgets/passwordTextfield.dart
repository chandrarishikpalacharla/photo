import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class passwordTextFieldWidget extends StatefulWidget {


  final TextEditingController controller;
  final String hintText;

  const passwordTextFieldWidget({super.key,required this.controller,required this.hintText});

  @override
  State<passwordTextFieldWidget> createState() => _passwordTextFieldWidgetState();
}

class _passwordTextFieldWidgetState extends State<passwordTextFieldWidget> {
  bool isObscure = false ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      controller: widget.controller,
      
      obscureText: isObscure,
      inputFormatters: [
        LengthLimitingTextInputFormatter(20)
      ],
      decoration: InputDecoration(
        hintText: widget.hintText,
        
        hintStyle: const TextStyle(fontSize: 17,color: Colors.black),
        
        suffixIcon: GestureDetector(onTap: (){
          setState(() {
            isObscure =! isObscure;
          });
        },child: Icon(isObscure? Icons.visibility : Icons.visibility_off),),

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

