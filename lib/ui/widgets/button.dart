import 'package:flutter/material.dart';
import 'package:flutter_todo_app/ui/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
   
  const MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryClr
        ),
        child: Text(label,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }
}