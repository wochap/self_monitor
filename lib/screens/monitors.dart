// list monitors
// button to show monitor_add
import 'package:flutter/material.dart';
import 'package:selfmonitor/services/auth.dart';

class MonitorsScreen extends StatelessWidget {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text("Signed in successfully."),
            RaisedButton(
              child: const Text('SIGN OUT'),
              onPressed: () async {
                await auth.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
