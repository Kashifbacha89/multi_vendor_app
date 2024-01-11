import 'package:flutter/material.dart';
import 'package:multi_vendor_app/controllers/auth_controllers.dart';
import 'package:multi_vendor_app/utils/custom_snackbar.dart';
class UserLoginScreen extends StatefulWidget {
   const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  late String email;
  late String password;
  final AuthController _authController=AuthController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();


  loginUser()async{
    if(_formKey.currentState!.validate()){
      await _authController.loginUser(email, password);
      return showCustomSnackBar(context!, 'Login Successfully');

    }else{
      return showCustomSnackBar(context, 'something went wrong');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
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
                  validator: (value){
                    if(value!.isEmpty){
                      return 'please enter your email';
                    }else{
                      return null;
                    }
                  },
                  onChanged: (value){
                    email=value;

                  },
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
                  obscureText: true,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'please enter your password';
                    }else{
                      return null;
                    }
                  },
                  onChanged: (value){
                    password=value;

                  },
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
              GestureDetector(
                onTap: (){
                  loginUser();
                },
                child: Container(
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
      ),
    );
  }
}
