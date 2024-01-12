import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor_app/controllers/auth_controllers.dart';
import 'package:multi_vendor_app/utils/custom_snackbar.dart';
import 'package:multi_vendor_app/view/buyers/auth/user_login_screen.dart';
class UserRegistrationScreen extends StatefulWidget {
   UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
   final AuthController _authController=AuthController();

  late String email;

  late String fullName;

  late String phone;

  late String password;
  bool _isLoading=false;
  Uint8List? _image;

  selectGalleryImage()async{
    Uint8List im=await _authController.pickProfileImage(ImageSource.gallery);
    setState(() {
      _image=im;
    });
  }


  _signUpUser()async{
    if(_formKey.currentState!.validate()){
      setState(() {
        _isLoading=true;
      });
      await _authController.signUpUsers(email, fullName, phone, password,_image).whenComplete(() {
        setState(() {
          _formKey.currentState!.reset();
          _isLoading=false;
        });
      });
      return showCustomSnackBar(context!, 'Account register successfully');

    }else{
      _isLoading=false;
      return showCustomSnackBar(context,'something went wrong! ');

    }




  }

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create Customer's Account",style: TextStyle(fontSize: 20),),
                Stack(
                  children: [
                    _image!=null?CircleAvatar(radius: 64,
                    backgroundColor: Colors.yellow.shade900,
                      backgroundImage: MemoryImage(_image!),
                    ):CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                      backgroundImage: const NetworkImage('https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'),

                    ),
                    Positioned(
                        right: 0,
                        left: 70,
                        top: 85,
                        bottom: 0,
                        child: IconButton(onPressed: (){
                          selectGalleryImage();
                        },icon: const Icon(CupertinoIcons.photo_camera,size: 30,),))
                  ],
                ),
                Padding(padding: const EdgeInsets.all(13),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter email';

                      }
                      return null;

                    },
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
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter your name';
                      }
                      return null;
                    },
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
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter your phone number';
                      }
                      return null;
                    },
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
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter your password';
                      }
                      return null;
                    },
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
                    child:_isLoading?const Center(child: CircularProgressIndicator()): const Center(child:  Text('Register',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.white,
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
                    }, child: const Text('login',style: TextStyle(decoration: TextDecoration.underline),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
