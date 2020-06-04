import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:selfmonitor/services/services.dart';
import 'package:selfmonitor/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    auth.getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/monitors');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginButton(
              text: 'Login in with Google',
              icon: FontAwesomeIcons.google,
              color: const Color.fromRGBO(238, 66, 45, 1),
              loginMethod: auth.googleSignIn,
            ),
            FutureBuilder<Object>(
              future: auth.appleSignInAvailable,
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 259),
                      child: AppleSignInButton(
                        onPressed: () async {
                          FirebaseUser user = await auth.appleSignIn();
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, '/monitors');
                          }
                        },
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            LoginButton(
              text: 'Continue as Guest',
              icon: FontAwesomeIcons.user,
              color: const Color.fromRGBO(102, 109, 150, 1),
              loginMethod: auth.anonLogin,
            )
          ],
        ),
      ),
    );
  }
}
