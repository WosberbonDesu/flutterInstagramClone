import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source)async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if(_file != null){
    //return await File(_file.path);
    return await _file.readAsBytes();
  }
  print("No image selected");
}
