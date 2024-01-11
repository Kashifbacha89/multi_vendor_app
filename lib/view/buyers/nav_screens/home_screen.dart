import 'package:flutter/material.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/widgets/banner_widget.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/widgets/category_text.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/widgets/welcome_text.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height*1;
    final width=MediaQuery.sizeOf(context).width*1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const WelcomeText(),
        SizedBox(height: height*.02,),
        const SearchInputWidget(),
        const BannerWidget(),
         CategoryText(),
      ]
    );
  }
}




