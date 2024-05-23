import 'package:consumer_assignment/controller/product_controller.dart';
import 'package:consumer_assignment/model/model_class.dart';
import 'package:consumer_assignment/view/display_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({super.key});

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQuantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter Product Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber[500],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _productImageController,
              decoration: InputDecoration(
                hintText: "Add image link",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(
                hintText: "Add product name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _productPriceController,
              decoration: InputDecoration(
               // prefixText: "Rs. ",
                
                hintText: "Add product price",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _productQuantityController,
              decoration: InputDecoration(
                hintText: "Add initial quantity",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber[500])),
                  onPressed: () {
                    var tempObj = ProductModel(productImage: _productImageController.text.trim(), productName: _productNameController.text.trim(), productPrice: int.parse(_productPriceController.text), quantity: int.parse(_productQuantityController.text), isFavorite: false);
                    Provider.of<ProductController>(context, listen: false).addData(tempObj);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayProduct()));
                  },
                  child: const Text("Add Details",style: TextStyle(color: Colors.black),)),
            )
          ],
        ),
      ),
    );
  }
}
