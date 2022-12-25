import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/Admin/edit_product.dart';
import 'package:ecommerce3/Models/product.dart';
import 'package:ecommerce3/Screens/build_cart.dart';
import 'package:ecommerce3/Widgets/custom_menu.dart';
import 'package:flutter/material.dart';

import '../Services/database.dart';

class ManageProduct extends StatefulWidget {
  static String id = 'ManageProduct';

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final _store = DataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent[100],
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
                    height: MediaQuery.of(context).size.height - 10,
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
                                  onTapUp: (details) async {
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
                                            Navigator.pushNamed(context, EditProduct.id, arguments: products[i]);
                                          }),
                                          MyPopupMenuItem(child: Text('Delete'),
                                              onClick: (){
                                               _store.deleteProduct(products[i].pID);
                                               Navigator.pop(context);
                                              }),
                                        ]);
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
