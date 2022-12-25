import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final String name, img;
  final String  price;
  final BuildContext Context;
  const BuildCard({Key? key, required this.name, required this.price, required this.img,
    required this.Context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0,left: 5.0,right: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 20.0),

            Hero(
              tag: img,
              child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.contain),
                  )
              ),
            ),
            SizedBox(height: 7.0),
            Text('\$ ${price}',
                style: TextStyle(
                    color: Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Text(name,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),
            Padding(padding: EdgeInsets.all(8.0),
                child: Container(
                    color: Color(0xFFEBEBEB), height: 1.0
                )
            ),

          ],
        ),
      ),
    );
  }
}