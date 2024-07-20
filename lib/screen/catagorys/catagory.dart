import 'package:exam_projeck/utils/product.dart';
import 'package:flutter/material.dart';

Widget catagory({
  required BuildContext context,
  required String selected,
}) {
  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: allproduct
                .where((e) => selected == 'All Products'
                    ? true
                    : selected == e['category'])
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('detail_page', arguments: e);
                      },
                      child: Container(
                        height: 380,
                        width: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: BouncingScrollSimulation
                                  .maxSpringTransferVelocity,
                              height: 300,
                              child: Image(
                                image: NetworkImage(e['thumbnail']),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: BouncingScrollSimulation
                                  .maxSpringTransferVelocity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  e['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      {
                                        cart.add(e);
                                      }
                                    },
                                    icon: const Icon(Icons.add_shopping_cart),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    ],
  );
}
