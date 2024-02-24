import 'package:flutter/material.dart';
import 'package:flutter_instagram/responsive/mobile_screen_layout.dart';
import 'package:flutter_instagram/responsive/web_screen_layout.dart';
import 'package:flutter_instagram/screens/login_screen.dart';
import 'package:flutter_instagram/screens/signup_screen.dart';
import 'package:flutter_instagram/utils/utils.dart';
import 'package:flutter_instagram/responsive/responsive.dart';
import 'package:flutter_instagram/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle the error gracefully, show an error message or perform any necessary actions.
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      // home: const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(),webScreenLayout: WebScreenLayout(),)
      home: SignupScreen(),
    );
  }
}

