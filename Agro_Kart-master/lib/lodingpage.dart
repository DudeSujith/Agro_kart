import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/AddProducts.dart';
import 'package:project/Main%20Page.dart';
import 'Cereals Page.dart';
import 'oilpage.dart';
import 'OthersPage.dart';
import 'WheatPage.dart';
import 'constants.dart';

import 'login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Landingpage extends StatelessWidget {


  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        // if snap chat has error
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done){
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,streamsnapshot){
              if(snapshot.hasError){
                return Scaffold(
                  body: Center(
                    child: Text('Error: ${streamsnapshot.error}'),
                  ),
                );
              }

              //connection is active user login
              if(streamsnapshot.connectionState == ConnectionState.active){
                User _user = streamsnapshot.data;
                if(_user == null){
                  return login();
                }else{
                  return MainPage();
                }
              }
               //checking the auth_state
              return Container(
                color: Colors.black,
                width: 300.0,
                height: 300.0,
                child: SpinKitCircle(
                  color: Colors.green,
                  size: 150.0,

                )
              );


            },
          );

        }
        //connecting to firebase
        return Scaffold(
          body: Center(
            child: Text('initialize app...',
              style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
