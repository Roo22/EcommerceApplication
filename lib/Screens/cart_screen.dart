import 'package:ecommerce3/Models/product.dart';
import 'package:ecommerce3/Provider/cart_item.dart';
import 'package:ecommerce3/Widgets/show_custom_dialog.dart';
import 'package:ecommerce3/Widgets/show_custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String id = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartItem>(context).products;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
        title: Text('My Cart',
          style: TextStyle(
              fontFamily: 'Varela',fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold
          ),
        ),
      ) ,
      backgroundColor: Colors.redAccent[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            LayoutBuilder(
                builder: (context, constraints )
                 {
                   if(products.isNotEmpty)
                   {return ListView.builder(
                     scrollDirection: Axis.vertical,
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount: products.length,
                     itemBuilder: (context, i)
                     {
                       return GestureDetector(
                         onTapUp: (details){
                           ShowCustomMenu(details, context, products[i]);
                         },
                         child: Padding(
                           padding: const EdgeInsets.all(15),
                           child: Container(
                             height: screenHeight * .15,
                             color: Colors.green[400],
                             child: Row(
                               children: [
                                 CircleAvatar(
                                   radius: screenHeight * .15 /2,
                                   backgroundColor: Colors.transparent,
                                   child: SizedBox(
                                     width: 60,
                                     height: 60,
                                     child: ClipOval(
                                       child: Image.asset(products[i].pLocation),
                                     ),
                                   ),
                                 ),
                                 Expanded(
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left: 10),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text(
                                               products[i].pName,
                                               style: TextStyle(
                                                   fontFamily: 'Varela',
                                                   fontSize: 20,
                                                   fontWeight: FontWeight.bold),
                                             ),
                                             SizedBox(
                                               height: 10,
                                             ),
                                             Text(
                                               '\$ ${products[i].pPrice}',
                                               style: TextStyle(
                                                   fontFamily: 'Varela',
                                                   fontWeight: FontWeight.bold),
                                             )
                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(right: 20),
                                         child: Text(products[i].pQuantity.toString(),
                                           style: TextStyle(
                                               fontSize : 25,
                                               fontFamily: 'Varela',
                                               fontWeight: FontWeight.bold),
                                         ),
                                       ),
                                     ],
                                   ),
                                 )

                               ],
                             ),
                           ),
                         ),
                       );
                     },

                   );}
                   else
                     {
                       return Container(
                         height: 500,
                         child: Center(
                           child :Text('Cart is Empty',
                             style: TextStyle(
                                 fontFamily: 'Varela',
                                 fontSize: 30,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black
                             ),
                           )
                         ),
                       );
                     }
                 }
            ),

            Container(
              width: 200,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.black
              ),
              child:TextButton(onPressed: () {
                ShowCustomDialog(products, context);
              },
                child: Text('Order'.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),

                ),),




            ),
          ],
        ),
      ),
    );


  }


}
