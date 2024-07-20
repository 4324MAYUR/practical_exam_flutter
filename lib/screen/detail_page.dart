import 'package:flutter/material.dart';

class detail_page extends StatefulWidget {
  const detail_page({super.key});

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  @override
  Widget build(BuildContext context) {
    Map product = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop("home_page");
          },
          icon: const Icon(Icons.keyboard_backspace_rounded),
        ),
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "DETAIL PAGE",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Container(
                  width: BouncingScrollSimulation.maxSpringTransferVelocity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        offset: Offset(4, 5),
                        blurRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
              Column(
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(product['thumbnail']),
                  ),
                  Container(
                    height: 300,
                    width: BouncingScrollSimulation.maxSpringTransferVelocity,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
