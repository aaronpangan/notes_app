import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/ui/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    User? user = FirebaseAuth.instance.currentUser;

    if (googleUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Notes()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${googleUser == null ? "OUT" : "IN"}"),
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
                    onPressed: () => _logout(), child: Text("Log Out")),
                ElevatedButton(
                    onPressed: () => _googleUser(),
                    child: Text("Sign in google"))
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
    await FirebaseAuth.instance
        .signOut()
        .then((value) => print("Logout Success"))
        .onError((error, stackTrace) => print(error));
    await _googleSignIn
        .disconnect()
        .then((value) => print("Logout Success"))
        .onError((error, stackTrace) => print(error));

    setState(() {});
  }

  _googleUser() async {
    // await _googleSignIn
    //     .signIn()
    //     .then((value) => print("Google Login Success"))
    //     .onError((error, stackTrace) => print(error));

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(await FirebaseAuth.instance.signInWithCredential(credential));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Notes()),
    );
    // setState(() {});
  }
}
