import 'package:exam_projeck/extensions/extension.dart';
import 'package:exam_projeck/screen/catagorys/catagory.dart';
import 'package:exam_projeck/utils/product.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  String selected = "All Products";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "HOME PAGE",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('cart_page');
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DropdownButton(
                      value: selected,
                      onChanged: (val) {
                        setState(() {
                          selected = val.toString();
                        });
                      },
                      items: [
                        const DropdownMenuItem(
                          value: 'All Products',
                          child: Text('All Products'),
                        ),
                        ...allcatagory.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.touper),
                            value: e,
                          );
                        }),
                      ],
                    ),
                    20.toW(),
                    Visibility(
                      visible: selected != "All Products",
                      child: ActionChip(
                        label: const Text("Clear"),
                        avatar: const Icon(Icons.close),
                        onPressed: () {
                          selected = "All Products";
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                20.toH(),
                const Text(
                  "All products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                catagory(context: context, selected: 'All Products'),
                20.toH(),
                Text(
                  selected.touper,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                20.toH(),
                catagory(context: context, selected: selected),
              ],
            ),
          )),
    );
  }
}
