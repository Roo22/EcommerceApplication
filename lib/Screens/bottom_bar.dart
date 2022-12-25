import 'package:ecommerce3/Screens/cart_screen.dart';
import 'package:ecommerce3/Screens/login_screen.dart';
import 'package:ecommerce3/Screens/payment_gateway.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
    shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.redAccent[100],
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height:50.0 ,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon:Icon(Icons.close,color: Color(0xFF676E79)),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, LoginScreen.id);

                    },

                      ),
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}
