import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key? key, required this.snapshot, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(snapshot.docs[index].reference.id),
      child: Container(
        height: 120,
        child: Card(
          elevation: 6,
          child: Column(
            children: [
              ListTile(
                title: Text(snapshot.docs[index]['title']),
                subtitle: Text(snapshot.docs[index]['description']),
                leading: CircleAvatar(
                  radius: 34,
                  child: Text(snapshot.docs[index]['title'][0]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
