import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  Uint8List ? _image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundImage: _image == null ? NetworkImage("https://images.unsplash.com/photo-1716831320747-fb77ab9bcd23?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
              :
              MemoryImage(_image!)  ,
        ),
        Positioned(child: IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () async{
            _image = await _pickImage();
            if(_image != null){
              setState(() {

              });
            }
          },
        ),
          bottom: -10,
          left: 80,
        )
      ],
    );
  }
  Future<Uint8List?> _pickImage() async{
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      return image.readAsBytes();
    }
    return null;
  }
}
