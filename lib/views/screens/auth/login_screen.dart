import 'package:flutter/material.dart';
import 'package:project2/constants.dart';
import 'package:project2/views/screens/auth/registration_screen.dart';
import 'package:project2/views/widgets/passwordTextfield.dart';
import 'package:project2/views/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //alignment: Alignment.center,
        child:  Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(),flex: 3,),
           const Text("PhotoFeed",style: TextStyle(color: Colors.blueGrey,fontSize: 40,fontWeight: FontWeight.bold),),
           const  SizedBox(
              height: 50,
            ),
          // Flexible(child: Container(),flex: 2,),
          const  Text("Login",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldWidget(controller: _emailController, hintText: "Enter Your College Email ID")),
           const SizedBox(
              height: 10,
            ),
            Container(width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),child: passwordTextFieldWidget(controller: _passwordController, hintText: "Enter Your password",)),
            const SizedBox(
              height: 10,
            ),
            Container(padding: EdgeInsets.only(left: 220),child: InkWell(onTap: (){
              //forget password
            },child: Text("Forget password?",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),))),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width-40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: InkWell(onTap: (){ 
                //logging to screen
                authController.LoginInUser(_emailController.text, _passwordController.text);
              },child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))),
            ),
            SizedBox(
              height: 50,
            ),
            Flexible(child: Container(),flex: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?  ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                InkWell(onTap: (){
                  //registration screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUpScreen()));
                },child: Text("SignUp",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),))
              ],
            ),
            Flexible(child: Container(),flex: 1,),
          ],
        ),
      ),
    );
  }
}
