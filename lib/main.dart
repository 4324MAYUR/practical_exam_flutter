import 'package:exam_projeck/screen/cart_page.dart';
import 'package:exam_projeck/screen/detail_page.dart';
import 'package:exam_projeck/screen/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const myapp(),
  );
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const home_page(),
      routes: {
        "home_page": (context) => const home_page(),
        "detail_page": (context) => const detail_page(),
        "cart_page": (context) => const cart_page(),
      },
    );
  }
}
