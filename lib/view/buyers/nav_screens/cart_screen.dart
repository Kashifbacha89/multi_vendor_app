import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your Shopping Cart is Empty',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 5
            ),),
            Container(
              width: MediaQuery.sizeOf(context).width-40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.yellow.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text('CONTINUE SHOPPING',style: TextStyle(
                fontSize: 19,
                color: Colors.white,
                letterSpacing: 2
              ),),),
            )

          ],
        ),
      ) ,
    );
  }
}
