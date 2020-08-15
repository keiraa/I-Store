import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../screens/ZIPScreen.dart';

void register(name,email,password,context)
async{

  FirebaseAuth _auth= FirebaseAuth.instance;
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    var user = result.user;
    var uid=user.uid;
    if (user != null) {
      print("registered successfully");
      FlutterToast.showToast(
        msg: "Registered Successfully",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 5,
      );

      Navigator.pushReplacement((context),MaterialPageRoute(builder:(context)=> ZIPScreen()));
      Firestore.instance.collection('users').document(uid).setData({
        "name":name,
         "pincode":"1002"
      });
    }
  }catch(e)
  {
    FlutterToast.showToast(
      msg: e,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 5,
    );
  }
}

void signin(email,password,context)
async{
  FirebaseAuth _auth= FirebaseAuth.instance;
  try {
    print(email);
    AuthResult result = await _auth.signInWithEmailAndPassword(email:email, password: password);
    var user = result.user;

    if (user != null) {
      print("Welcome To istore");
      FlutterToast.showToast(
        msg: 'Welcome to istore',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 5,
      );
      Navigator.pushReplacement((context),MaterialPageRoute(builder:(context)=> ZIPScreen()));
    }
  }catch(e)
  {
    print(e);
    FlutterToast.showToast(
      msg: "unknown error",
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 5,
    );
  }
}
