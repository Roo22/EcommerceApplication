import 'package:ecommerce3/Models/product.dart';
import 'package:ecommerce3/Provider/cart_item.dart';
import 'package:ecommerce3/Screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
static String id = 'ProductDetails';
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    Product product =  ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        leading:  IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: ()  {
            Navigator.pop(context);
          },
        ),
        actions: [
      IconButton(
      icon: Icon(Icons.shopping_cart_rounded, color: Colors.redAccent),
      onPressed: ()  {
        Navigator.pushNamed(context, CartScreen.id);
      },
    ),

        ],
        title: Text('SuperMarket',
          style: TextStyle(
              fontFamily: 'Varela',fontSize: 20.0, color: Colors.black
          ),
        ),
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          width:400,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.all(
              width: 2.5,
              color: Colors.red,
            )
          ),
          child: ListView(
            children: [
              SizedBox(height: 30),
              Hero(
                  tag: product.pLocation,
                  child: Image.asset(product.pLocation,
                      height: 150.0,
                      width: 100.0,
                      fit: BoxFit.contain
                  )
              ),
              SizedBox(height: 30),
              Center(
                child: Text('\$ ${product.pPrice}',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(product.pName,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Varela',
                        fontSize: 24.0)),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(product.pDescription,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Varela',
                        fontSize: 24.0)),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Container(
                  width: 150,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.black
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed:(){
                        Add();
                      },
                        icon: Icon( Icons.add,color: Colors.white,),
                      ),
                      Text(_quantity.toString(),
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),

                      ),
                      IconButton(onPressed:(){
                        Subtract();
                      },
                        icon: Icon( Icons.remove,color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                  child: Container(
                    width: 200,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.black
                    ),
                    child:TextButton(onPressed: () {
                     CartItem cartItem= Provider.of<CartItem>(context, listen: false);
                      product.pQuantity = _quantity;
                      bool exist = false;
                      var productsInCart = cartItem.products;
                      for(var productInCart in productsInCart )
                    {
                      if(productInCart.pName == product.pName)
                        {
                          exist = true;
                        }
                    }
                      if(exist)
                        {
                          showDialog(context: context,
                              builder:(context)=>
                            AlertDialog(
                              content: Text('You Have Added this Item Before'),
                              actions: [
                                TextButton(onPressed:(){
                                  Navigator.pop(context);
                                }, child: Text('Ok'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),),)
                              ],
                            ),
                          );
                        }
                      else
                      {   showDialog(context: context,
                        builder:(context)=>
                            AlertDialog(
                              content: Text('Added To Cart'),
                              actions: [
                                TextButton(onPressed:(){
                                  Navigator.pop(context);
                                }, child: Text('Ok'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),)
                              ],
                            ),
                      );
                        cartItem.addProductToCart(product);}
                    },
                      child: Text('Add to Cart'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),

                      ),),




                  )
              ),
              
  ], ),
      ),
    ),);
  }

  void Subtract() {
    setState(() {
      if(_quantity>0)
      {
        _quantity--;
      }
    });

  }

  void Add() {
    setState(() {
      _quantity++;
    });

  }
}
