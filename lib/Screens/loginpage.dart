import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPage createState() => _LoginPage();
}

Widget buildForgot() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      // ignore: avoid_print
      onPressed: () => print("forgot password"),
      child: Padding(
        padding: EdgeInsets.only(right: 0),
        child: Text(
          "Forgot password?",
          style: TextStyle(
              color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ),
  );
}

class _LoginPage extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x66FFC0CB),
                      Color(0x99FFC0CB),
                      Color(0xccFFC0CB),
                      Color(0xffFFC0CB),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Shop App",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              shadows: [
                                Shadow(
                                  offset: Offset(10.0, 10.0),
                                  blurRadius: 8.0,
                                  color: Color.fromARGB(124, 0, 0, 0),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2))
                                  ]),
                              height: 70,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Email Id";
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black87),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 14),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.pink[300],
                                      ),
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2))
                                  ]),
                              height: 70,
                              child:TextFormField(
                                controller: _passController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Password";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                style: TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.pink[300],
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black38),
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildForgot(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pink[300]),
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.all(15)),
                            ),

                            // ignore: avoid_print
                            onPressed: () {
                              _formkey.currentState!.validate();
                              checkLogin(context);
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) {
    final useremail = _emailController.text;
    final userpasswoed = _passController.text;
    if (useremail == userpasswoed) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MyHome()));
    } else {
      const errormess = "Username and Password does't match";

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: (Text(errormess))));
    }
  }
}
