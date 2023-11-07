import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?>  pickImage(ImageSource source) async{
  final ImagePicker _imagepicker = ImagePicker();
  XFile? _file = await _imagepicker.pickImage(source: source);
  if(_file!= null){
    return await File(_file.path);

  }
  print("No Image Selected");
  return null;
}