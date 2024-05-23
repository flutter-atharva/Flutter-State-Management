import 'package:consumer_assignment/model/model_class.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  ProductModel? productObj;

  void addData(ProductModel obj) {
    productObj = obj;
  }

  void addFavourite() {
    //productObj!.isFavorite = !productObj!.isFavorite!;
    if (productObj!.isFavorite == false) {
      productObj!.isFavorite = true;
    } else if (productObj!.isFavorite == true) {
      productObj!.isFavorite = false;
    }
    notifyListeners();
  }

  void addQuantity() {
    productObj!.quantity = productObj!.quantity! + 1;
    notifyListeners();
  }

  void removeQuantity() {
    productObj!.quantity = productObj!.quantity! - 1;
    notifyListeners();
  }
}
