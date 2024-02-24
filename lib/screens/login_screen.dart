import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_instagram/utils/utils.dart';
import 'package:flutter_instagram/widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_instagram/screens/login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flexible is for spacing
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                height: 64,
              ),

              const SizedBox(
                height: 64,
              ),
              //   text field input for email
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),

              const SizedBox(
                height: 25,
              ),
              //   text field input for password
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),

              const SizedBox(
                height: 25,
              ),
              //  login button
              InkWell(
                child: Container(
                  child: const Text('Log In'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: blueColor),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Flexible(child: Container(), flex: 2),
              //   Transitioning to signing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    // onTap: {},
                    child: Container(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
