import 'package:flutter/material.dart';
import 'package:qr/core/helper/custom_button.dart';
import 'package:qr/core/helper/heder.dart';
import 'package:qr/core/helper/text_scan.dart';
import 'package:qr/core/utlis/assets.dart';
import 'package:qr/featuer/result/register_form_component.dart';


class ResultScanView extends StatelessWidget {
  const ResultScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Heder(
        image: AssetsData.p3,
        body: SingleChildScrollView(
          child: Column(
            
            children: [
              TextScan(
                text1: 'Scanning Result',
                text2:
                    'Proreader will keep your last 10 days history.\nPlease purchase our pro package for unlimited history.',
              ),
          //    const SizedBox(height: 20),
          
             
               ResultComponents(),
          
                    const SizedBox(height: 20),
              CustomButton(
                text: 'Back',
                onPressed: () {
                Navigator.pop(context);
                },
              ),
           //   const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
