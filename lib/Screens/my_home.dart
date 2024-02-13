import 'package:flutter/material.dart';
import 'package:shop_app/Screens/scrnaccount.dart';
import 'package:shop_app/Screens/scrnfavrt.dart';
import 'package:shop_app/Screens/scrnkart.dart';
import '../Widgets/my_bodypage.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currenSelectIndex = 0;
  final _pages = [
    MyBodyPage(),
    ScrnKart(),
    ScrnFavrt(),
    ScrnAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: Image.asset("assets/hamps.png"),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(20),
            child: Image.asset("assets/sea.png"),
          )
        ],
      ),
      body: _pages[_currenSelectIndex],
      bottomNavigationBar: BottomNavigationBar(
        
          unselectedItemColor: Colors.black38,
          selectedItemColor: Colors.pink[300],
          currentIndex: _currenSelectIndex,
          onTap: (newIndex) {
            setState(() {
              _currenSelectIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Kart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ]),
    );
  }
}

 