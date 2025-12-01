import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits_tracker_app/core/theme/app_icons.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/icon_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: Text("Continue with E-mail"),
        leftIcon: CustomIconButton(
          icon: SvgPicture.asset(AppIcons.arrowLeft),
          onTap: () {}, // <-- IMPORTANT
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("I forgot my password"),
                ),
              ],
            ),
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Dont't have account? Let's create!"),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Next")),
            ],
          ),
        ],
      ),
    );
  }
}
