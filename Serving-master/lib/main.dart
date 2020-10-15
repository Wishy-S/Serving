import 'package:firstflutter/LCS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(first());
}
class first extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "SERVING",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: lcs(),
    );
  }
}