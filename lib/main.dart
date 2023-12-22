import 'package:demo_state_01/inherited_widget/s_home.dart';
import 'package:flutter/material.dart';

import 'callback_function/s_parents.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ParentsView(),
    );
  }
}
