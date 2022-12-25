import 'package:ecommerce3/Admin/add_product.dart';
import 'package:ecommerce3/Admin/manage_product.dart';
import 'package:ecommerce3/Admin/order_view.dart';
import 'package:ecommerce3/Screens/bottom_bar.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  static String id='AdminHome ';

  const AdminHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.redAccent[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AddProduct.id);
              },
              child: Text('Add Product',style: TextStyle(
                color: Colors.black,
              ),),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, ManageProduct.id);

            },
            child: Text('Manage Product',style: TextStyle(
              color: Colors.black,
            ),),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
          SizedBox(height: 10,),
          /*ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, OrderView.id);

            },
            child: Text('View Orders',style: TextStyle(
              color: Colors.black,
            ),),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),*/

        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}