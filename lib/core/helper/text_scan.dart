import 'package:flutter/material.dart';
import 'package:qr/core/utlis/style.dart';

class TextScan extends StatelessWidget {
  final String text1;
  final String text2;
  const TextScan({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
      Text(text1 , style: Styles.textStyle16,),
    //  SizedBox(height: 30,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90),
        child: Text(text2,
        textAlign: TextAlign.center,
        style: Styles.textStyle12,
        
        ),
      )
     ],
    );
  }
}