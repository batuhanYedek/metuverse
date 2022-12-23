import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:metuverse/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/widgets.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class LoginModel
{
  int? id;
  String? email;
  String? password;

  LoginModel.fromMap({required Map json})
      : id = json["Id"].runtimeType == int ? json["Id"] : int.parse(json["Id"]),
        email = json["Email"],
        password = json["Password"];
}


class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginModel? login;
  bool passwordVisibilityBool = true;

  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void _loginServicePost() async {
    String serviceAddress = 'http://www.birikikoli.com/get.php';
    Uri serviceUri = Uri.parse(serviceAddress);
    final response = await http.post(serviceAddress, body:{
      "Email": email.text,
      "Password": password.text,
    });

    String stringData = response.body;
    Map jsonObject = jsonDecode(stringData);

    login = LoginModel.fromMap(json: jsonObject);
  }

  void _loginServiceGet() async {
    String serviceAddress = 'http://www.birikikoli.com/get.php';
    Uri serviceUri = Uri.parse(serviceAddress);

    HttpClientRequest request = await HttpClient().getUrl(serviceUri);
    HttpClientResponse response = await request.close();
    String stringData = await response.transform(Utf8Decoder()).join();
    Map jsonObject = jsonDecode(stringData);

    login = LoginModel.fromMap(json: jsonObject);

  }

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
                              enterInfo: email,
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
                              enterInfo: password,
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
                                onPressed: () {
                                  //_loginService();
                                  _loginServicePost();
                                  Timer(Duration(seconds: 3), ()
                                  {
                                    if(login?.id == -1)
                                    {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("Domain hatali"),
                                      ));
                                    }

                                    else if(login?.id == -2)
                                    {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("Kullanici bilgileri hatali"),
                                      ));
                                    }

                                    else
                                    {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("${login?.email} olarak giris yaptiniz."),
                                      ));
                                    }

                                  });
                                },
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



