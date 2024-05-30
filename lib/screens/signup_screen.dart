import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinstagram/utils/colors.dart';
import 'package:myinstagram/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Flexible(child: Container(), flex: 2,),
              SvgPicture.asset("assets/images/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64,),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1716831320747-fb77ab9bcd23?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                  Positioned(child: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: (){

                    },
                  ),
                  bottom: -10,
                    left: 80,
                  )
                ],
              ),
              const SizedBox(height: 24,),
              TextFieldInput(isPass: false,
                textEditingController: _emailController,
                inputType: TextInputType.emailAddress,
                hintText: "Email",
              ),
              const SizedBox(height: 24,),
              TextFieldInput(inputType: TextInputType.text, isPass: true, textEditingController: _passwordController, hintText: "Password"),
              const SizedBox(height: 24,),
              TextFieldInput(isPass: false,
                textEditingController: _usernameController,
                inputType: TextInputType.text,
                hintText: "Username",
              ),
              const SizedBox(height: 24,),
              TextFieldInput(isPass: false,
                textEditingController: _bioController,
                inputType: TextInputType.text,
                hintText: "Bio",
              ),
              const SizedBox(height: 24,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: const Text("Signup"),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                      color: blueColor
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      child: const Text("Signup",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
