import 'package:flutter/material.dart';
import 'package:qr/core/helper/custom_button.dart';
import 'package:qr/featuer/result/reselt_scan.dart';
import 'package:qr/featuer/scanqr/presentation/widgets/scan_camera.dart';


class ScanMy extends StatelessWidget {
  const ScanMy({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Center(
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             CustomButton(
               text: ' Open Camera',
               onPressed: () {
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (ctx) => const ScanPage()),
                 );
               },
             ),
             SizedBox(height: 20,),
             CustomButton(
               text: 'Result Scan',
               onPressed: () {
                
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (ctx) => const ResultScanView()),
                 );
               },
             ),
           ],
         ),
       );
    
  }
}
