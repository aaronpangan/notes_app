import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  deleteItem(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Are you sure you want to delete this note?"),
      ),
    );
  }
}

AlertDialog alertDialog(BuildContext context) {
  return AlertDialog(
    title: Text("Are you sure you want to delete this note?"),
  );
}
