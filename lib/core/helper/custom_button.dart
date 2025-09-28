import 'package:flutter/material.dart';

import 'package:qr/core/utlis/style.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onPressed, });
String text;
final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
      child: Container(
            decoration: BoxDecoration(
              color: Styles.kPrimaryColor,
              borderRadius: BorderRadius.circular(10),
          
            ),
            
            width:320,
            height: 58,
            child: Center(
              child:Text(text,
              style: Styles.textStyle16.copyWith(
                color: Colors.white
              )),
            ),
            
          ),
    );
  }
}