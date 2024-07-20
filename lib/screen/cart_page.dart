import 'package:flutter/material.dart';

class cart_page extends StatefulWidget {
  const cart_page({super.key});

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop("home_page");
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Center(
          child: Text("CART PAGE"),
        ),
      ),
    );
  }
}
