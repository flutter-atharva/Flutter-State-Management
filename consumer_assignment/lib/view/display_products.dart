import 'package:consumer_assignment/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayProduct extends StatefulWidget {
  const DisplayProduct({super.key});

  @override
  State<DisplayProduct> createState() => _DisplayProductState();
}

class _DisplayProductState extends State<DisplayProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Info",style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber[500],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              "${Provider.of<ProductController>(context).productObj!.productImage}",
              height: 230,
              //width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${Provider.of<ProductController>(context).productObj!.productName}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rs. ${Provider.of<ProductController>(context).productObj!.productPrice}/-",
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 45,
                      child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(176, 255, 255, 255))),
                          onPressed: () {
                            Provider.of<ProductController>(context, listen: false).removeQuantity();
                          },
                          child: const Text(
                            "-1",
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Consumer(builder: (context, value, child) {
                        return Text(
                          "${Provider.of<ProductController>(context).productObj?.quantity}",
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 30,
                      width: 45,
                      child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(176, 255, 255, 255))),
                          onPressed: () {
                            Provider.of<ProductController>(context, listen: false).addQuantity();
                          },
                          child: const Text(
                            "+1",
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer<ProductController>(builder: (context, value, child) {
                      return InkWell(
                          onTap: () {
                            Provider.of<ProductController>(context, listen: false).addFavourite();
                          },
                          child: Icon(
                            (Provider.of<ProductController>(context).productObj!.isFavorite!) ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                            size: 30,
                            color: Colors.red,
                          ));
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
