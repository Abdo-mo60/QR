import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr/core/utlis/assets.dart';
import 'package:qr/core/utlis/style.dart';

class HederScrenWidget extends StatefulWidget {
  const HederScrenWidget({super.key, required this.text});
  final String text;

  @override
  State<HederScrenWidget> createState() => _HederScrenWidgetState();
}

class _HederScrenWidgetState extends State<HederScrenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _dropAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _dropAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // start above screen
      end: Offset.zero,           // final position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,    // ✅ bounce effect when dropping
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _dropAnimation,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              AssetsData.tap1,
              width: 400,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AssetsData.tap2,
              height: 150,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Text(
                widget.text,
                style: Styles.textStyle24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
