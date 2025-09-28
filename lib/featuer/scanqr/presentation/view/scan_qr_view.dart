import 'package:flutter/material.dart';

import 'package:qr/core/helper/heder.dart';
import 'package:qr/core/utlis/style.dart';
import 'package:qr/featuer/scanqr/presentation/widgets/heder_scan.dart';
import 'package:qr/core/helper/text_scan.dart';
import 'package:qr/core/utlis/assets.dart';
import 'package:qr/featuer/scanqr/presentation/widgets/icon_widget.dart';
import 'package:qr/featuer/scanqr/presentation/widgets/scan_my.dart';

class ScanQr extends StatelessWidget {
  const ScanQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Heder(
        image: AssetsData.p2,
        body: Expanded(
          child: Column(
            children: [
              TextScan(
                text1: 'Scan OR code',
                text2:
                    'Place qr code inside the frame to scan please avoid shake to get results quickly',
              ),
              SizedBox(height: 75),
              HederScan(),
              SizedBox(height: 17),
              Text('Scanning Code...', style: Styles.textStyle12),
              SizedBox(height: 27),
              IconWidget(),
              SizedBox(height: 27),
              ScanMy(),
            ],
          ),
        ),
      ),
    );
  }
}
