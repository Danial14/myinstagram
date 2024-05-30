import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myinstagram/utils/colors.dart';
import 'package:myinstagram/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
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
              TextFieldInput(isPass: false,
                textEditingController: _emailController,
              inputType: TextInputType.emailAddress,
                hintText: "Email",
              ),
              const SizedBox(height: 24,),
              TextFieldInput(inputType: TextInputType.text, isPass: true, textEditingController: _passwordController, hintText: "Password"),
              const SizedBox(height: 24,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: const Text("Login"),
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
