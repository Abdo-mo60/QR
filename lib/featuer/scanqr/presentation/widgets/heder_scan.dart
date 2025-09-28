import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:qr/core/utlis/assets.dart';

class HederScan extends StatelessWidget {
  const HederScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AssetsData.qr)
      ],
    );

  }
}
