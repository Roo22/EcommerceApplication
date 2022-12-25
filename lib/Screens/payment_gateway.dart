import 'package:ecommerce3/Models/product.dart';
import 'package:ecommerce3/Screens/home_page.dart';
import 'package:ecommerce3/Services/database.dart';
import 'package:flutter/material.dart';

class PaymentGateway extends StatelessWidget {
  List<Product> products;
  double price;
  PaymentGateway( {required this.products, required this.price,});
static String id = 'PaymentGateway';
   String? _cardNumber,_expireDate,_cvc,_address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Payment Information',
          style: TextStyle(
              fontFamily: 'Varela',fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold
          ),
        ),
      ) ,
      backgroundColor: Colors.redAccent[100],
      body:Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
    child: Column(
    children: [
    SizedBox(height:15.0),
    TextField(
      onChanged: (value){
        _cardNumber = value;
      },
    decoration: InputDecoration(
    hintText: "Card Number",
    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
        fillColor: Colors.green[200],
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
            ))
    ),
    ),
      SizedBox(height:10.0),
      TextField(
      onChanged: (value){
        _cvc = value;
      },
    decoration: InputDecoration(
    hintText: "CVC",
    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
        fillColor: Colors.green[200],
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
            ))
    ),
    ),
    SizedBox(height:10.0),
    TextField(
      onChanged: (value){
        _expireDate= value;
      },
    decoration: InputDecoration(
    hintText: "Expire Date: MM/YY",
        hintStyle: TextStyle(fontSize: 18, color: Colors.black),
        fillColor: Colors.green[200],
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
            ))
    ),
    ),
    SizedBox(height:10.0),

    TextField(
      onChanged: (value){
        _address= value;
      },
    decoration: InputDecoration(
    hintText: "Enter Your Address",
        hintStyle: TextStyle(fontSize: 18, color: Colors.black),
        fillColor: Colors.green[200],
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
            ))
    ),
    ),

    SizedBox(height:30.0),
      Container(
        width: 200,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.black
        ),
        child:TextButton(onPressed: () {
          DataBase _store = DataBase();
          try {
            _store.storeOrders({
              'TotalPrice' : price,
              'Address' : _address,
              'CardNumber': _cardNumber,
              'CVC':_cvc,
              'ExpireDate' : _expireDate,
            }, products);
            showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text('Orderd Successfully'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, HomePage.id);
                      },
                    child: Text('ok'.toUpperCase(),
                  style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),),)
                    ],
                  );
                });
            /*showDialog(context: context,
                builder: (context)
            {
              return AlertDialog(
                actions: [
                  TextButton(onPressed:(){
                    Navigator.pushNamed(context, HomePage.id);

                  }, child: Text('ok'.toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),)
                ],
                title: Text('Orderd Successfully'),
              );
            });
            );*/

          } on Exception catch (e) {
            print(e.toString());
          }

        },
          child: Text('Check Out'.toUpperCase(),
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),

          ),),




      ),

    ]
    ),
    ),
    ),
    );
  }
}
