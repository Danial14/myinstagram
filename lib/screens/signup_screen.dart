import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinstagram/utils/colors.dart';
import 'package:myinstagram/widgets/image_picker_widget.dart';
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
  ValueNotifier<bool> _signupStatus = ValueNotifier<bool>(false);
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
              ProfilePic(),
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
                  _signupStatus.value = true;
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _signupStatus,
                    builder: (context, status, ch) {
                      if(status){
                        return const CircularProgressIndicator(
                          color: primaryColor,
                        );
                      }
                      else{
                        return const Text("Signup");
                      }
                    }
                  ),
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
