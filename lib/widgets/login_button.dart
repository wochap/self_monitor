import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key key, this.text, this.icon, this.color, this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 259),
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(15),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, '/monitors');
          }
        },
        label: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
