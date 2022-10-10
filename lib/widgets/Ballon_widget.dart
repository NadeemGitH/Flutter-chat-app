import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';

class Baloon extends StatelessWidget {
  const Baloon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            left: Dimensions.height200,
            bottom: 0,
            child: Image.asset(
              'assets/image/splash2.png',
              height: Dimensions.height150,
              width: Dimensions.height200 + 50,
            ),
          ),
          Positioned(
            top: Dimensions.height200 - 20,
            child: Image.asset(
              'assets/image/splash21.png',
              height: Dimensions.height60 * 2,
              width: Dimensions.height110,
            ),
          ),
          Positioned(
            left: Dimensions.height106,
            top: Dimensions.height264 - 37,
            child: Image.asset(
              'assets/image/splash22.png',
              height: Dimensions.height60,
              width: Dimensions.height60,
            ),
          ),
        ],
      ),
    );
  }
}
