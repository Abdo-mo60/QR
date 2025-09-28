import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:qr/core/utlis/assets.dart';
import 'package:qr/core/utlis/style.dart';

class HederScrenWidget extends StatelessWidget {
  const HederScrenWidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       SvgPicture.asset(AssetsData.tap1,
              width: 470,
       
       ),
       Align(
        alignment: AlignmentGeometry.topRight,
         child: SvgPicture.asset(AssetsData.tap2,
           height: 180,    
         ),
       ),
       Align(
        alignment: AlignmentGeometry.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Text(text,
          style: Styles.textStyle24,),
        ))
      ]
    );
  }
}