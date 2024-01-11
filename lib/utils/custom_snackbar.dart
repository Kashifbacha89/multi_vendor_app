import 'package:flutter/material.dart';

showCustomSnackBar(context,String title){
  ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
          backgroundColor: Colors.yellow.shade900,
          content: Text(title,style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold),)));



}