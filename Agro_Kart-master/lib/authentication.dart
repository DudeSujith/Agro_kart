import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: deprecated_member_use
  FirebaseUser user;


  Future User() async{

    final user = await _auth.currentUser;
    return user.email;
  }

  Future Signup(emailUp , passwordUp)async{
    try{
      final signup = await _auth.createUserWithEmailAndPassword(email: emailUp, password: passwordUp);
      if( signup != null){
        print('success signup');
      }
      final user = signup.user;
      return user;
    }
    catch(e){
      print(e);

    }
  }
  Future Signin( emailIn , passwordIn) async{
    try{
      final signin = await _auth.signInWithEmailAndPassword(email: emailIn, password: passwordIn);
      if( signin != null){
        print('success signin');
      }
      final user = signin.user;
      return user;
    }
    catch(e){
      print(e);
    }
  }
  Future Signout()async {
    try {
      await _auth.signOut();
    }
    catch(e) {
      print(e);
    }
  }

}