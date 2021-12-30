import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/ui/component/AppBar.dart';
import 'package:notes_app/ui/component/FloatingActionButton.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var firestoreDB = FirebaseFirestore.instance.collection("notes").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: floatingActionButton(context),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreDB,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index) {
                return Text(snapshot.data.docs[index]['name']);
              });
        },
      ),
    );
  }
}
