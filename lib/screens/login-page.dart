import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage('assets-images/metuverse_login_screen.png'),
              fit: BoxFit.fill,
              //colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
    );
  }
}
