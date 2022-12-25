import 'package:ecommerce3/Models/product.dart';
import 'package:ecommerce3/Services/database.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
static String id = 'AddProduct';
final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
final  _store = DataBase();
late String _name,_price,_description,_category,_imagelocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: TextFormField(
               onSaved: (value){
                 _name = value!;
               },
               decoration: InputDecoration(
                 hintText: 'Product Name',
                 fillColor: Colors.green,
                 filled: true,
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                     borderSide: BorderSide(
                       color: Colors.black,
                     )),
                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                     borderSide: BorderSide(
                       color: Colors.black,
                     )),
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                     borderSide: BorderSide(
                       color: Colors.black,
                     )),
               ),
             ),
           ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onSaved: (value){
                  _price = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Product Price',
                  fillColor: Colors.green,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onSaved: (value){
                  _description = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Product Description',
                  fillColor: Colors.green,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: TextFormField(
                onSaved: (value){
                  _category = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Product Category',
                  fillColor: Colors.green,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            SizedBox(
              height:10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onSaved: (value){
                  _imagelocation = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Product Location',
                  fillColor: Colors.green,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();
                  _store.addProduct(Product(
                      pName: _name,
                      pCategory: _category,
                      pDescription: _description,
                      pLocation: _imagelocation,
                      pPrice: _price,

                  ));
                  showDialog(context: context,
                      builder:(context)=>
                      AlertDialog(
                        content: Text('Product has been added'),
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
                      ),);
                }
                },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Text(
                'Add Product',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

