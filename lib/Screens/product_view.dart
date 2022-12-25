import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/Models/product.dart';
import 'package:ecommerce3/Screens/build_cart.dart';
import 'package:ecommerce3/Screens/product_details.dart';
import 'package:ecommerce3/Services/database.dart';
import 'package:flutter/material.dart';
class ProductView extends StatelessWidget {
  final _store = DataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data!.docs) {
              products.add(Product(
                pID: doc.id,
                pName: doc.get('productName'),
                pCategory: doc.get('productCategory'),
                pDescription: doc.get('productDescription'),
                pLocation: doc.get('productLocation'),
                pPrice: doc.get('productPrice'),
              ));
            }
            return ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width - 30.0,
                  height: MediaQuery.of(context).size.height - 180 ,
                  child: Column(children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: GestureDetector(
                                onTap:(){
                                  Navigator.pushNamed(context, ProductDetails.id, arguments: products[i]);
                                },
                                child: BuildCard(
                                    name: products[i].pName,
                                    price: products[i].pPrice,
                                    img: products[i].pLocation,
                                    Context: context)),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            );
          } else {
            return Center(child: Text('Loading'));
          }
        },
      ));

  }
}
