import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.image_outlined ,
         color: Colors.black54),
         Icon(Icons.adf_scanner_outlined,
         color: Colors.black54
         ),
        Icon(Icons.flash_on,
        color: Colors.black54,),
        
      ],
      ),
    );
  }
}