import 'package:flutter/material.dart';
import 'package:notes_app/FirestoreFunction.dart';

FloatingActionButton floatingActionButton(
  BuildContext context,
) {
  return FloatingActionButton(
    onPressed: () => _showDialog(context),
    child: Icon(Icons.add),
  );
}

_showDialog(BuildContext context) async {
  TextEditingController nameInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();

  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Please fill out the fields"),
                  _textField(true, true, "Name", nameInput),
                  _textField(false, true, "Title", titleInput),
                  _textField(false, true, "Description", descriptionInput)
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  nameInput.clear();
                  titleInput.clear();
                  descriptionInput.clear();

                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            TextButton(
              onPressed: () {
                if (nameInput.text.isNotEmpty &&
                    titleInput.text.isNotEmpty &&
                    descriptionInput.text.isNotEmpty) {
                  FirestoreService().saveData(
                      nameInput.text, titleInput.text, descriptionInput.text);
                }
              },
              child: Text("Save"),
            )
          ],
        );
      });
}

TextField _textField(bool autoFocus, bool autoCorrect, String label,
    TextEditingController controller) {
  return TextField(
    autofocus: autoFocus,
    autocorrect: autoCorrect,
    decoration: InputDecoration(labelText: label),
    controller: controller,
  );
}
