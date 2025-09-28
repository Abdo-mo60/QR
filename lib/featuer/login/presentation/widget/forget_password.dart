import 'package:flutter/material.dart';
import 'package:qr/core/utlis/style.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
             children: [
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text('Forgot Password?' , style: Styles.textStyle14,),
                ))
             ],
    );
  }
}