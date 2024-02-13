import 'package:flutter/material.dart';

class ScrnKart extends StatelessWidget {
  const ScrnKart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Kart',style: TextStyle(fontSize: 100,color: Colors.black26,fontStyle: FontStyle.italic),),
    );
  }
}