import 'package:crossplatformapp/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          // options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            user?.emailVerified == true ? print('You are a verified user') : print('You need to verify your email first');
              return const Text('Done');
            default:
              return const Text('Loading...');
          }
        },
      ),
      backgroundColor: Color.fromARGB(230, 207, 29, 77),
    );
  }
}