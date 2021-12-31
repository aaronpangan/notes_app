import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/ui/component/dialog/Dialog.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key? key, required this.snapshot, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeToDate = snapshot.docs[index]['timestamp'].toDate();
    var formatDate = new DateFormat("EEEE, MM d, y").format(timeToDate);
    var snapshotData = snapshot.docs[index];
    return InkWell(
      onTap: () => print(snapshot.docs[index].reference.id),
      child: Container(
        height: 120,
        child: Card(
          elevation: 6,
          child: Slidable(
            key: Key("daa"),
            groupTag: '0',
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  autoClose: false,
                  onPressed: _share,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
                SlidableAction(
                  autoClose: false,
                  onPressed: _delete,
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(snapshotData['title']),
                  subtitle: Text(snapshotData['description']),
                  leading: CircleAvatar(
                    radius: 34,
                    child: Text(snapshotData['title'][0]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(formatDate),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _share(BuildContext context) {
    print(context);
    final slidable = Slidable.of(context)!;
    slidable.close();
  }

  void _delete(BuildContext context) {
    print("Helllo");
    CustomDialog().deleteItem(context);
  }
}
