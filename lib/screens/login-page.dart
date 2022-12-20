import 'package:flutter/material.dart';
import 'package:metuverse/palette.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 460,
                  child: Center(
                    child: Text(
                      'Metuverse',
                      style: kHeading,
                    ),
                  ),
                ),



              ],
            ),
          )
        ),
      ],
    );
  }
}

