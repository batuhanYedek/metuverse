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
                    height: 5,
                  ),

                  Container(
                    child: Center(
                      child: Text(
                        'Login to your account',
                        style: kBodyText,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            LoginTextInput(
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

                            LoginTextInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Password',
                              inputType: TextInputType.visiblePassword,
                              inputAction: TextInputAction.done,
                              passwordObscured: passwordVisibilityBool,
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            TextButton(
                              onPressed: () {},
                              child: Text('Forgot Password?', style: kForgetPasswordText,),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text('Login', style: kLoginButtonText,),
                              ),
                            )
                          ],
                        )
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



