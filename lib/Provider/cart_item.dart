import 'package:ecommerce3/Models/product.dart';
import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier{
  List<Product> products = [];
  addProductToCart(Product product)
  {
    products.add(product);
    notifyListeners();
  }
  deleteProduct(Product product)
  {
    products.remove(product);
    notifyListeners();
  }
}
