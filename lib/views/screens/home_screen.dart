import 'package:flutter/material.dart';
import 'package:project2/constants.dart';
import 'package:project2/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
              width: MediaQuery.of(context).size.width-40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: InkWell(onTap: (){ 
                //logging to screen
                authController.signOut();
              },child: Center(child: Text("signOut",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))),
            ),),
    );
  }
}