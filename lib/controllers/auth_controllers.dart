import 'package:firebase_auth/firebase_auth.dart';
class AuthController{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Future<String> signUpUsers(String email,String fullName,String phoneNumber,String password )async{
    String res='Some error occurred';
    try{
      if(email.isNotEmpty &&fullName.isNotEmpty &&phoneNumber.isNotEmpty&&password.isNotEmpty){
        //create user
        UserCredential userCred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
        res='User Login Successfully';


      }else{
        res='Please Field must be not empty';
      }

    }catch(e){}
    return res;
  }
}