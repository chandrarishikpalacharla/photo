
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/constants.dart';
import 'package:project2/views/screens/home_screen.dart';


class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  bool isEmailVerified = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified =firebaseAuth.currentUser!.emailVerified;

    if(!isEmailVerified){
      sendVerificationEmail();
    }
  }
  Future sendVerificationEmail() async{
    try{
      final user = firebaseAuth.currentUser;
    await user?.sendEmailVerification();
    }
    catch(errro){
      Get.snackbar("Getting error", errro.toString(),backgroundColor: Colors.black,);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified? HomeScreen():
     Scaffold(
      appBar: AppBar(
        title: Text("Email Verification",style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
      ),
    );
}