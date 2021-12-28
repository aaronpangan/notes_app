import 'package:flutter/material.dart';
import 'package:notes_app/ui/Home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Notes(),
  ));
}
