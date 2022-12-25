import 'package:ecommerce3/Admin/add_product.dart';
import 'package:ecommerce3/Admin/admin_home.dart';
import 'package:ecommerce3/Admin/edit_product.dart';
import 'package:ecommerce3/Admin/manage_product.dart';
import 'package:ecommerce3/Admin/order_view.dart';
import 'package:ecommerce3/Provider/cart_item.dart';
import 'package:ecommerce3/Screens/cart_screen.dart';
import 'package:ecommerce3/Screens/home_page.dart';
import 'package:ecommerce3/Screens/login_screen.dart';
import 'package:ecommerce3/Screens/payment_gateway.dart';
import 'package:ecommerce3/Screens/product_details.dart';
import 'package:ecommerce3/Screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartItem(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomePage.id : (context) => HomePage(),
          AdminHome.id : (context) => AdminHome(),
          AddProduct.id : (context) => AddProduct(),
          ManageProduct.id : (context) => ManageProduct(),
          EditProduct.id : (context) => EditProduct(),
          ProductDetails.id : (context) => ProductDetails(),
          CartScreen.id : (context) => CartScreen(),
         // OrderView.id : (context)=> OrderView(),
        },
      ),
    );
  }
}
