import 'package:flutter/material.dart';
import 'package:metuverse/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/widgets.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  bool passwordVisibilityBool = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView( //bottom overflowed (klavye) hatası için
              child: Column(
                children: [
                  SizedBox(
                    height: 220,
                  ),

                  Container(
                    child: Center(
                      child: Text(
                        'Metuverse',
                        style: kHeading,
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 60,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TextInput(
                          icon: FontAwesomeIcons.solidEnvelope,
                          hint: 'Email',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          passwordObscured: false,
                        ),

                        SizedBox(
                          height: 0,
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisibilityBool = !passwordVisibilityBool;
                            });
                          },
                          icon: passwordVisibilityBool ? Icon(Icons.visibility, color: Colors.green,) : Icon(Icons.visibility_off, color: Colors.orange,)
                        ),

                        SizedBox(
                          height: 0,
                        ),

                        TextInput(
                          icon: FontAwesomeIcons.lock,
                          hint: 'Password',
                          inputType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.done,
                          passwordObscured: passwordVisibilityBool,
                        ),

                      ],
                    )
                  )



                ],
              ),
            ),
          )
        ),
      ],
    );
  }
  
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.passwordObscured,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool passwordObscured;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[600]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(32),
        ),
        child: TextField(
          obscureText: passwordObscured,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
              ),
            ),


            hintStyle: kBodyText,
          ),

          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}

