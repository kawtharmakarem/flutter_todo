import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
   
  const MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: 100,
        height: 45,
        child: Text(label,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }
}