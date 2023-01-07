import 'package:flutter/material.dart';
import 'package:serenio/src/pages/auth/auth_page.dart';
import 'package:serenio/src/pages/page_test.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      title: "Serenio",
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.grey[700],
        primarySwatch: Colors.green,
      ),
    ),
  );
}
