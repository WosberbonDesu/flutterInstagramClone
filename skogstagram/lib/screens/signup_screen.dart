import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monogramv2/resources/auth_methods.dart';
import 'package:monogramv2/utils/colors.dart';
import 'package:monogramv2/utils/utils.dart';
import 'package:monogramv2/widgets/text_field_input.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage()async{
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 2,),
                SvgPicture.asset("assets/eye-look.svg",color: Colors.white,height: 64,),
                const SizedBox(height: 64,),
                Stack(
                  children: [
                    _image != null?
                CircleAvatar(
                radius: 64,
                  backgroundImage: MemoryImage(_image!)
                ) : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
                    ),
                    Positioned(bottom: -10,left: 80,child: IconButton(

                      icon: const Icon(
                          Icons.add_a_photo_outlined
                      ),
                      onPressed: selectImage,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter Your username",
                  textInputType: TextInputType.text,
                  textEditingController: _usernameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter Your Email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter Your password",
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter Your bio",
                  textInputType: TextInputType.text,
                  textEditingController: _bioController,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(


                  onTap: ()  async{
                    String res = await AuthMethods().signUpUser(
                      email: _emailController.text,
                      password: _passwordController.text,
                      username: _usernameController.text,
                      bio: _bioController.text,
                      file: _image!,
                      //file:
                    );
                    print(res);
                  },
                  child: Container(
                      child: const Text("Sign up"),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                          color: blueColor
                      )),
                ),
                SizedBox(height: 12,),
                Flexible(child: Container(

                ),flex: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Don't have an account?"),
                      padding: const EdgeInsets.symmetric(vertical: 8,),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        child: const Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),),
                        padding: const EdgeInsets.symmetric(vertical: 8,),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}