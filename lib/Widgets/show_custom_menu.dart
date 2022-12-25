import 'package:ecommerce3/Provider/cart_item.dart';
import 'package:ecommerce3/Screens/product_details.dart';
import 'package:ecommerce3/Widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void ShowCustomMenu (details,context,product) async {
  double dx = details.globalPosition.dx;
  double dy = details.globalPosition.dy;
  double dx2 = MediaQuery.of(context).size.width - dx;
  double dy2 = MediaQuery.of(context).size.width - dy;
  await showMenu(
  context: context,
  position: RelativeRect.fromLTRB(
      dx, dy, dx2, dy2),
  items: [
  MyPopupMenuItem(child: Text('Edit'),
  onClick: (){
    Navigator.pop(context);
    Provider.of<CartItem>(context, listen: false).deleteProduct(product);
    Navigator.pushNamed(context, ProductDetails.id, arguments: product);
  }),
  MyPopupMenuItem(child: Text('Delete'),
  onClick: (){
    Navigator.pop(context);
    Provider.of<CartItem>(context, listen: false).deleteProduct(product);

  }),
  ]);
}



