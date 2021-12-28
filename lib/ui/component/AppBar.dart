import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    leading: InkWell(
      child: Icon(
        Icons.menu,
        color: Colors.blueAccent,
      ),
      onTap: () => print("Hello"),
    ),
    title: Text(
      "Notes App",
      style: TextStyle(color: Colors.blueAccent),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              size: 26.0,
              color: Colors.blueAccent,
            ),
          )),
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.more_vert,
              color: Colors.blueAccent,
            ),
          )),
    ],
  );
}
