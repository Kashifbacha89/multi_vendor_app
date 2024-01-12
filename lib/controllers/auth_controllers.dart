import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
class AuthController{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final FirebaseStorage _storage=FirebaseStorage.instance;
  pickProfileImage(ImageSource source)async{
    final ImagePicker _imagePicker=ImagePicker();
    XFile? _file= await _imagePicker.pickImage(source: source);
    if(_file !=null){
      return await _file.readAsBytes();
    }else{
      print('no image is selected');
    }

  }
  //storage function
  _uploadProfileImageToStorage(Uint8List? image)async{
    Reference reference=_storage.ref('profilePics').child(_auth.currentUser!.uid);
    await reference.putData(image!);
    //TaskSnapshot snapshot=await uploadTask;
    //String downloadUrl=await snapshot.ref.getDownloadURL();
    final downloadUrl=await reference.getDownloadURL();
    return downloadUrl;

  }


  Future<String> signUpUsers(String email,String fullName,String phoneNumber,String password,Uint8List? image )async{
    String res='Some error occurred';
    try{
      if(email.isNotEmpty &&fullName.isNotEmpty &&phoneNumber.isNotEmpty&&password.isNotEmpty && image!=null){
        //create user
        UserCredential userCred=await _auth.createUserWithEmailAndPassword(email: email, password: password,);
        String profileImageUrl=await _uploadProfileImageToStorage(image);
        await _firestore.collection('buyers').doc(userCred.user!.uid).set({
          'email':email,
          'fullName':fullName,
          'phoneNumber':phoneNumber,
          'buyerId':userCred.user!.uid,
          'address':'',
          'profileImage':profileImageUrl

        });
        res='success';


      }else{
        res='Please Field must be not empty';
      }

    }catch(e){
      res=e.toString();
    }
    return res;
  }
  loginUser(String email,String password)async{
    String res='Something went wrong!';
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res='success';

      }else{
        res='field must not be empty';
      }
    }catch(e){
      res =e.toString();

    }
    return res;
  }
}