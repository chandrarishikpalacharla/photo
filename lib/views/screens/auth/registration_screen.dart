import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/constants.dart';
import 'package:project2/imagePicker.dart';
import 'package:project2/views/screens/auth/login_screen.dart';
import 'package:project2/views/widgets/passwordTextfield.dart';
import 'package:project2/views/widgets/textfield.dart';

class signUpScreen extends StatefulWidget {

  signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _UserController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  File? _image;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _UserController.dispose();
    _bioController.dispose();
  }

  

  void SelectedImage() async {
    File? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //alignment: Alignment.center,
        child:  Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(),flex: 4,),
           const Text("PhotoFeed",style: TextStyle(color: Colors.blueGrey,fontSize: 40,fontWeight: FontWeight.bold),),
           const  SizedBox(
              height: 50,
            ),
          // Flexible(child: Container(),flex: 2,),
          const  Text("Register",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                _image!=null?CircleAvatar(
                  radius: 64,
                  backgroundImage: FileImage(_image!),
                ):
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage("https://i.stack.imgur.com/l60Hf.png"),
                ),
                Positioned(bottom: -10,left: 80,child: IconButton(onPressed:SelectedImage, icon: Icon(Icons.add_a_photo),color: Colors.grey,)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldWidget(controller: _emailController, hintText: "Enter Your College Email")),
           const SizedBox(
              height: 10,
            ),
            Container(width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),child: passwordTextFieldWidget(controller: _passwordController, hintText: "Enter Your password",)),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldWidget(controller: _UserController, hintText: "Enter Your Username")),
           const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldWidget(controller: _bioController, hintText: "Enter Your Bio")),
           const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width-40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: InkWell(onTap: (){ 
                //creating user
                authController.Registeruser(_UserController.text, _passwordController.text, _emailController.text, _image, _bioController.text);
              },child: Center(child: Text("Create account",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))),
            ),
            SizedBox(
              height: 50,
            ),
            Flexible(child: Container(),flex: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?  ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                InkWell(onTap: (){
                  //Login screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                },child: Text("Login",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),))
              ],
            ),
            Flexible(child: Container(),flex: 1,),
          ],
        ),
      ),
    );
  }
}