import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/ui/Home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MaterialApp(
      // home: Notes(),
      home: Auth()));
}

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("${user == null ? "OUT" : user.email}"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => _signUp(), child: Text("Sign UP")),
                ElevatedButton(
                    onPressed: () => _signIn(), child: Text("Sign IN")),
                ElevatedButton(
                    onPressed: () => _logout(), child: Text("Log Out"))
              ],
            )
          ],
        ),
      ),
    );
  }

  _signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((value) => print("Sign Up success"));
    setState(() {});
  }

  _signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) => print("Login SUccess"));
    setState(() {});
  }

  _logout() async {
    await FirebaseAuth.instance.signOut();
    setState(() {});
  }
}
