import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/account_screen.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/cart_screen.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/categories_screen.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/home_screen.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/search_screen.dart';
import 'package:multi_vendor_app/view/buyers/nav_screens/store_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex=0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const StoreScreen(),
    const CartScreen(),
    const SearchScreen(),
    const AccountScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.yellow.shade900,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (value){
          setState(() {
            _pageIndex=value;
          });
        },
        items:  [
          const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'HOME'),
         // BottomNavigationBarItem(icon: Svg,label: 'HOME'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/explore.svg',width: 20,),
              label: 'CATEGORIES'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/shop.svg',width: 20,),
              label: 'STORE'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/cart.svg',width: 20,),
              label: 'CART'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/search.svg',width: 20,),
              label: 'SEARCH'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/account.svg',width: 20,),
              label: 'ACCOUNT'),



        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
