import 'package:ecommerce3/Models/product.dart';
import 'package:ecommerce3/Screens/payment_gateway.dart';
import 'package:flutter/material.dart';

void ShowCustomDialog (List<Product> products, context) async
{
  var price = 0.0;
  var address;
  for(var product in products)
  {
    price += (product.pQuantity! * double.parse(product.pPrice))!;
  }
  await showDialog(context: context,
      builder: (context)
      {
        return AlertDialog(
          actions: [
            TextButton(onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PaymentGateway(products: products , price: price)));
            }, child: Text('Confirm'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),)
          ],
          title: Text('Total Price = \$ $price'),
        );
      });
}
