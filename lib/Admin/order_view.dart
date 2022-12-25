/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce3/Models/order.dart';
class OrderView extends StatelessWidget {
static String id = 'OrderView';
final DataBase _store = DataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      body: StreamBuilder<QuerySnapshot>(
     stream: _store.loadOrders(),
        builder: (context, snapshot){
         if(!snapshot.hasData)
           {
             return Center(
                 child :Text('No Orders',
                   style: TextStyle(
                       fontFamily: 'Varela',
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                       color: Colors.black
                   ),
                 )
             );
           }
         else{
           List<OrderDet> ordersDet = [] ;
           for(var doc in snapshot.data!.docs)
             {
               ordersDet.add(OrderDet(
                   Address: doc.get('Address'),
                   CardNumber: doc.get('CardNumber'),
                   cvc: doc.get('CVC'),
                   ExpireDate: doc.get('ExpireDate'),
                   TotalPrice: doc.get('TotalPrice')));
             }

           return Container();
         }
        },
      ),
    );
  }
}
*/