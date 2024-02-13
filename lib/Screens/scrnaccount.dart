import 'package:flutter/material.dart';

class ScrnAccount extends StatelessWidget {
  const ScrnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'account',
        style: TextStyle(
            fontSize: 100, color: Colors.black26, fontStyle: FontStyle.italic),
      ),
    );
  }
}
