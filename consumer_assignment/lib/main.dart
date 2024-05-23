import 'package:consumer_assignment/controller/product_controller.dart';
import 'package:consumer_assignment/view/fill_product._details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context) {
      return ProductController();
    },
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnterDetails(),
    ),
    );
  }
}
