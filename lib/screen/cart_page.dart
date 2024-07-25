import 'package:exam_projeck/extensions/extension.dart';
import 'package:exam_projeck/utils/product.dart';
import 'package:flutter/material.dart';

class cart_page extends StatefulWidget {
  cart_page({super.key});
  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  double totalprice = 0;
  int Cartitems = 0;

  @override
  void initState() {
    super.initState();
    gettotal();
  }

  void gettotal() {
    totalprice = 0;
    Cartitems = 0;
    cart.forEach((e) {
      totalprice += (e['price'] * e['qty']);
      Cartitems += (e['qty'] as int);
    });
  }

  void updateTotalAndState() {
    gettotal();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('home_page', (route) => false);
            },
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "CART PAGE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: cart.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM7wHwpTo45Jm22eI6Gv0hbwQ-MzhERjKD6WdbmmTC0zZ_sDnv3J3b_P1rjw&s")),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: cart.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Container(
                            height: size.height * 0.16,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(3, 3),
                                          blurRadius: 3,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: NetworkImage(
                                          e['thumbnail'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['title'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      5.toH(),
                                      Text(
                                        "\$  ${e['price']}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (e['qty'] > 1) {
                                                  e['qty']--;
                                                } else {
                                                  cart.remove(e);
                                                }
                                                updateTotalAndState();
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                e['qty'].toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            3.toW(),
                                            IconButton(
                                              onPressed: () {
                                                e['qty']++;
                                                updateTotalAndState();
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                cart.remove(e);
                                                updateTotalAndState();
                                              },
                                              child: const Icon(
                                                Icons.delete_forever,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ],
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Total : \$ ${totalprice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            "CartItems : $Cartitems",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
