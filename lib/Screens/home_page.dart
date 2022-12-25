import 'package:ecommerce3/Screens/bottom_bar.dart';
import 'package:ecommerce3/Screens/bread_view.dart';
import 'package:ecommerce3/Screens/cart_screen.dart';
import 'package:ecommerce3/Screens/egg_view.dart';
import 'package:ecommerce3/Screens/milk_view.dart';
import 'package:ecommerce3/Screens/product_view.dart';
import 'package:ecommerce3/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id='HomePage ';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = Auth();
  late User _loggedUser;
  int _tabBarIndex = 0;
  int _bottomBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: Colors.redAccent[100],
              appBar: AppBar(
                backgroundColor: Colors.green,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.shopping_cart_rounded, color: Colors.redAccent),
                  onPressed: ()  {
                    Navigator.pushNamed(context, CartScreen.id);
                  },
                ),
                title: Text('SuperMarket',
                  style: TextStyle(
                      fontFamily: 'Varela',fontSize: 20.0, color: Colors.black
                  ),
                ),
                bottom: TabBar(
                  indicatorColor: Colors.red,
                  onTap: (value)
                    {
                      setState(() {
                        _tabBarIndex = value;
                      });
                    },
                  tabs: [
                    Tab(
                      child: Text('All Categories',
                          style: TextStyle(
                            color: _tabBarIndex ==0 ? Colors.black : Color(0xFFC1BDB8),
                            fontFamily: 'Varela',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Tab(
                      child: Text('Milk',
                          style: TextStyle(
                            color: _tabBarIndex ==1 ? Colors.black : Color(0xFFC1BDB8),
                            fontFamily: 'Varela',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Tab(
                      child: Text('Pastries',
                          style: TextStyle(
                            color: _tabBarIndex ==2 ? Colors.black : Color(0xFFC1BDB8),
                            fontFamily: 'Varela',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Tab(
                      child: Text('Eggs',
                          style: TextStyle(
                            color: _tabBarIndex ==3 ? Colors.black : Color(0xFFC1BDB8),
                            fontFamily: 'Varela',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ) ,
              body: TabBarView(
                children: [
                  ProductView(),
                  MilkView(),
                  BreadView(),
                  EggView(),

                ],
              ),
              bottomNavigationBar: BottomBar(),
            )),
      ],
    );
  }
  @override
  void initState(){
    getCurrentUser();
  }
  getCurrentUser()async {
    _loggedUser = await _auth.getUser();
  }
}
