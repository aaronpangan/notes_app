import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  var notesCollection = FirebaseFirestore.instance.collection("notes");

  Future<void> saveData(String name, String title, String description) {
    return notesCollection
        .add({
          "name": name,
          "title": title,
          "description": description,
          "timestamp": new DateTime.now()
        })
        .then((value) => print("Item Created"))
        .catchError((error) => print("Failed to create an item"));
    ;
  }

  Future<void> updateData(
      String document, String name, String title, String description) {
    return notesCollection
        .doc(document)
        .update({
          "name": name,
          "title": title,
          "description": description,
          "timestamp": new DateTime.now()
        })
        .then((value) => print("Item with document $document is updated"))
        .catchError((error) => print("Failed to update an with id $document"));
    ;
  }

  Future<void> deleteData(String document) {
    return notesCollection
        .doc(document)
        .delete()
        .then((value) => print("Item with document $document is deleted"))
        .catchError((error) => print("Failed to delete item: $document"));
  }
}
