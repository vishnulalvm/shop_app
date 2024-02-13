import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  String img;
  String title;
  String price;
  BuildContext context;
  ProductDetails({
    Key? key,
    required this.img,
    required this.title,
    required this.price,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/product$img.jpg",
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          IconButton(
            padding: EdgeInsets.only(left: 20, top: 50),
            iconSize: 30,
            icon: Icon(
              Icons.close,
              
              shadows: [
                BoxShadow(
                  blurRadius:5,
                  spreadRadius: 10,
                  color: Colors.white,
                )
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("data"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                "\$$price",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("size"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "16 ox",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "QTy",
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 1.5,
                          ),
                          ListTile(
                            leading: Text(
                              "Details",
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                          ),
                          ListTile(
                            leading: Text(
                              "shiping and retun",
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.circle),
                          child: Icon(Icons.favorite_border),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.pink[300]),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                // <-- Icon
                                Icons.shopping_bag_outlined,
                                size: 24.0,
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'Add to kart',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
