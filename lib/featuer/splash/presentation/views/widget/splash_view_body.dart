
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qr/core/utlis/router.dart';

import '../../../../../core/utlis/assets.dart';

//import '../../../../home/presentation/views/home_view.dart' show HomeView;

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();

    // navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(AssetsData.qr),
        const SizedBox(height: 4),
       
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 3), () {
      

      GoRouter.of(context).push(AppRouter.kLoginView);
    });
  }
}
