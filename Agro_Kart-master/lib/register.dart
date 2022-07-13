import 'package:project/Main%20Page.dart';

import 'RoundedButton.dart';

import 'admin product.dart';
import 'authentication.dart';
import 'package:flutter/material.dart';


class registerpage extends StatefulWidget {
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  registration productServices = registration();
  final Name = TextEditingController();
  final Email = TextEditingController();
  final password = TextEditingController();
  final number = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    password.dispose();
    Email.dispose();
    number.dispose();
    Name.dispose();

    super.dispose();
  }

  String emailUp;
  String passwordup;
  String usernameUp;
  String Number;
  final _auth = authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          SizedBox(height: 60,),
          Text(
            'Hey There, \n Lets Sign up',
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 130.0,
          ),

          TextField(

            keyboardType: TextInputType.name,
            controller: Name,
            decoration: InputDecoration(
              labelText: 'User Name',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),

          ),
          SizedBox(
            height: 20.0,
          ),

          TextField(

            keyboardType: TextInputType.emailAddress,
            controller: Email,
            decoration: InputDecoration(
              labelText: 'E-mail',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onChanged: (value){
              emailUp = value;
            },
          ),

          SizedBox(
            height: 20.0,
          ),
          TextField(

            obscureText: true,
            controller: password,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),

            onChanged: (value){
              passwordup = value;
            },
          ),
          SizedBox(height: 20,),
          TextField(

            keyboardType: TextInputType.number,
            controller: number,
            decoration: InputDecoration(
              labelText: 'Mbl Number',
              errorText: _validate ? 'Value Can\'t Be Empty' : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),

          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          Roundedbuttons(
            onpressed: ()async{
              productServices.upLoadProduct(
                Name: Name.text,

                Email: Email.text,
                password:password.text,
                  mbl: number.text,

              );

              dynamic result = await _auth.Signup(emailUp, passwordup);
              if(result == null){
                print("result is null");
                setState(() {
                  Name.text.isEmpty ? _validate = true : _validate = false;
                  Email.text.isEmpty ? _validate = true : _validate = false;
                  password.text.isEmpty ? _validate = true : _validate = false;

                });
              }
              else{
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> MainPage(),
                ));
              }

            },
            colors: Colors.redAccent,
            text: 'Sign up',
            textcolor: Colors.white,
          ),
        ],
      ),
    );
  }
}
