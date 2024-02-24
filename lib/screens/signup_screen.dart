import 'package:flutter/material.dart';
import 'package:flutter_instagram/resources/auth_methods.dart';
import 'package:flutter_instagram/utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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

              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://www.bing.com/images/search?view=detailV2&ccid=awAiMS1B&id=E24FA114EA23AB8E6E8FD31860AD2CDA50945E42&thid=OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.6b0022312d41080436c52da571d5c697%3frik%3dQl6UUNosrWAY0w%26riu%3dhttp%253a%252f%252fpluspng.com%252fimg-png%252fpng-user-icon-icons-logos-emojis-users-2400.png%26ehk%3d8agkVrs8bo9zafVF9Qk4%252bFqv5IwaEZrb8DwX%252ftfJtNc%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=2305&expw=2400&q=+username+image+lgog&simid=608034225808294971&FORM=IRPRST&ck=85BE529AFFEFA4E8CE950324000962A7&selectedIndex=13&itb=1'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),

              // text field input for username
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),

              const SizedBox(
                height: 25,
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

              // text field input fot bio
              TextFieldInput(
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),

              const SizedBox(
                height: 25,
              ),
              //  login button
              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signupUser(
                      username: _usernameController.text,
                      password: _passwordController.text,
                      email: _emailController.text,
                      bio: _bioController.text
                  );
                  print(res);
                },
                child: Container(
                  child: const Text('Sign up'),
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
