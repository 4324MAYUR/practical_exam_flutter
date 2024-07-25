import 'package:exam_projeck/extensions/extension.dart';
import 'package:exam_projeck/utils/product.dart';
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
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "DETAIL PAGE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("cart_page");
            },
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Container(
                  width: BouncingScrollSimulation.maxSpringTransferVelocity,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: NetworkImage(product['thumbnail']),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: BouncingScrollSimulation.maxSpringTransferVelocity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 18),
                      child: Text(
                        product['title'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    10.toH(),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "Price : ${product['price']}".toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    10.toH(),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "Rating : ${product['rating']}".toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    10.toH(),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "Brand : ${product['brand']}".toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    10.toH(),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "Stock : ${product['stock']}".toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    10.toH(),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "WarrantyInf. : ${product['warrantyInformation']}"
                            .toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: BouncingScrollSimulation.maxSpringTransferVelocity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                if (!cart.contains(product)) {
                                  cart.add(product);
                                  product['qty'] = 1;
                                }
                              },
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
