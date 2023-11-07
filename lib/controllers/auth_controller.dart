
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/constants.dart';
import 'package:project2/models/user.dart' as model;
import 'package:project2/views/screens/auth/login_screen.dart';
import 'package:project2/views/screens/home_screen.dart';

class AuthController extends GetxController{

  static AuthController instance = Get.find();

  late Rx<User?> _user;
  User get user => _user.value!;


   @override
  void onReady() {
    // Your initialization logic
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    // ignore: unnecessary_null_comparison
    if(User == null ){
      Get.offAll(()=> LoginScreen());
    }
    else{
      Get.offAll(() => HomeScreen());
    }
  }

  
  
  Future<String> _uploadStorage(File image) async {
    Reference ref  = firebaseStorage.ref().child('ProfilePics').child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot  = await uploadTask;
    String dowlaodUrl  = await taskSnapshot.ref.getDownloadURL();
    return dowlaodUrl;
  }

  void Registeruser(String Username,String Password,String Email,File? image,String Bio) async{
    try{
      if(Username.isNotEmpty && Password.isNotEmpty && Email.isNotEmpty && image != null && Bio.isNotEmpty){
        if (Email.endsWith("@aec.edu.in")) {
        UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: Email, password: Password);
        String dowlaodUrl = await _uploadStorage(image);
        model.User user = model.User(Email: Email, Username: Username, Bio: Bio, ProfilePhoto: dowlaodUrl, Uid: credential.user!.uid);
        await firestore.collection("users").doc(credential.user!.uid).set(user.toJson());

        } else {
        Get.snackbar(
          'Error Creating Account',
          'Please use a valid "@aec.edu.in" email address',
          backgroundColor: Colors.black
        );
      }
      }
      else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
          backgroundColor: Colors.black
        );
      }
    }
    catch(error){
      Get.snackbar(
        'Error Creating Account',
        
        error.toString(),
        
       backgroundColor: Colors.black,
      );
      print('Error: ${error.toString()}');
    }
  }
   void LoginInUser(String Email,String Password) async {
    try{
      if(Email.isNotEmpty &&
          Password.isNotEmpty){
            if (Email.endsWith("@aec.edu.in")) {
            await firebaseAuth.signInWithEmailAndPassword(email: Email, password: Password);
            }
            else {
        Get.snackbar(
          'Error Creating Account',
          'Please use a valid "@aec.edu.in" email address',
          backgroundColor: Colors.black
        );
      }
          }
          else{
            Get.snackbar(
          'Error Loggin in',
          'Please enter all the fields',
        );
          }

    }
    catch(e){
       Get.snackbar(
        'Error Login',
        e.toString(),
      );
    }
  }
  void signOut() async{
    await firebaseAuth.signOut();
  }
}
