import 'package:flutter/material.dart';
import 'package:metuverse/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                SizedBox(
                  height: 200,
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
                  height: 130,
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[600]!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                              hintText: 'Email',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                    FontAwesomeIcons.solidEnvelope,
                                    color: Colors.white,
                                    size: 30,
                                ),
                              ),
                              hintStyle: kBodyText,
                            ),

                            style: kBodyText,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[600]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: 'Email',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                FontAwesomeIcons.solidEnvelope,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            hintStyle: kBodyText,
                          ),

                          style: kBodyText,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      )

                    ],
                  )
                )



              ],
            ),
          )
        ),
      ],
    );
  }
}

