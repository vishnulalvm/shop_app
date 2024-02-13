
import 'package:flutter/material.dart';
import '../Screens/product_details.dart';


class MyBodyPage extends StatelessWidget {
  const MyBodyPage({
    
    Key? key,
  }) : super(key: key);
 
  @override
  
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            "Shop ",
            style: TextStyle(
              fontSize: 32,
              letterSpacing: 1,
            ),
          ),
          Text(
            "Application",
            style: TextStyle(
              color: Colors.pink[300],
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          flatButton("Home decore", isSelected: true),
          flatButton("Bath & Body", isSelected: false),
          flatButton("Beauty")
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Expanded(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                newMethodatTop("candels", isSelected: true),
                newMethodatTop("vases"),
                newMethodatTop("bins"),
                newMethodatTop("floral"),
                newMethodatTop("decor"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BagWidget(),
            SizedBox(
              height: 20,
            ),
            LineBar(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Text(
                    "Holiday special",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildTop("shapoo.jpg", "shampoo", "250ml", "30"),
                  buildTop("soap.jpg", "soap", "50g", "15"),
                  buildTop("oil2.jpeg", "coconut oil", "100ml", "28"),
                ],
              ),
            )
          ]),
        ),
      ))
    ]);
  
  }
}

class BagWidget extends StatelessWidget {
  const BagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          newMethodshop("1", "bag", "10", context),
          newMethodshop("2", "shoes", "12", context),
          newMethodshop("3", "candels", "5", context),
        ],
      ),
    );
  }

  GestureDetector newMethodshop(
    String img,
    String title,
    String price,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProductDetails(
            img: img,
            price: price,
            title: title,
            context: context,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 160,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/product$img.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "\$$price",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

Container bottomNav(IconData icon, {isSelected = false}) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.pink[300] : Colors.white,
      shape: BoxShape.circle,
      boxShadow: isSelected
          ? [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ]
          : [],
    ),
    height: 50,
    width: 50,
    child: Icon(
      icon,
      color: isSelected ? Colors.white : Colors.black,
    ),
  );
}

Container buildTop(
  String imgs,
  String titles,
  String contity,
  String price,
) {
  return Container(
      width: 220,
      height: 150,
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: 100,
              height: 120,
              child: Image.asset(
                "assets/$imgs",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  contity,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Spacer(),
                Text(
                  "\$$price",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ));
}

Column newMethodatTop(String text, {bool isSelected = false}) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontSize: 18,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      if (isSelected)
        Container(
          width: 5,
          height: 5,
          decoration:
              BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        )
    ],
  );
}

TextButton flatButton(String text, {bool isSelected = false}) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      foregroundColor: isSelected ? Colors.black : Colors.white,
      backgroundColor: isSelected ? Colors.pink[200] : Colors.grey,
      shape: StadiumBorder(),
    ),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}

class LineBar extends StatelessWidget {
  const LineBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 5,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      margin: EdgeInsets.only(left: 30),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        width: 100,
      ),
    );
  }
}

