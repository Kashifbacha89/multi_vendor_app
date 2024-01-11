import 'package:flutter/material.dart';
import 'package:multi_vendor_app/controllers/auth_controllers.dart';
import 'package:multi_vendor_app/view/buyers/auth/user_login_screen.dart';
class UserRegistrationScreen extends StatelessWidget {
   UserRegistrationScreen({Key? key}) : super(key: key);

   final AuthController _authController=AuthController();

  late String email;
  late String fullName;
  late String phone;
  late String password;
  _signUpUser()async{
    String res= await _authController.signUpUsers(email, fullName, phone, password);
    if(res!='success'){
      print(res);

    }else{
      print('GOOD');
    }


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Create Customer"s Account',style: TextStyle(fontSize: 20),),
              CircleAvatar(radius: 64,
              backgroundColor: Colors.yellow.shade900,
              ),
              Padding(padding: const EdgeInsets.all(13),
                child: TextFormField(
                  onChanged: (value){
                    email=value;
                  },
                  decoration:  InputDecoration(
                    labelText: 'Enter Email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(13),
                child: TextFormField(
                  onChanged: (value){
                    fullName=value;
                  },
                  decoration:  InputDecoration(
                    labelText: 'Enter Full Name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(13),
                child: TextFormField(
                  onChanged: (value){
                    phone=value;
                  },
                  decoration:  InputDecoration(
                    labelText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(13),
                child: TextFormField(
                  onChanged: (value){
                    password=value;
                  },
                  decoration:  InputDecoration(
                    labelText: 'Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _signUpUser();
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width-40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child:  Text('Register',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.white,
                  letterSpacing: 3
                  ),)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already Have an Account?'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const UserLoginScreen()));
                  }, child: const Text('login'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
