import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr/core/utlis/router.dart';

class Heder extends StatelessWidget {
  final Widget? body;
  const Heder({super.key, this.body, this.image, this.icon, });
  final image;
   final IconData? icon; 

  @override
  Widget build(BuildContext context) {
    return Container(
     
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 120,
          child: Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: GestureDetector(
                  onTap: (){
                    context.go(AppRouter.kLoginView);
                  },
                  child: Icon(
                    icon ?? Icons.login_outlined, 
                    color: Colors.white,
                    size: 28,
                  ),
                ),
            ),
          )
          
          ),
          
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 200,
                      right: 200,
                      top: 20,
                    ),
                    child: Divider(
                      thickness: 5,
                      radius: BorderRadius.circular(5),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.topRight,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(child: Image.asset(image)),
                    ),
                  ),
                  SizedBox(height: 50),
                  body!,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
