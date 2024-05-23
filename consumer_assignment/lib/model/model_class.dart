class ProductModel {
  String? productImage;
  String? productName;
  int? productPrice;
  bool? isFavorite ;
  int? quantity;

  ProductModel({required this.productImage, required this.productName, required this.productPrice, this.isFavorite, required this.quantity});
}
