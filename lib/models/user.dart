import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String Email;
  String Username;
  String Bio;
  String ProfilePhoto;
  String Uid;

  User({required this.Email,required this.Username,required this.Bio,required this.ProfilePhoto,required this.Uid});
Map<String,dynamic> toJson()=>{
  "Email":Email,
  "Username":Username,
  "Bio":Bio,
  "ProfilePhoto":ProfilePhoto,
  "Uid":Uid
};
static User fromSnap(DocumentSnapshot snap){
  var snapshot = snap.data() as Map<String,dynamic>;
  return User(Email: snapshot['Email'], Username: snapshot['Username'], Bio: snapshot['Bio'], ProfilePhoto: snapshot['ProfilePhoto'], Uid: snapshot['Uid']);
}
}