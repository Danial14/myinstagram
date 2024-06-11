import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? imageFile;
  _selectImage(BuildContext context){
    showDialog(context: context, builder: (ctx){
      return SimpleDialog(
        title: const Text("Create a post"),
        children: [
          SimpleDialogOption(
            padding: EdgeInsets.all(20),
            child: const Text("Take a photo"),
            onPressed: () async{
             XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
             if(image != null){
               imageFile = File(image.path);
               setState(() {

               });
             }
            },
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return imageFile == null ? Center(
      child: IconButton(
        onPressed: (){
          _selectImage(context);
        },
        icon: const Icon(Icons.upload),
      ),
    ) : Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        leading: IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: false,
        actions: [
          TextButton(onPressed: (){

          }, child: const Text("Post",
           style: TextStyle(
             color: Colors.blueAccent,
             fontSize: 16,
             fontWeight: FontWeight.bold
           ),
          ))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://plus.unsplash.com/premium_photo-1691741856241-4c4c9a4c3b9d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8"),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Write a caption...",
                    border: InputBorder.none
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://plus.unsplash.com/premium_photo-1691741856241-4c4c9a4c3b9d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8"),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter
                      )
                    ),
                  ),
                ),
              ),
              const Divider()
            ],
          )
        ],
      ),
    );
  }
}
