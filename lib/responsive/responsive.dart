import 'package:flutter/material.dart';
import 'package:flutter_instagram/utils/dimensions.dart';
import 'mobile_screen_layout.dart';
import 'web_screen_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({super.key, required this.mobileScreenLayout, required this.webScreenLayout,});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > webScreenSize) {
            return webScreenLayout;
          }
          else {
            return mobileScreenLayout;
          }
        }
    );
  }
}
