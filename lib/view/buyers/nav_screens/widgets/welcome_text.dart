import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.sizeOf(context).width*1;
    final height=MediaQuery.sizeOf(context).height*1;
    return Padding(
      padding:  EdgeInsets.only(top:height*.03,left: width*.02,right: width*.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Howdy , What Are You\n Looking  For 👀',
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),
          ),
          Container(child: SvgPicture.asset('assets/icons/cart.svg',width: 30,),)
        ],
      ),
    );
  }
}