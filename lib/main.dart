import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './services/services.dart';
import './screens/screens.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Monitor>.value(value: Global.monitorRef.documentStream),
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
      ],
      child: MaterialApp(
        // Named Routes
        routes: {
          '/': (context) => LoginScreen(),
          '/monitors': (context) => MonitorsScreen(),
        },
        // Theme
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
