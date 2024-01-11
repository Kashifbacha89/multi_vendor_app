import 'package:flutter/material.dart';
class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Customer's Account",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,

            ),),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration:  InputDecoration(
                  labelText: 'Enter Email Address',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration:  InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.sizeOf(context).width-40,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow.shade900,
              ),
              child: const Center(child: Text('Login',style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.w800,
                  letterSpacing: 5,color: Colors.white),),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Need An Account?'),
                TextButton(
                    onPressed: (){}, child:  const Text('Register',style: TextStyle(decoration: TextDecoration.underline),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
