import 'package:flutter/material.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/widgets/welcome_text.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height*1;
    final width=MediaQuery.sizeOf(context).width*1;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.04),
      child:  Column(
        children:[
          const WelcomeText(),
          SizedBox(height: height*.02,),
          const SearchInputWidget(),
        ]
      ),
    );
  }
}




